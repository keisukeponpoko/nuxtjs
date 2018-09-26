class Topic < ApplicationRecord
  has_one :article
  has_many :worker_desire_topic
end
