class Post < ActiveRecord::Base
  validates :link, presence: true, :format => URI::regexp(%w(http https))
  validates :description, presence: true
  belongs_to :user
end