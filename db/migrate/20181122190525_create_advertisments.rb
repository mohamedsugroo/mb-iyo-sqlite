class CreateAdvertisments < ActiveRecord::Migration[5.2]
  def change
    create_table :advertisments do |t|
      t.string :title
      t.string :comany_name
      t.date :start_date
      t.date :end_date
      t.text :code_html
      t.text :code_css
      t.text :code_js

      t.timestamps
    end
  end
end
