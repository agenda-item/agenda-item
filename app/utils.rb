def is_valid_filename (filename)
  valid = true
  if filename.include? "/"
    valid = false
  elsif filename.length > 20
    valid = false
  end
  valid
end

def can_second(user)
  if @mover != user
  end
end
