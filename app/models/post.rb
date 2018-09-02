class Post < ActiveRecord::Base
  belongs_to :user

  has_one :replying, through: :replying_relationships, source: :main_post
  has_one :replying_relationships, class_name: 'ReplyRelationship',
                                   foreign_key: 'reply_post_id',
                                   dependent: :destroy

  has_many :replied, through: :replied_relationships, source: :reply_post
  has_many :replied_relationships, class_name: 'ReplyRelationship',
                                   foreign_key: 'main_post_id',
                                   dependent: :destroy

  has_many :likes, dependent: :destroy

  has_one :sharing, through: :sharing_relationships, source: :origin_post
  has_one :sharing_relationships, class_name: "Share",
                                  foreign_key: "share_post_id",
                                  dependent: :destroy

  has_many :shared, through: :shared_relationships, source: :share_post
  has_many :shared_relationships, class_name: "Share",
                                  foreign_key: "origin_post_id",
                                  dependent: :destroy
end
