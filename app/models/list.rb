class List < ApplicationRecord
  # 1対1（単数枚画像投稿）で関連付けるという宣言　：imageは代数
  has_one_attached :image
  # １対多（複数枚画像投稿）で関連付ける場合は
  # has_many_attached :images と記載
  validates :title, presence: true
  validates :body, presence: true
  validates :image, presence: true
end
