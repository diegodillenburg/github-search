class RepositoryEntity
 attr_reader :id, :name, :description, :author, :stars, :forks, :updated_at


 def initialize(params)
   @id = params['id']
   @name = params['name']
   @description = params['description']
   @author = params['owner']['login']
   @stars = params['stargazers_count']
   @forks = params['forks']
   @updated_at = params['updated_at']
 end
end
