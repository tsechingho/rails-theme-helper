module RailsTheme
  module Bootstrap
    module TabHelper
      def link_to_tab text, tab_pane_id, options = {}
        options = {
          data: {
            toggle: 'tab',
            target: tab_pane_id
          }
        }.deep_merge options
        link_to text, tab_pane_id, options
      end

      def link_to_remote_tab text, url, tab_pane_id, options = {}
        options = {
          remote: true,
          data: {
            toggle: 'tab',
            target: tab_pane_id,
            type: 'html'
          }
        }.deep_merge options
        link_to text, url, options
      end

      def nav_tab text, tag_id, default
        active = tag_id == default
        li_class = 'active' if active
        [ link_to_tab(text, "##{tag_id}"), { class: li_class } ]
      end

      def tab_pane tag_id, default
        active = tag_id == default
        tab_class = 'tab-pane fade'
        tab_class << ' active in' if active
        content_tag :div, class: tab_class, id: tag_id do
          yield
        end
      end

      def remote_nav_tab text, url, tag_id, default
        active = current_page?(url) || tag_id == default
        li_class = 'active' if active
        [ link_to_remote_tab(text, url, "##{tag_id}"), { class: li_class } ]
      end

      def remote_tab_pane url, tag_id, default, partial, locals
        active = current_page?(url) || tag_id == default
        tab_class = 'tab-pane fade'
        tab_class << ' active in' if active
        content_tag :div, class: tab_class, id: tag_id do
          render partial, locals if active
        end
      end
    end
  end
end
