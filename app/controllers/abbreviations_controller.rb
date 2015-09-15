class AbbreviationsController < ApplicationController
  def index
    if params[:query]
      @abbrs = Abbr.where(
        "abbreviation = :abbr or full_name like :prefix",
        abbr: params["query"], prefix: "#{params[:query]}%")
    else
      @abbrs = Abbr.all
    end
  end

end
