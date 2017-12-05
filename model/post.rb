require 'cgi'

class Post
  attr_accessor :title, :content

  def initialize(title, content)
    self.title = title
    self.content = content
  end

  def to_text
    "#{escape_string(title)}\n#{escape_string(content)}"
  end

  def self.from_text(text)
    raw_post = text.split("\n", 2)
    Post.new(raw_post[0], raw_post[1])
  end

private

  def escape_string(str)
    str = CGI::escapeHTML(str)
    str.gsub "\n", '<br>'
  end

end
