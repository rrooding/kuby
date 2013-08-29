module Kuby
  class Link
    module VesselMethods
      def altitude
        api_get('v.altitude').to_f
      end

      def height
        api_get('v.heightFromTerrain').to_f
      end

      def terrain_height
        api_get('v.terrainHeight').to_f
      end

      def mission_time
        api_get('v.missionTime').to_f
      end

      def surface_velocity
        api_get('v.surfaceVelocity').to_f
      end

      def surface_velocity_x
        api_get('v.surfaceVelocityx').to_f
      end

      def surface_velocity_y
        api_get('v.surfaceVelocityy').to_f
      end

      def surface_velocity_z
        api_get('v.surfaceVelocityz').to_f
      end

      def angular_velocity
        api_get('v.angularVelocity').to_f
      end

      def orbital_velocity
        api_get('v.orbitalVelocity').to_f
      end

      def surface_speed
        api_get('v.surfaceSpeed').to_f
      end

      def vertical_speed
        api_get('v.verticalSpeed').to_f
      end

      def atmospheric_density
        api_get('v.atmosphericDensity').to_f
      end

      def lat
        api_get('v.lat')
      end

      def long
        api_get('v.long')
      end

      def dynamic_pressure
        api_get('v.dynamicPressure').to_f
      end

      def name
        api_get('v.name')
      end
    end
  end
end
