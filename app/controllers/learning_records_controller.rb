class LearningRecordsController < ApplicationController
  before_action :set_learning_record, only: [:show, :edit, :update, :destroy]

  # GET /learning_records
  # GET /learning_records.json
  def index
    @learning_records = LearningRecord.all
  end

  # GET /learning_records/1
  # GET /learning_records/1.json
  def show
  end

  # GET /learning_records/new
  def new
    @learning_record = LearningRecord.new
  end

  # GET /learning_records/1/edit
  def edit
  end

  # POST /learning_records
  # POST /learning_records.json
  def create
    @learning_record = LearningRecord.new(learning_record_params)

    respond_to do |format|
      if @learning_record.save
        format.html {redirect_back(fallback_location: root_path)}
        format.json {render :show, status: :created, location: @learning_record}
      else
        format.html {render :new}
        format.json {render json: @learning_record.errors, status: :unprocessable_entity}
      end
    end
  end

  # PATCH/PUT /learning_records/1
  # PATCH/PUT /learning_records/1.json
  def update
    respond_to do |format|
      if @learning_record.update(learning_record_params)
        format.html {redirect_to @learning_record, notice: 'Learning record was successfully updated.'}
        format.json {render :show, status: :ok, location: @learning_record}
      else
        format.html {render :edit}
        format.json {render json: @learning_record.errors, status: :unprocessable_entity}
      end
    end
  end

  # DELETE /learning_records/1
  # DELETE /learning_records/1.json
  def destroy
    @learning_record.destroy
    respond_to do |format|
      format.html {redirect_to learning_records_url, notice: 'Learning record was successfully destroyed.'}
      format.json {head :no_content}
    end
  end

  def destroy_all
    LearningRecord.all.each do |learning_record|
      learning_record.destroy
    end

    respond_to do |format|
        format.html {redirect_back(fallback_location: root_path)}
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_learning_record
    @learning_record = LearningRecord.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def learning_record_params
    params.require(:learning_record).permit(:chapter_id, :word_id, :user_id)
  end
end
