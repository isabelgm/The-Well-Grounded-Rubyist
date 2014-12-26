class Person

  PEOPLE = []
  attr_reader :name, :hobbies, :friends

  def initialize(name)
    @name = name
    @hobbies = []
    @friends = []
    PEOPLE << self
  end

  def has_hobby(hobby)
    @hobbies << hobby
  end

  def has_friend(friend)
    @friends << friend
  end

  def self.method_missing(m, *args)
    method = m.to_s
    if method.start_with?("all_with_")
      attr = method[9..-1]
      if self.public_method_defined?(attr)
        PEOPLE.find_all do |person|
          person.send(attr).include?(args[0])
        end
      else 
        raise ArgumentError, "Can't find #{attr}"
      end
    else
      super
    end
  end

end

# The reason for the call to to_s is that the method name (the message) gets handed
# off to method_missing in the form of a symbol. Symbols don’t have a start_with?
# method, so we have to convert the symbol to a string before testing its contents.
#  The conditional logic branches on whether we’re handling an all_with_* message.
# If we are, we handle it. If not, we punt with super

# We stash all existing people in an array, held in the PEOPLE constant . When a new
# person is instantiated, that person is added to the people array. Meanwhile, we
# need some reader attributes: name, hobbies, and friends. Providing these attributes 
# lets the outside world see important aspects of the Person objects; hobbies
# and friends will also come in handy in the full implementation of method_missing.
# The initialize method takes a name as its sole argument and saves it to @name. It
# also initializes the hobbies and friends arrays. These arrays come back into play in
# the has_hobby and has_friend methods F, which are really just user-friendly wrappers around those arrays. 

