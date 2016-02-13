# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Claim.delete_all

if Claim.all.count == 0
  connection = ActiveRecord::Base.connection()

  # Import country data from shpfile to countries table
 from_shp_sql = `shp2pgsql -c -g geom -t '2D' -W 'latin1' -s 4326 #{Rails.root.join('db', 'shpfiles', 'MTA_ACQ_TE_polygon.shp')} claims_ref`

  connection.execute "drop table if exists claims_ref"
  connection.execute from_shp_sql
  connection.execute <<-SQL

          insert into claims(gid, tnrtpcd, ttltpdsc, tnrsbtpcd, prcntowner, ntrtmstmp, tnrsbtpdsc, owner_name, trmntntpds, tag_number, objectid, gdtdt, ntrsrd, claim_name, num_owners, clientnum, issue_date, protected, pdtsrd, pdttmstmp, tnrtpdscrp, tnrnmbrd, rvsnnmbr, fcode, trmntndt, rnhctrs, ttltpcd, geom) 
                      select gid, tnrtpcd, ttltpdsc, tnrsbtpcd, prcntowner, ntrtmstmp, tnrsbtpdsc, owner_name, trmntntpds, tag_number, objectid, gdtdt, ntrsrd, claim_name, num_owners, clientnum, issue_date, protected, pdtsrd, pdttmstmp, tnrtpdscrp, tnrnmbrd, rvsnnmbr, fcode, trmntndt, rnhctrs, ttltpcd, geom from claims_ref;
      SQL
  connection.execute "drop table claims_ref"
end

  # ALTER TABLE claims_ref ALTER COLUMN geog TYPE geometry(MultiPolygon,32632) USING ST_Force2D(geog);
