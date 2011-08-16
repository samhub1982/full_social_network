class Code < ActiveRecord::Base
  attr_accessor :code
  attr_accessible :code
  
  validates :code, :presence => true
  
  before_save :encrypt_code
  
  def has_code?(submitted_code)
    encrypted_code == encrypt(submitted_code)
  end
  
  private
  
    def encrypt_code
      self.salt = make_salt if new_record?
      self.encrypted_code = encrypt(code)
    end
  
    def encrypt(string)
      secure_hash("#{salt}--#{string}")
    end
    
    def make_salt
      secure_hash("#{Time.now.utc}--#{code}")
    end
    
    def secure_hash(string)
      Digest::SHA2.hexdigest(string)
    end
end
