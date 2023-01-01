class Budgets < ActiveHash::Base
  self.data = [
    { id: 0, name: '---' },
    { id: 1, name: '~1000円' },
    { id: 2, name: '1000~2000円' },
    { id: 3, name: '2000~3000円' },
    { id: 4, name: '3000~4000円' },
    { id: 5, name: '4000~5000円' },
    { id: 6, name: '5000円~' }
  ]

  include ActiveHash::Associations
  has_many :items
end