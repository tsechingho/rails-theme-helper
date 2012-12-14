require 'rails-i18n'

require 'rails_theme/engine'

if defined? ::WillPaginate
  require 'will_paginate/array'
  require 'rails_theme/bootstrap/link_renderer'
end

module RailsTheme
end
