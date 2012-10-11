
# The Shuffleable module contains methods that enable randomly shuffling an array
module SpinWheel
  def spin_wheel(wheel)
	# shuffle! is a built in array method
	# could substitute an arbitrary shuffling algorithm here
    return wheel.shuffle!
  end
end