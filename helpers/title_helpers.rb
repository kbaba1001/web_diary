module TitleHelpers
  # NOTE title should a string of `%H%M%S` format
  def display_title(title)
    title.to_s.gsub(/(\d{2})(\d{2})(\d{2})/, '\1:\2:\3')
  end
end
