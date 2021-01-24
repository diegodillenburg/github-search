module GithubApi
  class RepositoriesSearchService
    include HTTParty
    BASE_URL = 'https://api.github.com'
    GITHUB_API_TOKEN = ENV['GITHUB_API_TOKEN']
    GITHUB_API_USERNAME = ENV['GITHUB_API_USERNAME']

    class << self
      def search_repositories(q, sort, order, page)
        new(q, sort, order, page).search_repositories
      end
    end

    def initialize(q=nil, sort, order, page)
      @q = "#{q} is:public"
      @sort = sort
      @order = order
      @page = page
      @headers = {
        'Accept' => 'application/vnd.github.v3+json'
      }
      @auth = {
        username: GITHUB_API_USERNAME,
        password: GITHUB_API_TOKEN
      }
    end

    def search_repositories
      HTTParty.get("#{BASE_URL}/search/repositories?q=#{@q}&sort=#{@sort}&order=#{@order}&page=#{@page}&per_page=10",
                   headers: @headers, basic_auth: @auth)
    end
  end
end

