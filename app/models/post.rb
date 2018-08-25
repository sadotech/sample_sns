class Post < ActiveRecord::Base
  belongs_to :user

  has_many :replied_relationships, class_name: 'ReplyRelationship',
                                   foreign_key: 'replied_id',
                                   dependent: :destroy
  has_many :replying_relationships, class_name: 'ReplyRelationship',
                                    foreign_key: 'replying_id',
                                    dependent: :destroy
  has_many :replied, through: :replied_relationships, source: :reply_post
  has_many :replying, through: :replying_relationships, source: :main_post
end
