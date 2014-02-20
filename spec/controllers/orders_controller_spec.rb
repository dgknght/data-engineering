require 'spec_helper'

describe OrdersController do

  describe "GET 'index'" do
    it 'should be successful' do
      get 'index'
      response.should be_success
    end
  end

  describe 'POST :upload' do
    let (:file) { Rack::Test::UploadedFile.new("#{::Rails.root}/spec/fixtures/single_order.tab") }

    it 'should rediret to the index page' do
      post :upload, upload: { file: file }
    end
  end
end
