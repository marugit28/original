class Atmosphere < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: 'デート' },
    { id: 3, name: '女子会' },
    { id: 4, name: '男子会' },
    { id: 5, name: '接待' },
    { id: 6, name: '友人と' },
    { id: 7, name: 'バー' },
    { id: 8, name: '高級' },
    { id: 9, name: 'コスパ' },
    { id: 10, name: 'その他' }

  ]

  include ActiveHash::Associations
  has_many :items
end
