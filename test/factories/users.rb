FactoryGirl.define do
  factory :user do
    first_name            "Joe"
    last_name             "Bianchi"
    age                   25
    sex                   "male"
    email                 "joe@gmail.com"
    phone                 "9057879000"
    role                  "mentor"
    password              "password"
    password_confirmation "password"


    trait :alex do
      first_name "alex"
      age         "30"
      email       "joe@gmailcom"
      role        "crack"
    end
  end
end
