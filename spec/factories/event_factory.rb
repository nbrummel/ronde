FactoryGirl.define do

  factory :event do
    created_by { FactoryGirl.create(:user)}
    description 'RondeDescription'
    location 'RondeLocation'
    name 'RondeEvent'
    start Time.new(2013, 11, 9, 6, 0, 0, "-07:00")
    event_type 'other'
  end
end

