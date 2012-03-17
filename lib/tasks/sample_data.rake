namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    admin = User.create!(name: "Admin User",
                 email: "venkat@solivar.com",
                 password: "foobar",
                 password_confirmation: "foobar",
		 role: "Admin User",
	         company: "Pivot It, Inc." )
    admin.toggle!(:admin)
    99.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@comp-#{n+1}.org"
      password  = "password"
      company = "Comp-#{n+1}"
      User.create!(name: name,
                   email: email,
                   password: password,
                   password_confirmation: password,
     		   role: "Business User",
	           company: company)
    end
  end
end
