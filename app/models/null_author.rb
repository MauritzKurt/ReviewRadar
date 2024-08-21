class NullAuthor
  def method_missing(*)
    nil
  end

  def respond_to_missing?(_, _)
    true
  end

  def username
    "Anonymous"
  end

  def avatar_image
    'avatar_placeholder.png'
  end
end
