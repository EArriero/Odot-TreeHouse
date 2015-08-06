# Comment. We added Factory Girl to our application to add test factories.
FactoryGirl.define do
  # Comment. factory :user do creates the "User"factory.
  factory :user do
    first_name  "First"
    last_name   "Last"
    sequence(:email) { |n| "user#{n}@odot.com" }
    password    "treehouse1"
    password_confirmation "treehouse1"
  end

  factory :todo_list do
    title  "Todo List Title"
    user
  end

  factory :todo_item do
    content "Todo Item"
  end
end