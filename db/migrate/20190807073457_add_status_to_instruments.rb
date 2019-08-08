class AddStatusToInstruments < ActiveRecord::Migration[5.2]
  def change
    add_column :instruments, :status, :string
  end
end
