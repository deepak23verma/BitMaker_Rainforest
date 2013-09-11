class RenameTypeToNameOnCategories < ActiveRecord::Migration
  def change
	  change_table :categories do |t|
		  t.rename :type, :name
		end
  end
end
