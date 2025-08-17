class AdAccount < ApplicationRecord
  belongs_to :user
  has_many :ad_metrics, dependent: :destroy

  # atributos sugeridos: provider (facebook/tiktok), account_id, access_token, expires_at
  validates :provider, :account_id, presence: true
end
