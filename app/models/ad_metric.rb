class AdMetric < ApplicationRecord
  belongs_to :ad_account
  belongs_to :user

  # atributos sugeridos: date:date, impressions:integer, clicks:integer, spend:decimal
  validates :date, presence: true
end
