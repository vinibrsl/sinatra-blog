class Post
  attr_accessor :title, :content

  def initialize(title, content)
    self.title = title
    self.content = content
  end

  def to_s
    "#{title}\n#{content}"
  end
end
