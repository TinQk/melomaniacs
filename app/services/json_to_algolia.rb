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
      application_id: Rails.application.credentials.algoliasearch_application_id,
      api_key: Rails.application.credentials.algoliasearch_api_key_search
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
