FactoryGirl.define do
  factory :invitation do
    user nil
    team nil
  end
  factory :user do
    email "MyString"
    invited false
    team nil
  end
  factory :team do
    name "MyString"
  end

  factory :magazine do
    name "The Ruby Times"
  end

  factory :person do
  end

  factory :subscription do
    person
    magazine
  end
end
