module TitleHelpers
  # NOTE
  #   title should a string of `%H%M%S` format
  #   date should a string of `%Y/%m/%d` format
  def display_title(title, date)
    time = title.to_s.gsub(/(\d{2})(\d{2})(\d{2})/, '\1:\2:\3')

    if date
      "#{date} #{time}"
    else
      time
    end
  end
end
