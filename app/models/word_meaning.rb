class WordMeaning < ApplicationRecord
  belongs_to :word

  enum character: ['无', '名词（n.）', '动词（v.)', '代词(pron.)', '形容词（adj.）',
                    '副词（adv.)', '数词（num.）', '冠词（art.）', '介词（prep.）', '连词（conj.）', '感叹词（int.)']

end
