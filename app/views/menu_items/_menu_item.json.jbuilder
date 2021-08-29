json.extract! menu_item, :id, :product_id, :category_id, :position, :created_at, :updated_at
json.url menu_item_url(menu_item, format: :json)
