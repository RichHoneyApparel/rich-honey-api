class AddGenderAndCustomerAddressToQuotes < ActiveRecord::Migration
  def change
    add_column :quotes, :gender, :string
  end
end
