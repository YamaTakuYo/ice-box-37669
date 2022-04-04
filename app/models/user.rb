class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
        
        with_options presence: true do
          validates :nickname
          validates :answer
        end
          
        validates :secret_id, numericality: { other_than: 1 , message: "can't be blank"} 

        extend ActiveHash::Associations::ActiveRecordExtensions
          belongs_to :secret
        
end
