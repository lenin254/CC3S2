# main.rb
def bad_example
    i_might_raise_exception!
  rescue Exception
    nah_i_will_always_be_here_for_you
  end