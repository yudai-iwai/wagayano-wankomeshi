class ChangeColumnToNull < ActiveRecord::Migration[6.1]
  def up
    change_column_null :members, :dog_name, true
    change_column_null :members, :dog_breed, true
    change_column_null :members, :dog_age, true
    change_column_null :members, :dog_gender, true
  end

  def down
    change_column_null :members, :dog_name, false
    change_column_null :members, :dog_breed, false
    change_column_null :members, :dog_age, false
    change_column_null :members, :dog_gender, false
  end
end
