class Comment < ActiveRecord::Base
  belongs_to :ad
  belongs_to :member
end
