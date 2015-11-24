class MagazineVolumesController < ApplicationController
  before_action :set_magazine_volume, only: [:show, :edit, :update, :destroy]

  # GET /magazine_volumes
  # GET /magazine_volumes.json
  def index
    @magazine_volumes = MagazineVolume.all

  end

  # GET /magazine_volumes/1
  # GET /magazine_volumes/1.json
  def show
    @comic_chapters = ComicChapter.where(magazine_volume_id: @magazine_volume.id)
  end

  # GET /magazine_volumes/new
  def new
    @magazine_volume = MagazineVolume.new
  end

  # GET /magazine_volumes/1/edit
  def edit
    @comics = @magazine_volume.magazine.comics

    @comics.each do |c|
      @magazine_volume.comic_chapters.build(comic: c)
    end

  end

  # POST /magazine_volumes
  # POST /magazine_volumes.json
  def create
    @magazine_volume = MagazineVolume.new(magazine_volume_params)

    respond_to do |format|
      if @magazine_volume.save
        format.html { redirect_to @magazine_volume, notice: 'Magazine volume was successfully created.' }
        format.json { render :show, status: :created, location: @magazine_volume }
      else
        format.html { render :new }
        format.json { render json: @magazine_volume.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /magazine_volumes/1
  # PATCH/PUT /magazine_volumes/1.json
  def update
    respond_to do |format|
      if @magazine_volume.update(magazine_volume_params)
        format.html { redirect_to @magazine_volume, notice: 'Magazine volume was successfully updated.' }
        format.json { render :show, status: :ok, location: @magazine_volume }
      else
        format.html { render :edit }
        format.json { render json: @magazine_volume.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /magazine_volumes/1
  # DELETE /magazine_volumes/1.json
  def destroy
    @magazine_volume.destroy
    respond_to do |format|
      format.html { redirect_to magazine_volumes_url, notice: 'Magazine volume was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_magazine_volume
      @magazine_volume = MagazineVolume.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def magazine_volume_params
      params.require(:magazine_volume).permit(:magazine_id, :number, :published, comic_chapters_attributes: [:id, :number, :subtitle, :comic_id])
    end
end
