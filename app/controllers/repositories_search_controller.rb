class RepositoriesSearchController < ApplicationController

  def index
    res = GithubApi::RepositoriesSearchRepository.search(repositories_search_params.to_h)

    render json: RepositorySerializer.new(res[:resources], meta: { page: res[:page], total_pages: res[:total_pages] }).serializable_hash
  end

  private

  def repositories_search_params
    params.permit([:keywords, :sort, :order, :page, :language, :user])
  end
end

