class Hangtag < ActiveRecord::Base
  belongs_to :quote, foreign_key: :quote_id
end