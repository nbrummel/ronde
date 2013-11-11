require 'spec_helper'

describe Event do

  describe "Creating a new Event" do
    before :each do
      @u = FactoryGirl.create(:user, id: 10)
      t = 10.days.from_now
      @e, @f = Event.new_event({
                                 :description => "Ronde_Description",
                                 :location => "Ronde_Place",
                                 :name => "Ronde_Event",
                                 :start => t,
                                 :end => t + 15.minutes,
                                 :public => false,
                                 :event_type => :other,
                                 },
                               @u)
    end

    it "should allow the creation of a valid event" do
      @e.save
      @e.should be_valid
    end
    it "should only public or private" do
      [true, false].should include(@e.public)
    end
    it "should belong to a valid user" do
      User.find(@u).should_not be_nil
    end
    it "should probably raise flags for invalid fields" do
      @e2, @f2 = Event.new_event({
                                   :description => nil,
                                   :location => nil,
                                   :event_type => nil,
                                   :name => nil,
                                   :start => Time.new(2013, 11, 10, 6, 15)
                                 }, @u)
      @f2.empty?.should_not be true
    end
  end
end
