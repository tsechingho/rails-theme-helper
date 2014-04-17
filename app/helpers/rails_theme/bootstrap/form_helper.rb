module RailsTheme
  module Bootstrap
    module FormHelper
      def submit_button f, label = nil, options = {}
        options = {
          name: nil,
          class: 'btn btn-primary'
        }.deep_merge options
        f.button :submit, label, options
      end
    end
  end
end
