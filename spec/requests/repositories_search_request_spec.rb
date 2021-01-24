require 'rails_helper'

RSpec.describe 'api/v1/search', type: :request, swagger: true do
  path '/api/v1/search' do
    get 'List repositories' do
      tags 'Repositories'
      produces 'application/json'
      parameter name: :keywords, in: :path, schema: {
        type: :string,
      }
      parameter name: :language, in: :path, type: :string
      parameter name: :user, in: :path, type: :string
      parameter name: :sort, in: :path, type: :string, enum: [:stars, :forks, :updated]
      parameter name: :order, in: :path, type: :string, enum: [:asc, :desc]
      parameter name: :page, in: :path, type: :integer

      response '200', 'repositories found' do
        schema type: :object,
          properties: {
          data: { type: :object,
                  properties: {
            id: { type: :integer },
            type: { type: :string },
            attributes: { type: :object,
                          properties: {
              name: { type: :string },
              description: { type: :string },
              author: { type: :string },
              stars: { type: :integer },
              forks: { type: :integer },
              updated_at: { type: :string }
            }
            }
          }
          },
          meta: { type: :object,
                  properties: {
            page: { type: :integer },
            total_pages: { type: :integer }
          },
          }
        }

        let(:keywords) { 'tetris' }
        let(:language) { 'Ruby' }
        let(:sort) { 'stars' }
        let(:order) { 'asc' }
        let(:page) { 1 }

        run_test!
      end
    end
  end
end
