class Campaign < ActiveRecord::Base

    belongs_to :list
    has_many :deliveries

    validates :name, presence: true, uniqueness: true
    validates :subject, presence: true
    validates :body, presence: true

    def formated_body(token)
      formated_body = body.gsub('||WB||', "<img src=\"#{APP_CONFIG['base_url']}/open/#{token}\" width=\"1\" height=\"1\" />")
      formated_body = formated_body.gsub('||UNSUB||', "#{APP_CONFIG['base_url']}/unsubscribe/#{token}")
      formated_body = formated_body.gsub('||LINK||', "#{APP_CONFIG['base_url']}/click/#{token}?link=")
      formated_body
    end

    def preview
      formated_body('0')
    end

end
