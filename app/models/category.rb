class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '日本酒' },
    { id: 3, name: 'ワイン' },
    { id: 4, name: '焼酎' },
    { id: 5, name: 'ビール' },
    { id: 6, name: 'サワー' },
    { id: 7, name: 'ウィスキー' },
    { id: 8, name: 'ジン' },
    { id: 9, name: 'カクテル' },
    { id: 10, name: '果実酒' },
    { id: 11, name: 'その他' }

  ]

  include ActiveHash::Associations
  has_many :items
end
