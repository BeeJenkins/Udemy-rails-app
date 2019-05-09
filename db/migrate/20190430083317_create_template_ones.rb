class CreateTemplateOnes < ActiveRecord::Migration[5.2]
  def change
    create_table :template_ones do |t|
      t.boolean :about_show, default: true
      t.string :about_title
      t.string :about_text
      t.string :about_image
      t.timestamps
    end
  end
end
