class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  LANGUAGES = ["English", "French", "Spanish", "German", "Italian", "Japanese", "Korean", "Mandarin", "Portuguese",
               "Russian", "Simplified Chinese", "Traditional Chinese", "Vietnamese"]

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :bookings, dependent: :destroy
  has_many :tours, through: :bookings
  has_one_attached :photo
  has_many :tours, dependent: :destroy
  validates :email, presence: true
  validates :encrypted_password, presence: true
  validates :age, presence: true, numericality: { only_integer: true }
  validates :guide, inclusion: { in: [true, false] }
  validates :language, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
end
