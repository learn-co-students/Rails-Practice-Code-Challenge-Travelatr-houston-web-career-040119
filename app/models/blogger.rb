class Blogger < ApplicationRecord
  validates :name, uniqueness: true
  validates :age, numericality: {greater_than: 0}
  validates :bio, length: {minimum: 30}

  has_many :posts
  has_many :destinations, through: :posts

  def top_five
    self.posts.sort{|a,b| b.likes <=> a.likes}[0..4]
  end

  def most_likes
    self.posts.max_by{|post| post.likes}
  end

  def total_likes
    sum = 0
    if self.posts != nil
      self.posts.each do |post|
        post_likes = post.likes == nil ? 0 : post.likes
        sum = sum+ post_likes
      end
    end
    sum
  end

end
