class AddPaperclipFieldsToFood < ActiveRecord::Migration
  def change
    add_column :foods, :image_file_name,    :string
    add_column :foods, :image_content_type, :string
    add_column :foods, :image_file_size,    :integer
    add_column :foods, :image_updated_at,   :datetime
  end
end
