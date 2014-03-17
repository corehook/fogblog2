class User < ActiveRecord::Base
    

	 attr_accessor :login
	 mount_uploader :avatar, AvatarUploader
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  validates :username, :uniqueness => { :case_sensitive => false },
  :format => { :with => /\A[A-z][A-z0-9_-].{4,20}\z/,
  :message => "Nickname should contain at least 4 characters, but not more than 20." }
 
  #validates_presence_of   :avatar
  #validates_integrity_of  :avatar
  #validates_processing_of :avatar
  def login=(login)
    @login = login
  end

  def login
    @login || self.username || self.email
  end

  def self.find_first_by_auth_conditions(warden_conditions)
      conditions = warden_conditions.dup
    if login = conditions.delete(:login)
        where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    else
        where(conditions).first
    end
  end


 
end
