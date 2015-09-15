# general 1 stats 2 equipment 4 spells 8 Description 16 Continuation 32
module ModeBitMask
  GENERAL = 1
  STATS = 2
  EQUIPMENT = 4
  SPELLS = 8
  DESCRIPTION = 16
  CONTINUATION = 32
end


def strpstr(str) #removes punctuation but not spaces. 
  str.downcase.gsub(/[^[:word:]\s\d]/, '')
end
