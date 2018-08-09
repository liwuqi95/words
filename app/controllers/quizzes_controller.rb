class QuizzesController < ApplicationController
  before_action :set_quiz, only: [:show, :edit, :update, :destroy]

  # GET /quizzes
  # GET /quizzes.json
  def index
    @quizzes = Quiz.all
  end

  # GET /quizzes/1
  # GET /quizzes/1.json
  def show
  end

  # GET /quizzes/new
  def new
    @quiz = Quiz.new
  end

  # GET /quizzes/1/edit
  def edit
  end

  # POST /quizzes
  # POST /quizzes.json
  def create
    @quiz = Quiz.new(quiz_params)

    respond_to do |format|
      if @quiz.save


        @past_quizzes = Quiz.where(:chapter_id => @quiz.chapter_id, :user_id => @quiz.user_id).where.not(:id => @quiz.id).order(created_at: :desc)


        if @past_quizzes.count >= 1

          @first_list = QuizRecord.where(:answer => nil).or(QuizRecord.where(:answer => false)).where(:quiz_id => @past_quizzes.first.id)

          @first_list.each do |word|
            QuizRecord.create!(:quiz => @quiz, :word => word.word)
          end

          if @past_quizzes.count >= 2

            QuizRecord.where(:quiz_id => @past_quizzes[1].id, :answer => [nil, false]).each do |word|
              QuizRecord.create(:quiz => @quiz, :word => word.word)
            end

          end


        else
          ChapterWord.where(:chapter_id => @quiz.chapter_id).each do |word|
            QuizRecord.create(:quiz_id => @quiz.id, :word_id => word.id)
          end
        end


        format.html {redirect_to study_quiz_path(@quiz.chapter_id, :quiz_id => @quiz.id), notice: 'Quiz was successfully created.'}
        format.json {render :show, status: :created, location: @quiz}
      else
        format.html {render :new}
        format.json {render json: @quiz.errors, status: :unprocessable_entity}
      end
    end
  end

  # PATCH/PUT /quizzes/1
  # PATCH/PUT /quizzes/1.json
  def update
    respond_to do |format|
      if @quiz.update(quiz_params)
        format.html {redirect_to @quiz, notice: 'Quiz was successfully updated.'}
        format.json {render :show, status: :ok, location: @quiz}
      else
        format.html {render :edit}
        format.json {render json: @quiz.errors, status: :unprocessable_entity}
      end
    end
  end

  # DELETE /quizzes/1
  # DELETE /quizzes/1.json
  def destroy
    @chapter = @quiz.chapter
    @quiz.destroy
    respond_to do |format|
      format.html {redirect_to study_quiz_path(@chapter), notice: 'Quiz was successfully destroyed.'}
      format.json {head :no_content}
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_quiz
    @quiz = Quiz.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def quiz_params
    params.require(:quiz).permit(:chapter_id, :user_id)
  end
end
