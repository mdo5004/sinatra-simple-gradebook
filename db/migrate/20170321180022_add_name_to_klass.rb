class AddNameToKlass < ActiveRecord::Migration[5.0]
  def change
      add_column :klasses, :name, :string
  end
end
