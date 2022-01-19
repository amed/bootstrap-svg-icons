# frozen_string_literal: true

require_relative "version"

module Bootstrap
  module Svg
    module Icons
      module ViewHelpers
        def bi_icon(*params)
          bi_icon_class(params[0], params[1]).html_safe
        end

        private

        def bi_icon_class(name, class_str)
          !class_str ? "#{bs_file(name)}" : "<span class=\"#{class_str}\">#{bs_file(name)}</span>"
        end

        def bs_file(name)
          begin
            File.read(File.join(File.dirname(__FILE__), "svg-files/#{name}.svg"))
          rescue
            "#{name}:__not_found__"
          end
        end
      end
    end
  end
end
