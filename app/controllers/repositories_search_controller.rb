class RepositoriesSearchController < ApplicationController

  def index
    res = GithubApi::RepositoriesSearchRepository.search(repositories_search_params.to_h)

    render json: { resources: res }
  end

  private

  def repositories_search_params
    params.permit([:keywords, :sort, :order, :page, :language, :user])
  end
end
