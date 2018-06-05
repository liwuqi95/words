class ChapterWordsController < ApplicationController
  before_action :set_chapter_word, only: [:show, :edit, :update, :destroy]

  # GET /chapter_words
  # GET /chapter_words.json
  def index
    @chapter_words = ChapterWord.all
  end

  # GET /chapter_words/1
  # GET /chapter_words/1.json
  def show
  end

  # GET /chapter_words/new
  def new
    @chapter_word = ChapterWord.new
  end

  # GET /chapter_words/1/edit
  def edit
  end

  # POST /chapter_words
  # POST /chapter_words.json
  def create
    @chapter_word = ChapterWord.new(chapter_word_params)

    respond_to do |format|
      if @chapter_word.save
        format.html { redirect_to @chapter_word, notice: 'Chapter word was successfully created.' }
        format.json { render :show, status: :created, location: @chapter_word }
      else
        format.html { render :new }
        format.json { render json: @chapter_word.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /chapter_words/1
  # PATCH/PUT /chapter_words/1.json
  def update
    respond_to do |format|
      if @chapter_word.update(chapter_word_params)
        format.html { redirect_to @chapter_word, notice: 'Chapter word was successfully updated.' }
        format.json { render :show, status: :ok, location: @chapter_word }
      else
        format.html { render :edit }
        format.json { render json: @chapter_word.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /chapter_words/1
  # DELETE /chapter_words/1.json
  def destroy
    @chapter_word.destroy
    respond_to do |format|
      format.html { redirect_to chapter_words_url, notice: 'Chapter word was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_chapter_word
      @chapter_word = ChapterWord.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def chapter_word_params
      params.require(:chapter_word).permit(:chapter_id, :word_id)
    end
end
