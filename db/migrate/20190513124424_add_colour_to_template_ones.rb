class AddColourToTemplateOnes < ActiveRecord::Migration[5.2]
  def change
    add_column :template_ones, :front_end_colour, :string
  end
end
