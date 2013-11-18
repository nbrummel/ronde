# This defines the User class
FactoryGirl.define do
  sequence(:number) {|n| n}

  factory :user do
    first_name "First_#{:id}"
    last_name  "Last_#{:id}"
    email {|u| "ronde#{FactoryGirl.generate(:number)}@gmail.com"}
    password "password"
    phone_number "510-555-5555"
  end
end
