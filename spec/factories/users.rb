FactoryBot.define do
  factory :user do
    name { 'MyString' }
    email { 'johndoe@example.com' } # a valid email address
    password { 'password' }
  end
end
