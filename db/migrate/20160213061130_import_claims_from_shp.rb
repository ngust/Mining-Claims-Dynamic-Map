class ImportClaimsFromShp < ActiveRecord::Migration
  def up
    from_shp_sql = `shp2pgsql -G -W 'latin1' #{Rails.root.join('db', 'shpfiles', 'MTA_ACQ_TE_polygon.shp')} claims_ref`

    Claim.transaction do
      execute from_shp_sql

      execute <<-SQL
          insert into claims(gid, tnrtpcd, ttltpdsc, tnrsbtpcd, prcntowner, ntrtmstmp, tnrsbtpdsc, owner_name, trmntntpds, tag_number, objectid, gdtdt, ntrsrd, claim_name, num_owners, clientnum, issue_date, protected, pdtsrd, pdttmstmp, tnrtpdscrp, tnrnmbrd, rvsnnmbr, fcode, trmntndt, rnhctrs, ttltpcd, geog) 
                      select gid, tnrtpcd, ttltpdsc, tnrsbtpcd, prcntowner, ntrtmstmp, tnrsbtpdsc, owner_name, trmntntpds, tag_number, objectid, gdtdt, ntrsrd, claim_name, num_owners, clientnum, issue_date, protected, pdtsrd, pdttmstmp, tnrtpdscrp, tnrnmbrd, rvsnnmbr, fcode, trmntndt, rnhctrs, ttltpcd, geog from claims_ref
      SQL

      drop_table :claims_ref
    end

  end

  def down
    Claim.delete_all
  end
end
