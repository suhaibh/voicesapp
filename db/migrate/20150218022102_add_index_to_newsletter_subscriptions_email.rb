class AddIndexToNewsletterSubscriptionsEmail < ActiveRecord::Migration
  def change
    add_index :newsletter_subscriptions, :email, unique: true
  end
end
