class WordsController < ApplicationController
  before_action :set_word, only: [:show, :edit, :update, :destroy]

  # GET /words
  # GET /words.json
  def index
    @words = Word.all
  end

  def list
    @words = Word.all
  end

  # GET /words/1
  # GET /words/1.json
  def show
  end

  # GET /words/new
  def new
    @word = Word.new
    @word.word_meanings.build
  end

  # GET /words/1/edit
  def edit
    @word.word_meanings.build
  end

  # POST /words
  # POST /words.json
  def create
    @word = Word.new(word_params)

    respond_to do |format|
      if @word.save
        format.html {redirect_to list_words_path, notice: '成功添加单词!'}
        format.json {render :show, status: :created, location: @word}
      else
        format.html {render :new}
        format.json {render json: @word.errors, status: :unprocessable_entity}
      end
    end
  end

  # PATCH/PUT /words/1
  # PATCH/PUT /words/1.json
  def update
    respond_to do |format|
      if @word.update(word_params)
        format.html {redirect_to list_words_path, notice: '成功修改单词.'}
        format.json {render :show, status: :ok, location: @word}
      else
        format.html {render :edit}
        format.json {render json: @word.errors, status: :unprocessable_entity}
      end
    end
  end

  # DELETE /words/1
  # DELETE /words/1.json
  def destroy
    @word.destroy
    respond_to do |format|
      format.html {redirect_to list_words_path, notice: '成功删除单词.'}
      format.json {head :no_content}
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_word
    @word = Word.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def word_params
    params.require(:word).permit(:word, :phonetic ,word_meanings_attributes: [:meaning, :character])
  end
end
