FactoryGirl.define do
  factory :snapshot do
    seconds { rand(Snapshot::MIN_VAL..Snapshot::MAX_VAL) }
  end
end
