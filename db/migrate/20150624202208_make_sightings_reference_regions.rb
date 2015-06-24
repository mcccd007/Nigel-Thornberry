class MakeSightingsReferenceRegions < ActiveRecord::Migration
  def change
    change_table :sightings do |t|
      t.references :region
    end
  end
end
