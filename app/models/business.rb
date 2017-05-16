class Business < ActiveRecord::Base
  belongs_to :users, foreign_key: :users_id
end
