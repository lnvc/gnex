class RemoveExitDateFromOutflows < ActiveRecord::Migration[5.2]
  def change
    remove_column :outflows, :exitdate, :date
  end
end
