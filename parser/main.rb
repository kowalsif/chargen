require "./shared.rb"
require "./lexer.rb"
require "./write.rb"

mode = ModeBitMask::GENERAL

def minimal_lexer
  fileObj = File.new("char.txt", "rb")
  lex = Lexer.new
  while (line = fileObj.gets)
  line.chomp!
    if line.casecmp("general") == 0
      mode = ModeBitMask::GENERAL #general
    elsif line.casecmp("Stats") == 0
      mode = ModeBitMask::STATS #stats
    elsif line.casecmp("equipment") == 0 
      mode = ModeBitMask::EQUIPMENT #gear
    elsif line.casecmp("spells") == 0 
      mode = ModeBitMask::SPELLS #spells
    elsif line.casecmp("description") == 0 
      mode = ModeBitMask::DESCRIPTION #description
    elsif line == "\n"
      skip
    else
      if line[-1, 1] == '&'
        mode |= ModeBitMask::CONTINUATION #combine the lines
      end
      lex.tokenizer(line, mode);
      if (mode & ModeBitMask::CONTINUATION) > 0
        mode -= ModeBitMask::CONTINUATION
      end
    end
    #puts(line)
  end
  fileObj.close
  
  lex.writeutils()
  #... create rest of utils (js file)
  
  writer = Writer.new
  #writer.write(lex.stats.genStatXml)
  writer.close()
end
  
minimal_lexer()
