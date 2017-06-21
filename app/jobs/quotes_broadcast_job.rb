class QuotesBroadcastJob < ApplicationJob
  queue_as :default

  def perform(quotes)
    ActionCable.server.broadcast "quotes_channel", quotes: render_quotes(quotes)
  end

  private

  def render_quotes(quotes)
    ApplicationController.renderer.render(partial: 'quotes/quote', collection: quotes )
  end
end
