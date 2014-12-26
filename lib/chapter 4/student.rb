# It’s common to want to intercept an unrecognized message and decide, on the spot,
# whether to handle it or to pass it along to the original method_missing (or possibly an
# intermediate version, if another one is defined). You can do this easily by using super.
# Here’s an example of the typical pattern.

class Student
  def method_missing(m, *args)
    if m.to_s.start_with?("grade_for_")
      # return the appropriate grade, based on parsing the method name
    else
      super
    end
  end
end

