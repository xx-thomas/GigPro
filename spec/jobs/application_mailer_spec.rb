require 'rails_helper'

RSpec.describe ApplicationMailer, type: :mailer do
  it 'inherits from ActionMailer::Base' do
    expect(ApplicationMailer).to be < ActionMailer::Base
  end

  it 'has default "from" address' do
    expect(ApplicationMailer.default[:from]).to eq 'from@example.com'
  end

  it 'uses "mailer" layout by default' do
    expect(ApplicationMailer.default[:layout]).to eq nil
  end
end
