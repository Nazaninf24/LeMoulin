class Item < ApplicationRecord

  # Relationships
  belongs_to :shop

  has_many :order_items, dependent: :destroy
  has_many :orders, through: :order_items
  has_many :shop_categories, through: :shop

  #Scopes
  scope :filter_by_name, lambda { |keyword|
    where('lower(name) LIKE ? ', "%#{keyword.downcase}%")
  }

  scope :filter_by_description, lambda { |keyword|
    where('lower(description) LIKE ? ', "%#{keyword.downcase}%")
  }

  # methodes
  def self.search(params)
    items = Item.all
    items = items.filter_by_name(params[:keyword]).or(items.filter_by_description(params[:keyword])) if params[:keyword]

    items
  end
end
