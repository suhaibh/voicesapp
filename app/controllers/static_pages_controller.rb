class StaticPagesController < ApplicationController
  
  def home
    @newsletter_subscription = NewsletterSubscription.new
  end
  
  def about
  end
  
  def contact
  end
  
end
