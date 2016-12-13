class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessor :house_code
  validate :house_code_valid, :on => :create

  has_many :announcements
  has_many :issues
  has_many :updates

  def house_code_valid
    unless self.house_code == "851California"
      self.errors.add(:house_code, "invalid.  Ask Alex or try again.")
    end
  end
end
