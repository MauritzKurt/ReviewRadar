# What is this file being used for? If it's not in the schema, it's not a model and should be in a concern
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
