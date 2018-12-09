require 'rubygems'
require 'algoliasearch-rails'
require 'json'

# Crée un nouvel index sur Algolia et le rempli avec un JSON créé par le service Dbjson
# Ex : JsonToAlgolia.new(Genre).perform

class JsonToAlgolia

  def initialize(table)
    @table = table
    @table_name = table.name.downcase

    Algolia.init(
      application_id: ENV['ALGOLIASEARCH_APPLICATION_ID'],
      api_key: ENV['ADMIN_API_KEY']
    )
	end

  def add_json_to_algolia()
    index = Algolia::Index.new(@table_name)
    file = File.read("db/seed/#{@table_name}.json")
    entries = JSON.parse(file)
    index.add_objects(entries)
  end

  def perform()
    add_json_to_algolia()
  end

end
