class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  after_create :update_user_text_color

  has_many :messages

  before_update :broadcast_logged_in_user, if: :user_logged_in?
  before_update :broadcast_logged_out_user, if: :user_logged_out?

  def name
    email.split('@').first.capitalize
  end

  private

  def broadcast_logged_in_user
    broadcast_append_to "users_stream", partial: "users/user", locals: { user: self }, target: "users"
  end

  def broadcast_logged_out_user
    broadcast_remove_to "users_stream"
  end

  def user_logged_in?
    self.logged_in_changed? && self.logged_in == true
  end

  def user_logged_out?
    self.logged_in_changed? && self.logged_in == false
  end

  def update_user_text_color
    self.update(text_color: "#" + "%06x" % (rand * 0xffffff))
  end
end
