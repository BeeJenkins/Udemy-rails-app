class CreateTemplateOnes < ActiveRecord::Migration[5.2]
  def change
    create_table :template_ones do |t|
      t.string :string_input_1

      t.timestamps
    end
  end
end
