class Quote < ApplicationRecord
  validates_presence_of :quote, :author, :category

  after_create_commit { QuotesBroadcastJob.perform_now self }
end
