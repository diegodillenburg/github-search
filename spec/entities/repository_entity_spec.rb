require 'rails_helper'

RSpec.describe RepositoryEntity, type: :entity do
  let(:params) do
    {
      name: 'repository',
      description: 'A description',
      stargazers_count: 3,
      forks: 1,
      owner: { 'login' => 'someuser' }
    }.stringify_keys
  end

  subject { described_class.new(params) }

  describe 'attributes' do
    it { is_expected.to respond_to :name }
    it { is_expected.to respond_to :description }
    it { is_expected.to respond_to :stars }
    it { is_expected.to respond_to :forks }
    it { is_expected.to respond_to :author }
  end
end
