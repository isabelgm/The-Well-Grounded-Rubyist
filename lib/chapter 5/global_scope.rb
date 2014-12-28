$gvar = "I'm a global"

class C
  def examine_global
    puts $gvar
  end
end

c = C.new
c.examine_global

# Globally scoped data is fundamentally in conflict with the object-oriented philosophy
# of endowing objects with abilities and then getting things done by sending
# requests to those objects. Some Ruby programmers work for years and never use a single
# global variable (except perhaps a few of the built-in ones). That may or may not
# end up being your experience, but it’s not a bad target to aim for. 