# frozen_string_literal: true

class CreateDoctors < ActiveRecord::Migration[6.0]
  def change
    create_table :doctors do |t|
      t.string :name, null: false
      t.string :crm, null: false
      t.string :crm_uf, null: false

      t.timestamps
    end
  end
end
