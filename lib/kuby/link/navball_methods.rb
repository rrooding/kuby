module Kuby
  class Link
    module NavballMethods
      def heading
        api_get('n.heading').to_f
      end

      def pitch
        api_get('n.pitch').to_f
      end

      def roll
        api_get('n.roll').to_f
      end
    end
  end
end
