#
class Ad < ActiveRecord::Base

  ratyrate_rateable 'quality'

  # Callbacks
  before_save :md_to_html

  # Associations
  belongs_to :member
  belongs_to :category, counter_cache: true
  has_many :comments

  # Validates
  validates :title, :description_md, :description_short, :category, presence: true
  validates :picture, :finish_date, presence: true
  validates :price, numericality: { greater_than: 0 }

  # Scopes
  scope :descending_order, ->(page) { order(created_at: :desc).page(page).per(9) }
  scope :to_the, ->(member) { where(member: member) }
  scope :by_category, ->(id, page) { where(category: id).page(page).per(9) }
  scope :search, ->(q, page) { where('lower(title) LIKE ?', "%#{q.downcase}%").page(page).per(9) }

  # paperclip
  has_attached_file :picture,
                    styles: { large: '800x300#', medium: '320x150#', thumb: '100x100>' },
                    default_url: '/images/:style/missing.png'
  validates_attachment_content_type :picture, content_type: %r{\Aimage\/.*\z}

  # gem money-rails
  monetize :price_cents

  private

  def md_to_html
    self.description = Kramdown::Document.new(self.description_md).to_html
  end
end
