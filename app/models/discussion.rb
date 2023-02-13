class Discussion < ApplicationRecord
  belongs_to :category, counter_cache: true, touch: true
  belongs_to :user, default: -> { Current.user }
  has_many :posts, dependent: :destroy

  validates :name, presence: true

  broadcasts_to :category, inserts_by: :prepend

  after_create_commit -> { broadcast_prepend_to "discussions" }
  after_update_commit -> { broadcast_replace_to "discussions" }
  after_destroy_commit -> { broadcast_remove_to "discussions" }

  accepts_nested_attributes_for :posts

  # discussion.category_name
  delegate :name, prefix: :category, to: :category, allow_nil: true

  def to_param
    "#{id}-#{name.downcase.to_s[0...100]}".parameterize
  end
end
