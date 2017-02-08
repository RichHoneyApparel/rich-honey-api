FactoryGirl.define do
  factory :product_property do
    gender ['men', 'women', 'n/a']
    categories ['custom', 'activewear', 'accessories']
    dyes ['oil' ,'reactive', 'pigment']
    washes ['softener_enzyme', 'silicone', 'hot_wash', 'power_wash']
    fabrics ['cotton20', 'cotton30', 'cotton40', 'cotton_slub', 'french_terry', 'french_terry_slub', 'triblend']
  end

  factory :product_production_status do
    name { FFaker::Name.name }
    description { FFaker::Book.description }
    state 'current'
  end

  factory :product do
    name { FFaker::Name.name }
    qty { rand(1..130) }
    price { rand(0.25..2000) }
    product_production_status { create_list(:product_production_status, 3) }
    product_property { create(:product_property) }
  end
end
