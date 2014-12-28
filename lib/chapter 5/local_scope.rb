# Schematic view of local scopes at the top level, the class-definition level, and the method-definition level

a = 0

def t
  puts "Top level mehod t"
end

class C

  a = 1
  
  def self.x 
    a = 2
    puts "C.x; a = #{a}"
  end
  
  def m
    a = 3
    puts "C#m; a = #{a}"
  end
  
  def n
    a = 4
    puts "C#n; a = #{a}"
  end
  
  puts "Class scope: a = #{a}"

end

C.x
c = C.new
c.m
c.n

puts "Top level: a = #{a}"