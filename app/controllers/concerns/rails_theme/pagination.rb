require 'active_support/concern'

module RailsTheme
  module Pagination
    extend ActiveSupport::Concern
    included do
      before_action :clear_pagination_options
    end

    module ClassMethods
    end

    protected

    def clear_pagination_options
      RailsTheme::Bootstrap::LinkRenderer.link_options = nil
    end

    def set_ajax_tab_pagination_render_options tab_name
      RailsTheme::Bootstrap::LinkRenderer.link_options = {
        'data-remote' => true,
        'data-type' => :html,
        'data-toggle' => 'tab',
        'data-target' => "##{tab_name}"
      }
    end
  end
end
