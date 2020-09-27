FactoryBot.define do
  factory :user, class: User do
    name 'user01'
    email 'user01@example.com'
    password '123456'
  end

  factory :user02, class: User do
    name 'user02'
    email 'user02@example.com'
    password '123456'
  end

end
