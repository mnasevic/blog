class Post < ActiveRecord::Base
  # Validations
  validates :title, :presence => true
  validates :content, :presence => true

  # Associations
  belongs_to :user

  # Callbacks
  before_save :reset_published_at, :unless => Proc.new {|m| m.is_publish }

  # Scopes
  scope :published, -> { where(is_publish: true) }

  def to_param
    "#{id}-#{title.parameterize}"
  end

  def self.posts_by_month
    select("published_at, COUNT(*) AS total").
    group("YEAR(published_at), MONTH(published_at)").
    where('published_at IS NOT NULL').
    order('published_at DESC')
  end

  private
    def reset_published_at
      self.published_at = nil
    end
end
