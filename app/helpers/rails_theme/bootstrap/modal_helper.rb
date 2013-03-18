module RailsTheme
  module Bootstrap
    module ModalHelper
      def link_to_modal text, url, modal_id, options = {}
        options = {
          remote: true,
          data: {
            toggle: 'modal',
            target: modal_id,
            type: 'html'
          },
          class: 'modal-open'
        }.deep_merge options
        link_to text, url, options
      end

      def link_to_open_modal text, url, modal_id, options = {}
        options = {
          remote: true,
          data: {
            toggle: 'modal',
            target: modal_id,
            type: 'html'
          },
          class: 'modal-open'
        }.deep_merge options
        iconed_link_to text, url, options
      end

      def link_to_edit_modal url, modal_id, options = {}
        options = {
          remote: true,
          data: {
            toggle: 'modal',
            target: modal_id,
            type: 'html'
          },
          class: 'modal-open btn'
        }.deep_merge options
        link_to_edit url, options
      end

      def link_to_close_button
        options = {
          data: { dismiss: 'modal' },
          class: 'btn'
        }
        link_to t('helpers.close'), '#', options
      end

      def modal_close_button
        options = {
          type: 'button',
          name: nil,
          data: { dismiss: 'modal' },
          class: 'close'
        }
        button_tag 'x', options
      end
    end
  end
end
