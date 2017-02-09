require 'rails_helper'

RSpec.describe Product, type: :model do
  before { @product = FactoryGirl.build(:product) }
  subject { @product }

  it { should respond_to(:name) }
  it { should respond_to(:qty) }
  it { should respond_to(:price) }

  it { should be_valid }
end
