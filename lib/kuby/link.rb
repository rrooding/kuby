require 'multi_json'
require 'kuby/link/api_methods'
require 'kuby/link/flight_methods'
require 'kuby/link/paused_methods'

class Kuby::Link
  MIN_TELEMACHUS_VERSION = Gem::Version.new('1.4.6.0')

  attr_reader :host, :port

  include Kuby::Link::ApiMethods
  include Kuby::Link::FlightMethods
  include Kuby::Link::PausedMethods

  def initialize(options={})
    @host = options.fetch(:host, '127.0.0.1')
    @port = options.fetch(:port, 8085).to_i
    @path = 'telemachus/datalink'
  end

  def connect!
    # Raise error when the telemachus version is not supported, this also automatically
    # checks if the connection can be made
    unless supported_version?
      raise Kuby::UnsupportedTelemachusVersion.new("Please install Telemachus #{MIN_TELEMACHUS_VERSION} or higher")
    end

    true
  end

  private

  def api_set(ret, *args)
    api_get("#{ret}[#{args.join(',')}]")
  end

  def api_get(ret)
    # All Telemachus api methods are GET, the api command is passed in as the 'ret' parameter,
    # the returned result is in the form of: {"ret":"<value>"}
    res = Excon.get(uri, { tcp_nodelay: true, query: "ret=#{ret}" })

    # Parse the result
    data = MultiJson.load(res.body, symbolize_keys: true)

    data[:ret]
  rescue Excon::Errors::SocketError, Errno::ECONNREFUSED
    # Catch different kinds of connection refused and raise custom exception
    raise Kuby::TelemachusConnectionRefused
  end

  def supported_version?
    version >= MIN_TELEMACHUS_VERSION
  end

  def uri
    @uri ||= "http://#{@host}:#{@port}/#{@path}"
  end
end
