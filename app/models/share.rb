class Share < ActiveRecord::Base
  belongs_to :origin_post, class_name: "Post"
  belongs_to :share_post, class_name: "Post"
end
