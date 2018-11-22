class AddNumbersToAdvertisments < ActiveRecord::Migration[5.2]
  def change
    add_column :advertisments, :impressions, :integer
    add_column :advertisments, :proceeds, :integer
  end
end
