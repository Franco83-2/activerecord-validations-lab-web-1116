class Post < ActiveRecord::Base
  validates :title, length: { minimum: 2 }
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
  validate :clickbaity

  def clickbaity
    errors.add(:title, "Title is currently not clickbait-y") unless clickbait_check
  end

  def clickbait_check
    !title.nil? && ["Won't Believe", "Secret", "Top", "Guess"].any? {|word| title.include?(word)} ? true : false
  end

end
