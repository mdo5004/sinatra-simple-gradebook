class CreateKlasses < ActiveRecord::Migration[5.0]
    def change
        create_table :klasses do |t|
            t.string :description
        end
    end
end
