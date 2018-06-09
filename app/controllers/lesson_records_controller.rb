class LessonRecordsController < ApplicationController
  before_action :set_lesson_record, only: [:show, :edit, :update, :destroy]

  # GET /lesson_records
  # GET /lesson_records.json
  def index
    @lesson_records = LessonRecord.all
  end

  # GET /lesson_records/1
  # GET /lesson_records/1.json
  def show
  end

  # GET /lesson_records/new
  def new
    @lesson_record = LessonRecord.new
  end

  # GET /lesson_records/1/edit
  def edit
  end

  # POST /lesson_records
  # POST /lesson_records.json
  def create
    @lesson_record = LessonRecord.new(lesson_record_params)

    respond_to do |format|
      if @lesson_record.save
        format.html { redirect_to @lesson_record, notice: 'Lesson record was successfully created.' }
        format.json { render :show, status: :created, location: @lesson_record }
      else
        format.html { render :new }
        format.json { render json: @lesson_record.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lesson_records/1
  # PATCH/PUT /lesson_records/1.json
  def update
    respond_to do |format|
      if @lesson_record.update(lesson_record_params)
        format.html { redirect_to @lesson_record, notice: 'Lesson record was successfully updated.' }
        format.json { render :show, status: :ok, location: @lesson_record }
      else
        format.html { render :edit }
        format.json { render json: @lesson_record.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lesson_records/1
  # DELETE /lesson_records/1.json
  def destroy
    @lesson_record.destroy
    respond_to do |format|
      format.html { redirect_to lesson_records_url, notice: 'Lesson record was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lesson_record
      @lesson_record = LessonRecord.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lesson_record_params
      params.require(:lesson_record).permit(:chapter_id, :word_id, :user_id)
    end
end
