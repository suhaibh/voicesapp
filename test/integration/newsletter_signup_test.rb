require 'test_helper'

class NewsletterSignupTest < ActionDispatch::IntegrationTest
  test "invalid signup information" do
    get root_path
    assert_no_difference 'NewsletterSubscription.count' do
      post newsletter_subscriptions_path, newsletter_subscription: {email: "user@invalid"}
    end
    assert_template 'static_pages/home'
  end
  
  test "valid signup information" do
    get root_path
    assert_difference 'NewsletterSubscription.count', 1 do
      post_via_redirect newsletter_subscriptions_path, newsletter_subscription: {email: "user@example.com" }
    end
  end
end
