class Comment < ActiveRecord::Base
  belongs_to :post

  validates_presence_of :username, :body
  validates_format_of :username, :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})/i
end
