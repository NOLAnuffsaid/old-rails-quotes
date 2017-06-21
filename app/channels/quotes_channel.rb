class QuotesChannel < ApplicationCable::Channel

  def subscribed
    stream_from 'quotes_channel'
    broadcast_quotes
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
    stop_all_streams
  end

  private

  def broadcast_quotes
    ActionCable.server.broadcast 'quotes_channel', render_stored_quotes
  end

  def render_stored_quotes
    qs = Quote.all.as_json(except: %w[created_at updated_at id])
    ApplicationController.renderer.render json: qs
  end
end
