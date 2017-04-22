class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :orders

  # Skips individual validations during signup.
  attr_accessor :skip_info
  validates :name, presence: true, length: { maximum: 50 }, unless: :skip_info
  validates :address, presence: true, length: { maximum: 255 }, unless: :skip_info
  validates :city,  presence: true, length: { maximum: 50 }, unless: :skip_info
  validates :zip,  presence: true, numericality: { greater_than: 1000 }, unless: :skip_info
  validates :country,  presence: true,
                       inclusion: { in: %w{Germany Austria Belgium France Italy Netherlands Poland Spain Switzerland} },
                       unless: :skip_info
end
