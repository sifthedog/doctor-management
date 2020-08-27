# frozen_string_literal: true

class CreateAppointments < ActiveRecord::Migration[6.0]
  def change
    create_table :appointments do |t|
      t.datetime :starts_at, null: false
      t.datetime :ends_at, null: false
      t.bigint :patient_id, null: false
      t.bigint :doctor_id, null: false

      t.timestamps
    end

    add_foreign_key :appointments, :doctors, column: :doctor_id
    add_foreign_key :appointments, :patients, column: :patient_id
  end
end
