class StudyController < ApplicationController
  def center

    @lessons_in_progress = LessonRecord.where("user_id = ?",current_user.id).group(:chapter_id).count

    @lessons_registered = Lesson.where("user_id = ?", current_user.id)


  end
end
