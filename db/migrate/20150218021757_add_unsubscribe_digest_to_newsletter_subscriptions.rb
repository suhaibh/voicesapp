class AddUnsubscribeDigestToNewsletterSubscriptions < ActiveRecord::Migration
  def change
    add_column :newsletter_subscriptions, :unsubscribe_digest, :string
  end
end
