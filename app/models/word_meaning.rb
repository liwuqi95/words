class WordMeaning < ApplicationRecord
  belongs_to :word

  enum characters: ['无', '名词（n.）', '不及物动词（vi.)', '及物动词（vt.)', '代词(pron.)', '形容词（dj.）',
                    '副词（adv.)', '数词（num.）', '冠词（art.）', '介词（prep.）', '连词（conj.）', '感叹词（int.)']

end
