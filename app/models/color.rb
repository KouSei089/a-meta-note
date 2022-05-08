class Color < ActiveHash::Base
  self.data = [
    { id: 1, name: 'blue', color_num: '#0367A6' },
    { id: 2, name: 'red', color_num: '#D93232' },
    { id: 3, name: 'orange', color_num: '#F27F3D' },
    { id: 4, name: 'yellow', color_num: '#F2CA50' },
    { id: 5, name: 'green', color_num: '#08A63F' },
    { id: 6, name: 'purple', color_num: '#886FBF' }
  ]
end
