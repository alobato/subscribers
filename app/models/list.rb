class List < ActiveRecord::Base

    has_many :subscribers, dependent: :destroy

    validates :name, presence: true, uniqueness: true

end
