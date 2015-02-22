class NewsletterSubscriptionsController < ApplicationController
  
  def create
    @newsletter_subscription = NewsletterSubscription.new(newsletter_subscription_params
    )
    if @newsletter_subscription.save
      flash[:success] = "You're all signed up!"
      redirect_to root_url
      
    else
      render 'static_pages/home'
    end
    
  end
  
  private
    
    def newsletter_subscription_params
      params.require(:newsletter_subscription).permit(:email)
    end
  
end
