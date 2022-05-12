class Color < ActiveHash::Base
  self.data = [
    { id: 1, name: 'gray', color_num: 'rgb(200, 200, 200, 0.5)' },
    { id: 2, name: 'blue', color_num: 'rgb(3, 103, 166, 0.5)' },
    { id: 3, name: 'red', color_num: 'rgb(217, 50, 50, 0.5)' },
    { id: 4, name: 'orange', color_num: 'rgb(242, 127, 61, 0.5)' },
    { id: 5, name: 'yellow', color_num: 'rgb(242, 202, 80, 0.5)' },
    { id: 6, name: 'green', color_num: 'rgb(8, 166, 63, 0.5)' },
    { id: 7, name: 'purple', color_num: 'rgb(136, 111, 191, 0.5)' }
  ]
end
