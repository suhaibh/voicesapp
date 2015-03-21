class StaticPagesController < ApplicationController
  
  def home
    @newsletter_subscription = NewsletterSubscription.new
    @my_reps = Congress.legislators_locate("11040")
  end
  
  def about
  end
  
  def contact
  end
  
end
