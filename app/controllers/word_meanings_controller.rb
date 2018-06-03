class WordMeaningsController < ApplicationController
  before_action :set_word_meaning, only: [:show, :edit, :update, :destroy]

  # GET /word_meanings
  # GET /word_meanings.json
  def index
    @word_meanings = WordMeaning.all
  end

  # GET /word_meanings/1
  # GET /word_meanings/1.json
  def show
  end

  # GET /word_meanings/new
  def new
    @word_meaning = WordMeaning.new
  end

  # GET /word_meanings/1/edit
  def edit
  end

  # POST /word_meanings
  # POST /word_meanings.json
  def create
    @word_meaning = WordMeaning.new(word_meaning_params)

    respond_to do |format|
      if @word_meaning.save
        format.html { redirect_to @word_meaning, notice: 'Word meaning was successfully created.' }
        format.json { render :show, status: :created, location: @word_meaning }
      else
        format.html { render :new }
        format.json { render json: @word_meaning.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /word_meanings/1
  # PATCH/PUT /word_meanings/1.json
  def update
    respond_to do |format|
      if @word_meaning.update(word_meaning_params)
        format.html { redirect_to @word_meaning, notice: 'Word meaning was successfully updated.' }
        format.json { render :show, status: :ok, location: @word_meaning }
      else
        format.html { render :edit }
        format.json { render json: @word_meaning.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /word_meanings/1
  # DELETE /word_meanings/1.json
  def destroy
    @word_meaning.destroy
    respond_to do |format|
      format.html { redirect_to word_meanings_url, notice: 'Word meaning was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_word_meaning
      @word_meaning = WordMeaning.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def word_meaning_params
      params.require(:word_meaning).permit(:word_id, :meaning, :character)
    end
end
