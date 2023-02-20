class PostForm
  include ActiveModel::Model

  attr_accessor :text, :image

  with_options presence: true do
    validates :text
    validates :image

    def save
      Post.create(text: text, image: image)
    end
end