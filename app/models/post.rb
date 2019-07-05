class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: { minimum: 10 }
    validates :summary, length: { maximum: 20 }
    validates_each :category do |record, attr, value|
        record.errors.add(attr, 'must be a fiction') if value != "Fiction"
    end
    validate :click_bait?


    def click_bait?
        baits = ["Won't Believe", "Secret", "Top [number]", "Guess"]
        if title && baits.none? { |bait| title.include?(bait) }
          errors.add(:title, "is not a clickbait")
        end
      end
end
