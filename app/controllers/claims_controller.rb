class ClaimsController < ApplicationController

  def index
      @claims = Claim.all

      respond_to do |format|
        format.json do
          feature_collection = Claim.to_feature_collection @claims
          render json: RGeo::GeoJSON.encode(feature_collection)
        end

        format.html
      end
  end
end