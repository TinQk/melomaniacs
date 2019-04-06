# Convertit une table en json et l'enregistre dans le dossier seed

# Pour appeler ce service, effectuer la commande suivante :
# Dbjson.new(Table).perform

require 'rubygems'
require 'json'

class Dbjson

  # Prend une table en entrée, ex : Artist
  def initialize(table)
    @table = table
    @table_name = table.name.downcase
  end

  #
  def convert_to_json()
    entries = []
    @table.all.each do |entry|
      entries << entry
    end

    entries_json = entries.to_json(:only => [:id, :name, :popularity])

    File.write("db/json/#{@table_name}.json", entries_json)
  end

  def perform()
    convert_to_json()
  end

end
