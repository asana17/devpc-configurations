local nord = require'lualine.themes.nord'
require('lualine').setup{
  options = { theme = nord },
  sections = {
    lualine_c = {
      {
        'filename',
        path = 1
      }
    }
  }
}
