class User < ApplicationRecord
  extend Devise::Models
  # before_action :authenticate_user!
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :posts
  validates :name, presence: true
  validates :phone, presence: true
  enum role: {Administrator: 1, General: 2}
  def self.search(search)
    if search
      search_user=User.find_by(name: search)
      if search_user
        self.where(id: search_user.id)
      else
        @users=User.all
      end
    end
  end
end
