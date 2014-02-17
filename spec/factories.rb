FactoryGirl.define do

  factory :user do
    sequence(:name)  { |n| "Person #{n}" }
    sequence(:email) { |n| "person_#{n}@example.com"}
    password "foobarbaz123"
    password_confirmation "foobarbaz123"
  end

  factory :item do
    sequence(:height) { |n| n }
    sequence(:width) { |n| n }
    sequence(:weight) { |n| n }
  end

  factory :voucher do
    expiration_date Date.today + 30
  end

  factory :experience do
    latitude 50.00
    longitude 50.00
    sequence(:contact_name) { |n| "Person #{n}" }
  end

  factory :donation do
    sequence(:title) { |n| "Title #{n}" }
    sequence(:description) { |n| "Description #{n}" }
    user
    factory :item_donation do
      association :donatable, factory: :item
    end
    factory :voucher_donation do
      association :donatable, factory: :voucher
    end
    factory :experience_donation do
      association :donatable, factory: :experience
    end
  end

end