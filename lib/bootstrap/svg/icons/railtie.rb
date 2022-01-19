require 'bootstrap/svg/icons/view_helpers'

module Bootstrap
  module Svg
    module Icons
      class Railtie < Rails::Railtie
        initializer "Bootstrap::Svg::Icons.view_helpers" do
          ActiveSupport.on_load(:action_view) { include Bootstrap::Svg::Icons::ViewHelpers }
        end
      end
    end
  end
end
