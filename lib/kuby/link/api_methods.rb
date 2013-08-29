module Kuby
  class Link
    module ApiMethods
      def version
        Gem::Version.new api_get('a.version')
      end
    end
  end
end
