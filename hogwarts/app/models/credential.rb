class Credential < ActiveRecord::Base

  belongs_to :customer

  validates :userName, :passQuestion, :passQuestionAnswerHash, presence: true

  #has_secure_password  #first got could not find bcrypt messages and then I learnt that only older versions use this function

  #validates :password_digest, presence: true, length: {minimum: 6}

  validates :passwordHash, :passwordHashAgain, presence: true, length: {minimum: 6}

  #Custom validation to veryify that the user reenters the same password again
  validate :passwordValidationTrue

  def passwordValidationTrue
     if passwordHash.present? && passwordHashAgain.present? && passwordHash != passwordHashAgain
        errors.add(:passwordHashAgain, "Albus Dumbledore says your passwords don't match!")
     end
  end

  before_save :encrypt_passQuestionAnswer
  before_save :encrypt_passwordHash
  before_save :encrypt_passwordHashAgain
   
  def self.passwordHash_authenicate(currentUser,passwordHash)
     user = find_by userName: currentUser
     return user if user && user.passwordIsAuthenticated?(passwordHash)
  end

  def self.passQuestionAnswer_authenicate(currentUser,passQuestionAnswerHash)
    user = find_by userName: currentUser
    return user if user && user.qIsAuthenticated?(passQuestionAnswerHash)
  end

 def passwordIsAuthenticated?(authenticate_string)
     self.passwordHash == encrypt_string(authenticate_string)
 end

 def qIsAuthenticated?(authenticate_string)
     self.passQuestionAnswerHash == encrypt_string(authenticate_string)
 end

  def encrypt_passwordHash
    return if passwordHash.blank?
    self.passwordHash = encrypt_string(passwordHash)
  end

 def encrypt_passwordHashAgain
    return if passwordHashAgain.blank?
    self.passwordHashAgain = encrypt_string(passwordHashAgain)
  end

  def encrypt_passQuestionAnswer
    return if passQuestionAnswerHash.blank?
    self.passQuestionAnswerHash = encrypt_string(passQuestionAnswerHash)
  end

  protected

  def encrypt_string(string)
    Digest::SHA1.hexdigest(string)
  end

 end

