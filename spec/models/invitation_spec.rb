require 'spec_helper'

describe Invitation do
  describe "Creating a new invitation" do
    before :each do
      @u1 = FactoryGirl.create(:user, id: 49)
      @u2 = FactoryGirl.create(:user, id: 68)
      @u3 = FactoryGirl.create(:user, id: 90)
      @e1 = FactoryGirl.create(:event, id: 10)
      @e2 = FactoryGirl.create(:event, id: 11)
      @i = Invitation.invite(@u1, @u2, @e1)
    end
    it "should belong to a valid user" do
      @u = User.find(49)
      @u.should eql(@u1)
    end
    it "should belong to a valid invited user" do
      @u = User.find(68)
      @u.should eql(@u2)
    end
    it "should have a valid event_id" do
      @e = Event.find(10)
      @e.should eql(@e1)
    end
    it "should have a valid status" do
      ['invited', 'confirmed'].should include(@i.status)
    end
    it "should not create an invitation if user id is identical" do
      before = Invitation.count
      Invitation.invite(@u1, @u1, @e1)
      after = Invitation.count
      after.should eql(before)
    end
    it "should not create an invitation if the same invitation exists" do
      before = Invitation.count
      Invitation.invite(@u1, @u2, @e1)
      after = Invitation.count
      after.should eql(before)
    end
    it "a user should be able to invite another user to multiple events" do
      before = Invitation.count
      Invitation.invite(@u1, @u2, @e2)
      after = Invitation.count
      after.should eql(before + 1)
    end
    it "a user should be able to accept invitations" do
      before = @i.status
      before.should eql('invited')
      Invitation.accept(@u1, @u2, @e1)
      @i = Invitation.find(@i)
      after = @i.status
      after.should eql('confirmed')
    end
  end
end
