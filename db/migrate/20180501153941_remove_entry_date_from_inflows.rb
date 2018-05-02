class RemoveEntryDateFromInflows < ActiveRecord::Migration[5.2]
  def change
    remove_column :inflows, :entrydate, :date
  end
end
