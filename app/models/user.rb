class User < ApplicationRecord
  has_secure_password
  before_save :downcase_email

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true
  validates_uniqueness_of :email, case_sensitive: false
  validates_format_of :email, with: /@/

  def downcase_email
    self.email = self.email.delete(' ').downcase
  end
end
