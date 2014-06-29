require "sqlite3"

module ChineseRegionsRails
  class DB

    class << self

      def query_regions
        db.execute("select * from regions") do |row|
          hash = {code: row[0],
                  parent_code: row[1],
                  name: row[2],
                  alias: row[3],
                  pinyin: row[4],
                  abbr: row[5],
                  zip: row[6],
                  level: row[7]
          }

          yield(hash) if block_given?
        end
      end

      def db
        db_file = File.expand_path("../../regions.db", __FILE__)
        db = SQLite3::Database.new db_file
        db
      end

    end
  end
end