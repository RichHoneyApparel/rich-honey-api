require 'rails_helper'

RSpec.describe Quote, type: :model do
  before { @quote = FactoryGirl.build(:quote) }

  subject { @quote }
  it { should respond_to(:product_name) }
end
