require 'rails_helper'

RSpec.describe RepositoryEntity, type: :entity do
  subject { described_class }

  describe 'attributes' do
    it { is_expected.to respond_to :name }
    it { is_expected.to respond_to :description }
    it { is_expected.to respond_to :stars }
    it { is_expected.to respond_to :forks }
    it { is_expected.to respond_to :author }
  end
end
