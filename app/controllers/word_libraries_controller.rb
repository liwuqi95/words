class WordLibrariesController < ApplicationController
  before_action :set_word_library, only: [:show, :edit, :update, :destroy]

  # GET /word_libraries
  # GET /word_libraries.json
  def index
    @word_libraries = WordLibrary.all
  end

  # GET /word_libraries/1
  # GET /word_libraries/1.json
  def show
  end

  # GET /word_libraries/new
  def new
    @word_library = WordLibrary.new
  end



  # GET /word_libraries/1/edit
  def edit
  end

  # POST /word_libraries
  # POST /word_libraries.json
  def create
    @word_library = WordLibrary.new(word_library_params)

    respond_to do |format|
      if @word_library.save
        format.html { redirect_to @word_library, notice: 'Word library was successfully created.' }
        format.json { render :show, status: :created, location: @word_library }
      else
        format.html { render :new }
        format.json { render json: @word_library.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /word_libraries/1
  # PATCH/PUT /word_libraries/1.json
  def update
    respond_to do |format|
      if @word_library.update(word_library_params)
        format.html { redirect_to @word_library, notice: 'Word library was successfully updated.' }
        format.json { render :show, status: :ok, location: @word_library }
      else
        format.html { render :edit }
        format.json { render json: @word_library.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /word_libraries/1
  # DELETE /word_libraries/1.json
  def destroy
    @word_library.destroy
    respond_to do |format|
      format.html { redirect_to word_libraries_url, notice: 'Word library was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_word_library
      @word_library = WordLibrary.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def word_library_params
      params.require(:word_library).permit(:word_id, :library_id)
    end
end
