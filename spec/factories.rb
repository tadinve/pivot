FactoryGirl.define do
   factory :user do
      name "Venkat"
      email "venkat@example.com"
      password "foobar"
      password_confirmation "foobar"
      role "Business User"
      company "Apple"
   end
end
