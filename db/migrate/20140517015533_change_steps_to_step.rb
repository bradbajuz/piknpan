class ChangeStepsToStep < ActiveRecord::Migration
  def change
    rename_column :directions, :steps, :step
  end
end
