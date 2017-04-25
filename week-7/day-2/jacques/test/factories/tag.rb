FactoryGirl.define do
  factory :tag do
    name { Faker::Company.buzzword.gsub(%r(\s), "_") }
  end
end
