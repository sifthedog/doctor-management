# frozen_string_literal: true

class CreatePatients < ActiveRecord::Migration[6.0]
  def change
    create_table :patients do |t|
      t.string :name, null: false
      t.date :birth_date, null: false
      t.string :cpf, null: false
      t.bigint :doctor_id, null: false

      t.timestamps
    end

    add_foreign_key :patients, :doctors, column: :doctor_id
  end
end
