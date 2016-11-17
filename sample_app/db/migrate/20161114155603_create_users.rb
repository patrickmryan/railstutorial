class CreateUsers < ActiveRecord::Migration[5.0]
  def change
        self.create_table :users do |t|
          t.string :name
          t.string :email
    
          t.timestamps
        end

#    create_table :users do |t|
#      t.string :name
#      t.string :email
#
#      t.timestamps
#    end
        
#    td = self.create_table(:users)
#    td do |t|
#      t.string :name
#      t.string :email
#      t.timestamps
#    end

  end
end
