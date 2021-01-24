module GithubApi
  class RepositoriesSearchRepository
    
    class << self
      
      def search(params)
        params = default_values(params)
        query = build_query(params) 

        GithubApi::RepositoriesSearchService.search_repositories(query, params[:sort], params[:order], params[:page])
      end

      private

      def build_query(params)
        keywords = params[:keywords]

        qualifiers = params.except(:keywords, :sort, :order, :page).map { |k, v| " #{k}:#{v}" }.join

        "#{keywords}#{qualifiers}"
      end

      def default_values(params)
        params[:language] ||= 'ruby'
        params[:page] ||= 1

        params
      end

    end
  end
end

