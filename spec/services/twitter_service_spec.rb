require 'rails_helper'

RSpec.describe TwitterService, type: :service do
  describe '#TwitterService' do
    it 'not raise error on tweet' do
      expect { TwitterService.new.tweet('This is a test!') }.not_to raise_error
    end
  end
end
