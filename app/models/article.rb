class Article < ApplicationRecord
  belongs_to :topic
  belongs_to :worker
  has_many :article_draft
  has_many :article_status
end
