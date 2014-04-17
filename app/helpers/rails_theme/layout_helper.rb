module RailsTheme
  module LayoutHelper
    def render_list(list = [], options = {})
      options, list = list, [] if list.is_a? Hash
      yield list if block_given?
      items = ''.html_safe
      list.each_with_index do |item, index|
        if item.is_a? Array
          item_options = item.pop
          item_content = item.join('').html_safe
        else
          item_options = {}
          item_content = item
        end

        item_class = []
        item_class << 'first' if index == 0
        item_class << 'last' if index == (list.length - 1)
        link = item_content.match(/href=(["'])(.*?)(\1)/)[2] rescue nil
        item_class << 'current active' if link and (current_page?(link) rescue false)
        item_class << item_options.delete(:class) if item_options[:class]

        li_class = item_class.empty? ? nil : item_class.join(' ')
        items << content_tag(:li, item_content, item_options.merge(class: li_class) )
      end
      content_tag(:ul, items, options)
    end

    def flash_box key, value
      alert_class = case key
      when :notice
        'alert-warning'
      when :error
        'alert-danger'
      else
        "alert-#{key}"
      end
      button_options = {
        type: 'button',
        name: nil,
        class: 'close',
        data: { dismiss: 'alert' },
        'aria-hidden' => 'true'
      }
      content_tag :div, class: "alert #{alert_class} alert-dismissable #{key}" do
        button_tag('&times;'.html_safe, button_options) << value
      end
    end
  end
end
