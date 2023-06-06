class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  after_create :update_user_text_color

  has_many :messages

  def name
    email.split('@').first.capitalize
  end

  private

  def update_user_text_color
    self.update(text_color: "#" + "%06x" % (rand * 0xffffff))
  end
end
