class Advertiser < ActiveRecord::Base
  
  devise :database_authenticatable, :registerable, :lockable,
         :recoverable, :rememberable, :trackable, :validatable
  
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name, :cnpj, :website_url, :xml_url
  
end