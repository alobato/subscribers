class Sender

  def self.deliver_email(to, from, reply_to, subject, body, body_txt, token)
    ActionMailer::Base::mail({
      from: from,
      to: to.downcase,
      subject: subject,
      body: body,
      content_type: 'text/html; charset=UTF-8',
      :'Return-Path' => "bounce+#{token}@#{APP_CONFIG['domain']}",
      :'List-Unsubscribe' => "<mailto:unsubscribe-#{token}@#{APP_CONFIG['domain']}>, <#{APP_CONFIG['base_url']}/campagne/unsubscribe/#{token}>"
    }).deliver
  end

end
