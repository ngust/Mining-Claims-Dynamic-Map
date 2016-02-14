class Claim < ActiveRecord::Base
  include Featurable
  featurable :geom, [:tnrnmbrd]

end
