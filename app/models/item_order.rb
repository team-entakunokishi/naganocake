class ItemOrder < ApplicationRecord
  belongs_to :order
  belongs_to :item
  
	enum product_status: {"着手不可": 1,"製作待ち": 2,"製作中": 3,"制作完了": 4}

end
