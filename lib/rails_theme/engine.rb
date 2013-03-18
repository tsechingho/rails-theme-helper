module RailsTheme
  class Engine < ::Rails::Engine
  end
end

require 'rails-i18n'

if defined? ::WillPaginate
  require 'will_paginate/array'
  require 'rails_theme/bootstrap/link_renderer'
end
