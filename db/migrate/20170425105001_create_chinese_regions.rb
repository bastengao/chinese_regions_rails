class CreateChineseRegions < ActiveRecord::Migration
  def change
    create_table(:chinese_regions, id: :string) do |t|
      t.string :parent_id
      t.string :name
      t.string :alias
      t.string :pinyin
      t.string :abbr
      t.string :zip
      t.integer :level
    end
  end
end
