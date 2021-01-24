module GithubApi
  class RepositoriesSearchRepository
    
    class << self
      
      def search(params)
        params = default_values(params)
        params = validate_params(params, %i(sort order))

        query = build_query(params) 

        res = GithubApi::RepositoriesSearchService.search_repositories(query, params[:sort], params[:order], params[:page])

        build_response(res, params[:page])
      end

      private

      def default_values(params)
        params[:language] ||= 'ruby'
        params[:page] ||= 1

        params
      end

      def validate_params(params, keys)
        keys.each do |k|
          params[k] = send("validate_#{k}", params[k])
        end

        params
      end

      def validate_sort(sort)
        %w(stars forks updated).include?(sort) ? sort : 'updated' 
      end

      def validate_order(order)
        %w(asc desc).include?(order) ? order : 'desc'
      end

      def build_query(params)
        keywords = params[:keywords]

        qualifiers = params.except(:keywords, :sort, :order, :page).map { |k, v| " #{k}:#{v}" }.join

        "#{keywords}#{qualifiers}"
      end

      def build_entities(items)
        items.map { |item| RepositoryEntity.new(item) }
      end

      def build_response(data, page)
        res = {}

        res[:resources] = build_entities(data['items'])
        res[:total_pages] = (data['total_count'] / 100) + 1
        res[:page] = page.to_i

        res
      end
    end
  end
end

