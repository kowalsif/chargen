
module RollTypes
  Keep = 1  
  Shadow = 2
  Regular = 4
end

module RollModification
  Exploding = 1
end


def Rolls(types) #It better be an array
  if types.is_a?(:to_s)
    types = types.split(" ")
end
