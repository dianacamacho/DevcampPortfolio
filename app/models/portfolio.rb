class Portfolio < ApplicationRecord
  include Placeholder
  validates :title, :body, :main_image, :thumb_image, presence: true
  has_many :technologies, dependent: :destroy
  accepts_nested_attributes_for :technologies, reject_if: lambda { |attrs| attrs['name'].blank? }
  after_initialize :set_defaults
  scope :ruby_on_rails_portfolio_items, -> { where(subtitle: 'Ruby on Rails') }
  mount_uploader :thumb_image, PortfolioUploader
  mount_uploader :main_image, PortfolioUploader

  def set_defaults
    self.main_image ||= Placeholder.image_generator(height: '600', width: '400')
    self.thumb_image ||= Placeholder.image_generator(height: '350', width: '200')
  end

  def self.by_position
    order(:position)
  end
end
