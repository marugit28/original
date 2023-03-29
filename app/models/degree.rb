class Degree < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '1~3度' },
    { id: 3, name: '4~5度' },
    { id: 4, name: '6~7' },
    { id: 5, name: '8~10' },
    { id: 6, name: '11~13' },
    { id: 7, name: '14~15' },
    { id: 8, name: '16~18' },
    { id: 9, name: '19~20' },
    { id: 10, name: '21~23' },
    { id: 11, name: '24~25' },
    { id: 12, name: '26~28度' },
    { id: 13, name: '29~30度' },
    { id: 14, name: '31~40' },
    { id: 15, name: '41~50' },
    { id: 16, name: '51~60' },
    { id: 17, name: '61~70' },
    { id: 18, name: '71~80' },
    { id: 19, name: '81~90' },
    { id: 20, name: '91~99' }

  ]

  include ActiveHash::Associations
  has_many :items
end
