class Post < ActiveRecord::Base
    validates :title, presence: true

    validates :content,length: {minimum: 250}

    validates :summary, length: {maximum: 250}
    
    validates :category, inclusion: { in: %w(Fiction Non-Fiction) }

    validate :clickbait?

    def clickbait?
        clickbait = ["Won't Believe", "Secret", "Top[number]", "Guess"]
        if title && !clickbait.any? { |w| title.include?(w) }
          errors.add(:title, " needs to be more clickbait-y")
        end
      end
end
