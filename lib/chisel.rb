require './lib/html_tags'
require 'pry'

class Chisel

  def single_line_paragraph(string)
    "<p>" + string + "</p>"
  end

  def single_line_break_paragraph(string)
     new_string = string.tr("\n", "")
     "<p>" + new_string + "</p>"
  end

  def multiple_paragraphs_with_2_line_breaks(string)
    string.split("\n\n").map do |paragraph|
      single_line_break_paragraph(paragraph)
    end.join("\n")
  end

  def for_hashtags(string)
    input_text = string.split
    html_tag = HtmlTags.new.html_tags[input_text[0]]
    text = input_text[1..input_text.length]
    phrase = "<#{html_tag}>#{text.join(' ')}</#{html_tag}>"
  end

  def for_hashtags(string)
    input_text = string.split
    html_tag = HtmlTags.new.html_tags[input_text[0]]
    text = input_text[1..input_text.length]
    html_text = "<#{html_tag}>#{text.join(' ')}</#{html_tag}>"
  end



  # def header_and_paragraph(string)
  #   if string.for_hashtags
  #   else single_line_paragraph
  #   end
  # end









end
