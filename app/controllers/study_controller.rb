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

  def c_word
    lib = '第一单元  汲取  招牌  担忧  贪婪  惧怕  环境  知趣  光顾  恐怕  充足  屋檐  支撑  书柜  鼓励  环绕  娱乐   感叹  周游  背诵   熟悉  品味  片段  忽略   意义  方式  皱眉头  倾盆大雨   毫不犹豫  第二单元   附近  捕捞  鱼饵  涟漪  辉映  剧烈  上钩  操纵  摆脱  鱼鳃  皎洁  乞求  嘴唇  沮丧  旅途  诱惑   抉择  告诫  实践   启示  茅亭  吩咐  榨油  石榴   嫩绿  爱慕  分辨  体面  银光闪闪  小心翼翼  不容争辩   依依不舍   第三单元   地震  混乱  安顿  危险  昔日  废墟  疾步  坚定  挖掘  绝望  爆炸  叹息  悲痛   瓦砾  颤抖  拥抱  糟糕  确实  自豪  誊写  敬仰  奇妙  判断  湿润  出版  戏剧  严厉  灵感  创作  源泉  歧途  警告  提醒  谨慎  把握  极端  断言  欢声笑语  破烂不堪  一如既往   第四单元   估量  损失  殿堂  宏伟  侵入  销毁  瑰宝  灰烬  进犯  转移  掩护  任务  崎岖  尸体  坠落  仇恨  眺望   豪迈  举世闻名  众星拱月  玲珑剔透  亭台楼阁  诗情画意  天南海北  奇珍异宝  满腔怒火  斩钉截铁   第六单元   绿毯  柔美  渲染  勾勒  低吟  奇丽  回味  洒脱  迂回  疾驰  马蹄  礼貌  拘束  羞涩  摔跤  舞蹈  天涯 清晰  插嘴  分辩（论辩、争辩）抚摸  介绍  新疆  陷入 热乎乎  一碧千里  翠色欲流  襟飘带舞  浑黄一体   第七单元   牧童  蓑衣  毡帽  咀嚼  交错  铃铛  幼稚  沙漠  寂寞  增加  棉袄  驼绒  袍子  傻事  胚胎  祸患  滑翔 澄澈  轻盈  天赋  淘气  妨碍  岂止  痴迷  厘米  羞愧  幸亏  驱逐  迫害  情不自禁  随心所欲  运转自如 绞尽脑汁 '


    @words = lib.split('  ')

    if params[:word]
      @word = @words[params[:word].to_i]
      @index = params[:word].to_i

    else
      @word = @words[0]
      @index = 0
    end
  end


end
