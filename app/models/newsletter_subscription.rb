class NewsletterSubscription < ActiveRecord::Base
  # create unsubscribe_digest migration
  attr_accessor :unsubscribe_token
  after_create  :create_unsubscribe_digest
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, format: {with: VALID_EMAIL_REGEX},
                    uniqueness: { case_sensitive: false }
                    
  def NewsletterSubscription.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end
  
  def NewsletterSubscription.new_token
    SecureRandom.urlsafe_base64
  end
  
  def create_unsubscribe_digest
    self.unsubscribe_token = NewsletterSubscription.new_token
    update_attribute(:unsubscribe_digest, NewsletterSubscription.digest(unsubscribe_token))
  end
  
end
