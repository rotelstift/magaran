module Admin
  class ComicChaptersController < BaseController
    before_action :set_comic_chapter, only: [:show, :edit, :update, :destroy]

    # GET /comic_chapters
    # GET /comic_chapters.json
    def index
      @comic_chapters = ComicChapter.all
    end

    # GET /comic_chapters/1
    # GET /comic_chapters/1.json
    def show
    end

    # GET /comic_chapters/new
    def new
      @comic_chapter = ComicChapter.new
    end

    # GET /comic_chapters/1/edit
    def edit
    end

    # POST /comic_chapters
    # POST /comic_chapters.json
    def create
      @comic_chapter = ComicChapter.new(comic_chapter_params)

      respond_to do |format|
        if @comic_chapter.save
          format.html { redirect_to @comic_chapter, notice: 'Comic chapter was successfully created.' }
          format.json { render :show, status: :created, location: @comic_chapter }
        else
          format.html { render :new }
          format.json { render json: @comic_chapter.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /comic_chapters/1
    # PATCH/PUT /comic_chapters/1.json
    def update
      respond_to do |format|
        if @comic_chapter.update(comic_chapter_params)
          format.html { redirect_to @comic_chapter, notice: 'Comic chapter was successfully updated.' }
          format.json { render :show, status: :ok, location: @comic_chapter }
        else
          format.html { render :edit }
          format.json { render json: @comic_chapter.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /comic_chapters/1
    # DELETE /comic_chapters/1.json
    def destroy
      @comic_chapter.destroy
      respond_to do |format|
        format.html { redirect_to admin_comic_chapters_path, notice: 'Comic chapter was successfully destroyed.' }
        format.json { head :no_content }
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_comic_chapter
        @comic_chapter = ComicChapter.find(params[:id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def comic_chapter_params
        params.require(:comic_chapter).permit(:number, :subtitle, :total_point, :comic_id)
      end
  end
end
