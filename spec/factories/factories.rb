FactoryGirl.define do
  factory :car do
    sequence(:slug) { |n| "car_slug_#{n}" }
    sequence(:max_speed) { |n| n * 15 }
  end

  factory :track do
    sequence(:name) { |n| "track_#{n}" }
    surface_type 0
  end
end