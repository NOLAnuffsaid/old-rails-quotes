require 'rails_helper'

RSpec.describe QuotesController, type: :controller do

  describe "GET #quotes" do
    it { response.body.class == JSON }
  end

end
