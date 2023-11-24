require 'rails_helper'

RSpec.describe ApplicationRecord, type: :model do
  it 'is a valid abstract model' do
    expect(ApplicationRecord.abstract_class).to be(true)
  end
end
