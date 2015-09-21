class AbbrsController < ApplicationController
  def index
    if params[:query]
      @abbrs = Abbr.where(
        "abbreviation = :abbr or full_name like :prefix",
        abbr: params["query"], prefix: "#{params[:query]}%")
    else
      @abbrs = Abbr.all
    end
  end

  def new
    @abbr = Abbr.new
  end

  def create
    @abbr = Abbr.new(abbr_params)

    respond_to do |format|
      if @abbr.save
        format.html { redirect_to abbrs_path, notice: 'Abbreviation was successfully created.' }
        format.json { render :show, status: :created, location: @abbr }
      else
        format.html { render :new }
        format.json { render json: @abbr.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  # Never trust parameters from the scary internet, only allow the white list through.
  def abbr_params
    params.require(:abbr).permit(:abbreviation, :full_name)
  end
end
