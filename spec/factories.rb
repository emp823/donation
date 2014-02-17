FactoryGirl.define do

  factory :user do
    sequence(:name)  { |n| "Person #{n}" }
    sequence(:email) { |n| "person_#{n}@example.com"}
    password "foobarbaz123"
    password_confirmation "foobarbaz123"
  end

  factory :item do
    height rand(100)
    width rand(100)
    weight rand(100)
  end

  factory :voucher do
    expiration_date Date.today + 30
  end

  factory :experience do
    latitude rand() * 90
    longitude rand() * 180
    sequence(:contact_name) { |n| "Person #{n}" }
  end

  factory :donation do |d|
    sequence(:title) { |n| "Title #{n}" }
    sequence(:description) { |n| "Description #{n}" }
    user
    :item_donation do
      association :donatable, factory: :item
    end
    :voucher_donation do
      association :donatable, factory: :item
    end
    :experience_donation do
      association :donatable, factory: :item
    end
  end

end