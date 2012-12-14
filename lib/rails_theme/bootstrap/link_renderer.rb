require 'will_paginate/view_helpers/action_view'

# you can just use pagination with ajax or not:
#
# 1) settings for ajax pagination, ex:
#
# RailsTheme::Bootstrap::LinkRenderer.link_options = {
#   'data-remote' => true,
#   'data-type' => :html,
#   'data-toggle' => 'tab',
#   'data-target' => "##{state_name}"
# }
#
# 2) use in views:
#
# will_paginate(collection, {
#   renderer: RailsTheme::Bootstrap::LinkRenderer,
#   inner_window: 2,
#   outer_window: 0,
#   class: 'pagination',
#   previous_label: '&larr;'.html_safe,
#   next_label: '&rarr;'.html_safe
# })
#
module RailsTheme
  module Bootstrap
    class LinkRenderer < ::WillPaginate::ActionView::LinkRenderer
      cattr_accessor :link_options

      protected

      def html_container(html)
        tag :div, tag(:ul, html), container_attributes
      end

      def page_number(page)
        options = { rel: rel_value(page) }
        options.deep_merge! link_options unless link_options.blank?
        unless page == current_page
          tag :li, link(page, page, options)
        else
          tag :li, link(page, '#', options), class: 'active'
        end
      end

      def gap
        tag :li, link(super, '#'), class: 'disabled'
      end

      def previous_or_next_page(page, text, class_name)
        options = {}
        options.deep_merge! link_options unless link_options.blank?

        class_name = "#{class_name} #{class_name[0..3]}"
        if page
          tag :li, link(text, page, options), class: class_name
        else
          tag :li, link(text, "#", options), class: class_name + ' disabled'
        end
      end
    end    
  end
end
