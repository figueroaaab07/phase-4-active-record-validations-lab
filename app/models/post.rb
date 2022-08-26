class Post < ApplicationRecord
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
  validate :not_to_allow_to_be

  def not_to_allow_to_be
    errors.add(:title, "not to allow to be") unless title.present? && (["Won't Believe", "Secret", "Guess"].any? { |s| title.include?(s)} || /Top\b\s\d+\b/.match?(title))
  end

end
