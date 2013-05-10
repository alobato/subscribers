class SenderWorker
  include Sidekiq::Worker

  def generate_token
    token = rand(36**18).to_s(36)
    token = token.gsub('+', '')
    while Delivery.where(token: token).first do
      token = rand(36**18).to_s(36)
    end
    token
  end

  def perform(campaign_id)
    ActiveSupport::BufferedLogger.new(Rails.root.join('log/sidekiq.log')).info([Time.now.iso8601, $$, "I", "---PERFORM---", campaign_id].join("\t"))

    campaign = Campaign.find(campaign_id)

    subscribers = campaign.list.subscribers
    subscribers = subscribers.sort_by {rand} # shuffle

    subscribers.each do |subscriber|
      next if campaign.deliveries.where(subscriber_id: subscriber.id).first
      token = generate_token

      Sender.deliver_email(
        subscriber.email,
        campaign.from,
        campaign.reply_to,
        campaign.subject,
        campaign.formated_body(token),
        campaign.body_txt,
        token
      )

      sleep(0.2)

      campaign.deliveries.create(subscriber_id: subscriber.id, email: subscriber.email, token: token)
    end
  end

end
