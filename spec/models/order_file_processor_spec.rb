require 'spec_helper'

describe OrderFileProcessor do
  it 'should be creatable without any attributes' do
    uploader = OrderFileProcessor.new
    expect(uploader).not_to be_nil
  end

  context 'when given a valid flie' do
    let (:file) do
      path = fixture_path + '/single_order.tab'
      Rack::Test::UploadedFile.new(path, 'text/plain')
    end

    describe '#process' do
      it 'should create the orders described by the file' do
        processor = OrderFileProcessor.new(file: file)
        expect { processor.process }.to change(Order, :count).by(1)
      end
    end
  end
end
