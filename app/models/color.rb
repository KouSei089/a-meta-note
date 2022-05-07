class Color < ActiveHash::Base
  self.data = [
    { id: 1, name: '青' },
    { id: 2, name: '赤' },
    { id: 3, name: '橙' },
    { id: 4, name: '黄' },
    { id: 5, name: '緑' },
    { id: 6, name: '紫' }
  ]
end
