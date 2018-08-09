class QuizRecordsController < ApplicationController
  before_action :set_quiz_record, only: [:show, :edit, :update, :destroy]

  # GET /quiz_records
  # GET /quiz_records.json
  def index
    @quiz_records = QuizRecord.all
  end

  # GET /quiz_records/1
  # GET /quiz_records/1.json
  def show
  end

  # GET /quiz_records/new
  def new
    @quiz_record = QuizRecord.new
  end

  # GET /quiz_records/1/edit
  def edit
  end

  # POST /quiz_records
  # POST /quiz_records.json
  def create
    @quiz_record = QuizRecord.new(quiz_record_params)

    respond_to do |format|
      if @quiz_record.save
        format.html { redirect_to @quiz_record, notice: 'Quiz record was successfully created.' }
        format.json { render :show, status: :created, location: @quiz_record }
      else
        format.html { render :new }
        format.json { render json: @quiz_record.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /quiz_records/1
  # PATCH/PUT /quiz_records/1.json
  def update
    respond_to do |format|
      if @quiz_record.update(:answer => @quiz_record.word.word.downcase == params[:quiz_record][:answer_text].to_s.downcase, :work => true)
        format.html { redirect_to study_quiz_path(@quiz_record.quiz.chapter_id, :quiz_id => @quiz_record.quiz.id) }
        format.json { render :show, status: :ok, location: @quiz_record }
      else
        format.html { render :edit }
        format.json { render json: @quiz_record.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /quiz_records/1
  # DELETE /quiz_records/1.json
  def destroy
    @quiz_record.destroy
    respond_to do |format|
      format.html { redirect_to quiz_records_url, notice: 'Quiz record was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_quiz_record
      @quiz_record = QuizRecord.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def quiz_record_params
      params.require(:quiz_record).permit(:quiz_id, :word_id, :answer_text)
    end
end
