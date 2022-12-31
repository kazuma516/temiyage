class FourSeason < ActiveHash::Base
  self.data = [
    { id: 0, name: '---' },
    { id: 1, name: '春' },
    { id: 2, name: '夏' },
    { id: 3, name: '秋' },
    { id: 4, name: '冬' },
    { id: 5, name: 'いつでも' },
    { id: 6, name: 'その他' }
  ]

    include ActiveHash::Associations
    has_many :items
end