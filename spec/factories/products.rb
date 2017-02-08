FactoryGirl.define do
  factory :product_property do
    gender { FFaker::Name.name }
    category { FFaker::Name.name }
    dye { FFaker::Name.name }
    wash { FFaker::Name.name }
    fabric { FFaker::Name.name }
  end

  factory :product_production_status do
    name { FFaker::Name.name }
    description { FFaker::Company.catch_phrase }
    state 'current'
  end

  factory :product do
    name { FFaker::Name.name }
    qty { rand(1..130) }
    price { rand(0.25..2000) }
    product_production_statuses { create_list(:product_production_status, 3) }
    product_property { create(:product_property) }
  end
end
