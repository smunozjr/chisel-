require './lib/header_sizer'
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

  def header_tags(string)
    input_text = string.split
    html_tag = HeaderSizer.new.sizes[input_text[0]]
    text = input_text[1..input_text.length]
    phrase = "<#{html_tag}>#{text.join(' ')}</#{html_tag}>"
  end

  def header_and_paragraph(string)
    paragraph_lines = string.split("\n")
    tag_lines = paragraph_lines.map do |line|
      if line[0] == "#"
        header_tags(line)
      else
        single_line_paragraph(line)
      end
    end
     tag_lines.join("\n")
  end

  def emphasis(string)
    a = string.split
    b =  a.map do |word|
      # binding.pry
      if word[0..1] == "**"
        # binding.pry
        word.sub("**", "<strong>")
      elsif word[-2..-1] == "**"
        word.sub("**", "</strong>")
      elsif word[0] == "*" && word.length > 1
         word.sub("*", "<em>")
      elsif word[-1] == "*"
        # binding.pry
        word.sub("*", "</em>")
      else
        # binding.pry
        word
      end
    end
      b.join(' ')

  end









end
