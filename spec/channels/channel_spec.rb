require 'rails_helper'

RSpec.describe ApplicationCable::Channel, type: :channel do
  let(:user) { create(:user) }

  it 'subscribes to the channel' do
    subscribe(user_id: user.id)
    expect(subscription).to be_confirmed
  end
end
