class Issue < ApplicationRecord
  belongs_to :user

  has_many :updates, :dependent => :destroy

  validates :title, presence: true, length: { maximum: 50 }
  validates :description, presence: true, length: { maximum: 200 }
end
