class RepositoryEntity
 attr_reader :name, :description, :stars, :forks, :author, :updated_at


 def initialize(params)
   @name = params['name']
   @description = params['description']
   @stars = params['stargazers_count']
   @forks = params['forks']
   @author = params['owner']['login']
   @updated_at = params['updated_at']
 end
end
