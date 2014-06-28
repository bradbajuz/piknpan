require 'csv'

desc "Import ingredients from csv file"
task :import => [:environment] do

  file = "db/ingredients.csv"

  CSV.foreach(file, :headers => true) do |row|
    Ingredient.create!(row.to_hash)
  end
end