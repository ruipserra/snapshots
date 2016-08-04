FactoryGirl.define do
  factory :snapshot do
    seconds { rand(Countdown::MIN_VAL..Countdown::MAX_VAL) }
  end
end
