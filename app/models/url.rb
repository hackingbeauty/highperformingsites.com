class Url < ActiveRecord::Base
  has_many :yslows
  has_many :yslow2s
  has_many :page_speeds
  belongs_to :user
  
  def self.per_page
    50
  end
  
end
