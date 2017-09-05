class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  enum role: [:admin, :preparer]
  has_one :preparer, :class_name => 'Preparer', :foreign_key => 'user_id'
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable
end
