class Destination < ApplicationRecord

  has_many :posts
  has_many :bloggers, through: :posts

  def most_recent
    self.posts.last(5)
  end

  def most_likes
    self.posts == [] ? "No one has reviewed this destination yet!" : self.posts.max_by{|post| post.likes}
  end

  def average_age
    sum = 0
    if self.posts != nil
      self.posts.each do |post|
        post_likes = post.likes == nil ? 0 : post.likes
        sum = sum+ post_likes
      end
      self.posts.count == 0 ? 0 : sum / self.posts.count
    else
      "No one has visited this destination! Be the first!"
    end
  end

end
