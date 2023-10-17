class TweetJob < ApplicationJob
  queue_as :default

  def perform(tweet)
    return if tweet.published?
    #Reschedule a tweet to be published in the future if the publish_at date is in the future
    return if tweet.publish_at > Time.current

    tweet.publish_to_twitter! 
    # Do something later
  end
end



