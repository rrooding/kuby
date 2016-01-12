module Kuby
  class Link
    module ResourceMethods

      def resource(type)
        api_set('r.resource', type).to_f
      end

      def current_stage_resource(type)
        api_set('r.resourceCurrent', type).to_f
      end

      def current_stage_max_resource(type)
        api_set('r.resourceCurrentMax', type).to_f
      end

      def max_resource(type)
        api_set('r.resourceMax', type).to_f
      end
    end
  end
end
