class Post
  attr_accessor :title, :content

  def initialize(title, content)
    self.title = title
    self.content = content
  end

  def to_html
    "<h2>#{title}</h2><br />#{content}</p><br />"
  end
end
