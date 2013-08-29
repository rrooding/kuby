module Kuby
  class Link
    module FlightMethods
      def abort
        api_get('f.abort')
      end

      def brake
        api_get('f.brake')
      end

      def toggle_gear
        api_get('f.gear')
      end

      def toggle_light
        api_get('f.light')
      end

      def stage!
        api_get('f.stage')
      end

      def throttle_down
        api_get('f.throttleDown')
      end

      def throttle_up
        api_get('f.throttleUp')
      end

      def throttle_full
        api_get('f.throttleFull')
      end

      def throttle_zero
        api_get('f.throttleZero')
      end
    end
  end
end
