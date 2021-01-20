module GithubApi
  class RepositoriesSearchService
    include HTTParty
    BASE_URL = 'https://api.github.com'
    GITHUB_API_TOKEN = ENV['GITHUB_API_TOKEN']

    class << self
      def search_repositories(q)
        new(q).search_repositories
      end
    end

    def initialize(q)
      @q = q
      @headers = {
        'Accept' => 'application/vnd.github.v3+json'
      }
      @auth = {
        username: 'diegodillenburg',
        password: GITHUB_API_TOKEN
      }
    end

    def search_repositories
      HTTParty.get("#{BASE_URL}/search/repositories?q=#{@q}", headers: @headers, basic_auth: @auth)
    end
  end
end

