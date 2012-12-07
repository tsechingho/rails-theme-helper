module RailsTheme
  module BootstrapHelper
    def dropdown_toggle(text, url = '#')
      link_to url, class: 'dropdown-toggle', :'data-toggle' => 'dropdown' do
        text.html_safe << ' ' << content_tag(:b, nil, class: 'caret')
      end
    end

    def dropdown_btn(text, url = '#')
      link_to url, class: 'btn dropdown-toggle', :'data-toggle' => 'dropdown' do
        text.html_safe << ' ' << content_tag(:span, nil, class: 'caret')
      end
    end

    def iconed_link_to(text, url, options = {})
      icon_class = options.delete(:icon_class)
      link_to url, options do
        content_tag(:i, nil, class: icon_class) << ' ' << text
      end
    end

    def link_to_show(url, options = {})
      icon_class = options.delete(:icon_class) || 'icon-eye-open'
      default_options = { title: t('helpers.show'), class: 'btn', icon_class: icon_class }
      iconed_link_to nil, url, default_options.deep_merge(options)
    end

    def link_to_new(url, options = {})
      icon_class = options.delete(:icon_class) || 'icon-plus'
      default_options = { title: t('helpers.new'), class: 'btn', icon_class: icon_class }
      iconed_link_to nil, url, default_options.deep_merge(options)
    end

    def link_to_edit(url, options = {})
      icon_class = options.delete(:icon_class) || 'icon-edit'
      default_options = { title: t('helpers.edit'), class: 'btn', icon_class: icon_class }
      iconed_link_to nil, url, default_options.deep_merge(options)
    end

    def link_to_destroy(url, options = {})
      icon_class = options.delete(:icon_class) || 'icon-trash'
      default_options = { method: :delete, data: { confirm: t('helpers.are_you_sure') }, title: t('helpers.destroy'), class: 'btn', icon_class: icon_class }
      iconed_link_to nil, url, default_options.deep_merge(options)
    end

    def link_to_open_modal(text, url, modal_id, options = {})
      default_options = { remote: true, data: { target: modal_id, toggle: 'modal', type: 'html' }, class: 'modal-open' }
      iconed_link_to text, url, default_options.deep_merge(options)
    end

    def link_to_edit_modal(url, modal_id)
      default_options = { remote: true, data: { target: modal_id, toggle: 'modal', type: 'html' }, class: 'btn modal-open' }
      link_to_edit url, default_options
    end

    def link_to_close_button
      link_to t('helpers.close'), '#', data: { dismiss: 'modal' }, class: 'btn'
    end

    def modal_close_button
      button_tag 'x', type: 'button', name: nil, class: 'close', data: { dismiss: 'modal' }
    end

    def submit_button(f, label = nil, options = {})
      default_options = { name: nil, class: 'btn-primary' }
      f.button :submit, label, default_options.deep_merge(options)
    end

    def render_btn_group(tag = :div, options = {})
      buttons = []
      yield buttons if block_given?
      default_options = { class: 'btn-group' }
      content_tag tag, buttons.join('').html_safe, default_options.deep_merge(options)
    end

    def link_to_tab(text, tab_pane_id, options = {})
      default_options = { data: { toggle: 'tab', target: tab_pane_id} }
      link_to text, tab_pane_id, default_options.deep_merge(options)
    end

    def link_to_remote_tab(text, url, tab_pane_id, options = {})
      default_options = { remote: true, data: { toggle: 'tab', target: tab_pane_id, type: 'html' } }
      link_to text, url, default_options.deep_merge(options)
    end
  end
end
