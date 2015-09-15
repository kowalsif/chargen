

class Writer 
  
  def initialize()
    @filename = "./charsheet"
    @level = 0
    @file
  end
  
  def intro()
    #@file.write("<!DOCTYPE HTML><html lang=\"en\">	<head>		<meta charset=\"UTF-8\">		<title>	Minimized Char. </title>		<link rel=\"stylesheet\" href=\"style.css\">		<script src=\"scripts.js\"> </script>	</head>	<body>"
	  #@level = 1
  end
  
  def close()
    @file.write("</body>")
    @file.close
  end
  
  def str_num_level_increments(str)
    incs = 0
    incs += str.split("<").Length
    incs -= str.split("/>").Length
    incs
  end
  
  def write(str)
    if (@file.equals nil)
      @file = IO.new(@filename, mode: "w")
      intro()
    end
    lines = str.split("\n") 
    lines.each do |line|
      x = 0
      while x < @level do
        @file.write("\t")
        x = x + 1
      end
      @file.write(line)
      @level += str_num_level_increments(line)
    end
  end

end

