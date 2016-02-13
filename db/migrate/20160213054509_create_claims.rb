class CreateClaims < ActiveRecord::Migration

  def change
      create_table :claims do |t|

        t.integer :gid       
        t.string :tnrtpcd   
        t.string :ttltpdsc  
        t.string :tnrsbtpcd 
        t.float :prcntowner
        t.string :ntrtmstmp 
        t.string :tnrsbtpdsc
        t.string :owner_name
        t.string :trmntntpds
        t.string :tag_number
        t.integer :objectid  
        t.string :gdtdt     
        t.string :ntrsrd    
        t.string :claim_name
        t.integer :num_owners
        t.integer :clientnum 
        t.string :issue_date
        t.string :protected 
        t.string :pdtsrd    
        t.string :pdttmstmp 
        t.string :tnrtpdscrp
        t.integer :tnrnmbrd  
        t.integer :rvsnnmbr  
        t.string :fcode     
        t.string :trmntndt  
        t.float :rnhctrs   
        t.string :ttltpcd   
        t.multi_polygon :geom, :srid => 4326
    end   

    add_index :claims, :geom, using: :gist

    # change_table :claims do |t|
    #   t.index :geog, using: :gist
    # end
  end
end