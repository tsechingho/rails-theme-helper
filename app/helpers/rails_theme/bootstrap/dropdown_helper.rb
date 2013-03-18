module RailsTheme
  module Bootstrap
    module DropdownHelper
      def dropdown_toggle text, url = '#', options = {}
        text = text.html_safe << ' '
        text << content_tag(:span, nil, class: 'caret')
        options = {
          class: 'dropdown-toggle',
          data: { toggle: 'dropdown' }
        }.deep_merge options
        link_to text, url, options
      end

      def dropdown_btn text, url = '#', options = {}
        options = {
          class: 'btn dropdown-toggle'
        }.deep_merge options
        dropdown_toggle text, url, options
      end

      def dropdown_menu options = {}, &block
        options = {
          class: 'dropdown-menu'
        }.deep_merge options
        render_list options, &block
      end
    end
  end
end
