namespace :db do
  desc "Create admin user"
  task populate: :environment do
    User.create!(email: "swm85@cornell.edu",
                 first_name: "Shane",
                 last_name: "Moore",
                 password: "CRrocks123",
                 password_confirmation: "CRrocks123",
                 level: 0)
  end
end