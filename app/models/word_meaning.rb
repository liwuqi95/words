class WordMeaning < ApplicationRecord
  belongs_to :word

  enum characters: [:none, :n, :vi, :vt, :pron, :adj, :adv, :num, :art, :prep, :conj, :int]

end
