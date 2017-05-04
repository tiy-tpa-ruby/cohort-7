require 'pg'

class MagicRecord
  def self.find(id)
    table_name = "#{self.name.downcase}s"

    # Eventually write query that tries to find this record in the database
    database = PG.connect(dbname: 'pets')
    rows = database.exec(%{select * from #{table_name} where id = $1}, [id])

    row = rows.first

    new(row)
  end

  def self.inherited(klass)
    table_name = "#{klass.name.downcase}s"

    query = %{
      select column_name, data_type, character_maximum_length
      from INFORMATION_SCHEMA.COLUMNS where table_name = '#{table_name}';
    }

    database = PG.connect(dbname: 'pets')
    rows = database.exec(query)
    rows.each do |row|
      klass.send(:attr_accessor, row["column_name"])
    end

    klass.send(:define_method,"initialize") do |parameters = {}|
      parameters.each do |column_name, column_value|
        self.send("#{column_name}=", column_value)
      end
    end
  end
end
