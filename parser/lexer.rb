
generalarray = Array.new

class Stats
  def initialize
    @genStatXml = ""
    @statjson = ""
  end
   
  def MakeStatUtils
    @statjson = "" #clear the utils
  end
  
  def GenerateStatXML(split)
    lowerCaseName = strpstr(split[0])
    @genStatXml += "<div> " + split[0] +" <input id =\""+split[0][0..-2]+"\" value=\""+split[1] +"\" type=\"number\">\n"
    @genStatXml += "<input type=\"button\" value=\"Roll\" onclick=\"document.getElementById('result"+lowerCaseName+"').value = makestatroll(document.getElementById('"+lowerCaseName+"').value)\"/> <output name=\"Result\" id=\"result"+lowerCaseName+"\" type=\"text\" value=\"\" >"
    @genStatXml += "<div\\>\n"
  end
  
end

class Lexer
  def initialize
    @instancesarr = Array.new 
    @strtest = Array.new
    @stats = Stats.new
  end
  
  def tokenizer(line, mode)    
    @strtest.concat line.split(" ")
    if @strtest == nil or @strtest[0] == nil
      return
    elsif @strtest == []
      return
    elsif (mode & ModeBitMask::CONTINUATION) > 0
      return
    end
    
    if (mode & ModeBitMask::STATS) > 0
      @stats.GenerateStatXML(@strtest)
    end
      
    if (mode & ModeBitMask::CONTINUATION) == 0
      @strtest = []
    end
    #puts($genStatXml)
  end 
  
  def writeutils()
    
  
  
  end
end

