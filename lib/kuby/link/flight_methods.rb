module Kuby
  class Link
    module FlightMethods
      def abort
        api_get('f.abort')
      end

      # Define a method for each of the 10 action groups
      (1..10).each do |group_no|
        define_method "actiongroup_#{group_no}" do
          api_get("f.ag#{group_no}")
        end
      end

      def brake
        api_get('f.brake')
      end

      def set_throttle(t)
        if t > 1.0
          t = 1.0
        elsif t < 0.0
          t = 0.0
        end

        api_set('f.setThrottle', t)
      end

      def stage!
        api_get('f.stage')
      end

      def throttle
        api_get('f.throttle').to_f
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

      def toggle_gear
        api_get('f.gear')
      end

      def toggle_light
        api_get('f.light')
      end

      def toggle_rcs
        api_get('f.rcs')
      end

      def toggle_sas
        api_get('f.sas')
      end
    end
  end
end
