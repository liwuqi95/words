class StudyController < ApplicationController
  def center

    @chapters_in_progress = LearningRecord.where("user_id = ?", current_user.id).group(:chapter_id).distinct.count(:word_id)

    @chapters_registered = Chapter.all

  end



  def learn
    @chapter = Chapter.find(params[:id])

    @all_words = @chapter.words

    @current_word = params[:word_id] ? Word.find(params[:word_id]) : @all_words.first

    @current_index = @all_words.index(@current_word)


    if LearningRecord.where(:chapter_id => @chapter.id, :user_id => current_user.id, :word_id => @current_word.id).count < 1
      @LearningRecord =  LearningRecord.new({user_id: current_user.id, chapter_id: @chapter.id, word_id: @current_word.id})
      @LearningRecord.save
    end

  end


  def test
    @chapter = Chapter.find(params[:id])

    @all_words = @chapter.words

    @total_words_count = @all_words.size

    @not_touched_words = @all_words.select{|word| word.test_recent( current_user.id) == nil}

    @words_passed = @all_words.select{|word| word.passed( current_user.id)}

    if @not_touched_words.size != 0
      @all_words = @not_touched_words
    else

      @all_words = @all_words - @words_passed

      @all_words = @all_words.sort_by{|word| word.test_count(current_user.id)}
      @all_words = @all_words.sort_by{|word| word.test_recent( current_user.id)}
    end

    @current_word = @all_words.first

    @test_record = TestRecord.new

  end


end
