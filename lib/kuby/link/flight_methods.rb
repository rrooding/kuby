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

      def yaw=(yaw)
        api_set('v.setYaw', degree_to_f(yaw))
      end

      def pitch=(pitch)
        api_set('v.setPitch', degree_to_f(pitch))
      end

      def roll=(roll)
        api_set('v.setRoll', degree_to_f(roll))
      end

      def fly_by_wire=(state)
        api_set('v.setFbW', state ? 1 : 0)
      end

      # One command set everything
      # [float pitch, yaw, roll, x, y, z]
      def pitch_yaw_roll_xyz=(pitch:, yaw:, roll:, x:, y:, z:)
        args = [
          degree_to_f(pitch),
          degree_to_f(yaw),
          degree_to_f(roll),
          limiter(x, max: 1.0, min: 0.0),
          limiter(y, max: 1.0, min: 0.0),
          limiter(z, max: 1.0, min: 0.0)
       ]
        api_set('v.setPitchYawRollXYZ', args)
      end

      def set_throttle(t)
        api_set('f.setThrottle', limiter(t, max: 1.0, min: 0.0))
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

      def g_force
        api_get('v.geeForce')
      end

      private
      # Degrees as float -180 -> 180
      # returns -1 -> 1
      def degree_to_f(degree)
        raise ArgumentError unless degree.is_a? Numeric
        limiter(degree / 180, max: 1.0, min: -1.0)
      end

      def limiter(value, max:, min:)
        raise ArgumentError unless value.is_a? Numeric
        value = value.to_f
        if value > max
          max
        elsif value < min
          min
        else
          value
        end
      end
    end
  end
end
