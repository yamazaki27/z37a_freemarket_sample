class Item < ApplicationRecord
  belongs_to :user, optional: true
  has_many :images, dependent: :destroy
  belongs_to :category, optional: true
  belongs_to :mitem, optional: true
  belongs_to :sitem, optional: true
  has_one :trading_status

  accepts_nested_attributes_for :images

  validates :name, presence: true, length: { maximum: 40 }
  validates :content, presence: true, length: { maximum: 1000 }
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
  validates :condition,
            :category_id,
            :mitem_id,
            :sitem_id,
            :burden,
            :shipping_method,
            :from_prefecture,
            :shipping_days,
            presence: true

  enum condition: {
    '新品、未使用': 1,
    '未使用に近い': 2,
    '目立った傷や汚れなし': 3,
    'やや傷や汚れあり': 4,
    '傷や汚れあり': 5,
    '全体的に状態が悪い': 6
    }
  enum size: {
    'XS以下': 1,
    'S': 2,
    'M': 3,
    'L': 4,
    'XL': 5,
    'XL以上': 6,
    'FREE SIZE': 7
    }
  enum burden: {
    '着払い(購入者負担)': 1,
    '送料込み(出品者負担)': 2
    }
  enum shipping_method: {
    '未定': 1,
    'クロネコヤマト': 2,
    'ゆうパック': 3,
    'ゆうメール': 4,
    '未定': 5,
    'らくらくメルカリ便': 6,
    'ゆうメール': 7,
    'レターパック': 8,
    '普通郵便(定形、定形外)': 9,
    'クロネコヤマト': 10,
    'ゆうパック': 11,
    'クリックポスト': 12,
    'ゆうパケット': 13
    }
  enum from_prefecture: {
    '北海道': 1,
    '青森県': 2,
    '岩手県': 3,
    '宮城県': 4,
    '秋田県': 5,
    '山形県': 6,
    '福島県': 7,
    '茨城県': 8,
    '栃木県': 9,
    '群馬県': 10,
    '埼玉県': 11,
    '千葉県': 12,
    '東京都': 13,
    '神奈川県': 14,
    '新潟県': 15,
    '富山県': 16,
    '石川県': 17,
    '福井県': 18,
    '山梨県': 19,
    '長野県': 20,
    '岐阜県': 21,
    '静岡県': 22,
    '愛知県': 23,
    '三重県': 24,
    '滋賀県': 25,
    '京都府': 26,
    '大阪府': 27,
    '兵庫県': 28,
    '奈良県': 29,
    '和歌山県': 30,
    '鳥取県': 31,
    '島根県': 32,
    '岡山県': 33,
    '広島県': 34,
    '山口県': 35,
    '徳島県': 36,
    '香川県': 37,
    '愛媛県': 38,
    '高知県': 39,
    '福岡県': 40,
    '佐賀県': 41,
    '長崎県': 42,
    '熊本県': 43,
    '大分県': 44,
    '宮崎県': 45,
    '鹿児島県': 46,
    '沖縄県': 47,
    }
  enum shipping_days: {
    '1~2日で発送': 1,
    '2~3日で発送': 2,
    '4~7日で発送': 3
    }

end
