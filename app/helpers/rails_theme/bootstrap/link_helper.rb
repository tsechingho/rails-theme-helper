module RailsTheme
  module Bootstrap
    module LinkHelper
      def iconed_link_to text, url, options = {}
        icon_class = options.delete(:icon_class)
        text = content_tag(:i, nil, class: icon_class) << ' ' << text
        link_to text, url, options
      end

      def link_to_show url, options = {}
        icon_class = options.delete(:icon_class) || 'glyphicon glyphicon-eye-open'
        options = {
          role: 'button',
          class: 'btn btn-default',
          icon_class: icon_class,
          title: t('helpers.show')
        }.deep_merge options
        default_options = {  }
        iconed_link_to nil, url, options
      end

      def link_to_new url, options = {}
        icon_class = options.delete(:icon_class) || 'glyphicon glyphicon-plus'
        options = {
          role: 'button',
          class: 'btn btn-default',
          icon_class: icon_class,
          title: t('helpers.new')
        }.deep_merge options
        iconed_link_to nil, url, options
      end

      def link_to_edit url, options = {}
        icon_class = options.delete(:icon_class) || 'glyphicon glyphicon-edit'
        options = {
          role: 'button',
          class: 'btn btn-default',
          icon_class: icon_class,
          title: t('helpers.edit')
        }.deep_merge options
        iconed_link_to nil, url, options
      end

      def link_to_destroy url, options = {}
        icon_class = options.delete(:icon_class) || 'glyphicon glyphicon-trash'
        options = {
          method: :delete,
          data: { confirm: t('helpers.are_you_sure') },
          role: 'button',
          class: 'btn btn-default',
          icon_class: icon_class,
          title: t('helpers.destroy')
        }.deep_merge options
        iconed_link_to nil, url, options
      end
    end
  end
end
