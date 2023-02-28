# frozen_string_literal: true

# ログインで使用されるUser情報
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :timeoutable

  def admin?
    admin == true
  end

  def timeout_in
    if admin?
      20.minutes
    else
      1.year
    end
  end
end
