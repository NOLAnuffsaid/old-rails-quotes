require 'quote_api'

class QuotesController < ApplicationController
  attr_reader :quotes
  before_action :quotes_call

  def index
    @quotes = Quote.all
    render formats: :json
  end

  private

  def quotes_call
    QuotesApi.new.get_quotes
  end
end
