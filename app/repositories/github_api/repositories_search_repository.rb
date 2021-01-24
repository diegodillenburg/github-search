module GithubApi
  class RepositoriesSearchRepository
    
    class << self
      
      def search(params)
        params = default_values(params)
        params = validate_params(params, %i(sort order))

        query = build_query(params) 

        GithubApi::RepositoriesSearchService.search_repositories(query, params[:sort], params[:order], params[:page])
      end

      private

      def build_query(params)
        keywords = params[:keywords]

        qualifiers = params.except(:keywords, :sort, :order, :page).map { |k, v| " #{k}:#{v}" }.join

        "#{keywords}#{qualifiers}"
      end

      def validate_params(params, keys)
        keys.each do |k|
          params[k] = send("validate_#{k}", params[k])
        end

        params
      end

      def validate_sort(sort)
        %w(stars fork updated).include?(sort) ? sort : 'updated' 
      end

      def validate_order(order)
        %w(asc desc).include?(order) ? order : 'desc'
      end

      def default_values(params)
        params[:language] ||= 'ruby'
        params[:page] ||= 1

        params
      end

    end
  end
end

