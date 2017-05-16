FactoryGirl.define do
  factory :size_breakdown do
    xs 25
    s 50
    m 50
    l 25
    xl 50
    xxl 0
  end

  factory :label do
    sewing false
    creation true
  end

  factory :hangtag do
    placement true
    creation false
  end

  factory :quote do
    product_name 'MyString'
    product_style_num 'MyString'
    fabric 'MyString'
    color 'MyString'
    dye 'MyString'
    qty 150
    note 'MyText'
    size_breakdown { create(:size_breakdown) }
    label { create(:label) }
    hangtag { create(:hangtag) }
  end
end
