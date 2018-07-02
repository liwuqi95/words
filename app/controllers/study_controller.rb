class StudyController < ApplicationController
  def center

    @chapters_in_progress = LearningRecord.where("user_id = ?", current_user.id).group(:chapter_id).distinct.count(:word_id)

    @chapters_registered = Chapter.all

  end



  def learn

    @chapter = Chapter.find(params[:id])

    @all_words = @chapter.words.pluck(:word_id).sort

    if params[:word_id]

      @current_index = @all_words.index(params[:word_id].to_i)

    else

      @taken_word = LearningRecord.where(" chapter_id = ? AND user_id = ?", @chapter.id, current_user.id).maximum(:word_id)
      @current_index = @taken_word ? @all_words.index(@taken_word) : 0
      @finish = (@current_index >= @all_words.size - 1) ? true : nil

    end

    @current_word = Word.find(@all_words[@current_index])
    @progress = @finish ? 100 : (@current_index.to_f / @all_words.size.to_f) * 100


    @LearningRecord =  LearningRecord.new({user_id: current_user.id, chapter_id: @chapter.id, word_id: @current_word.id})
    @LearningRecord.save

  end


end
