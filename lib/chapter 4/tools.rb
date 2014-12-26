# nesting modules and classes

# You can nest a class definition inside a module definition

module Tools
  class Hammer
  end
end

# To create an instance of the Hammer class defined inside the Tools module, you use the double-colon lookup token (::) to point the way to the name of the class: 

h = Tools::Hammer.new