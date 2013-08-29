class Kuby::Link
  attr_reader :host, :port

  def initialize(options={})
    @host = options.fetch(:host, '127.0.0.1')
    @port = options.fetch(:port, 8085).to_i
  end
end
