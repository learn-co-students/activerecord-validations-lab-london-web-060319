class Post < ActiveRecord::Base
  validates :title, presence: true
  validates(:content, {:length => {:minimum => 10}})
  validates(:summary, {:length => {:maximum => 150}})
  validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
  validate :clickbait?


  def clickbait?
    baits = ["Won't Believe", "Secret", "Top [number]", "Guess"]

    if title && baits.none?{|bait|title.include?(bait)}
      
      errors.add(:title, "must be clickbait")
    end
  end


end
