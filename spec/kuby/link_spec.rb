require 'spec_helper'

describe Kuby::Link do
  subject { Kuby::Link.new }

  describe '#initialize' do
    context 'without options' do
      it 'sets the host to the default' do
        expect(subject.host).to eq '127.0.0.1'
      end

      it 'sets the port to default' do
        expect(subject.port).to eq 8085
      end
    end

    context 'with host' do
      subject { Kuby::Link.new(host: 'kerbalhost.com') }

      it 'sets the host to the given value' do
        expect(subject.host).to eq 'kerbalhost.com'
      end
    end

    context 'with port' do
      subject { Kuby::Link.new(port: 1234) }

      it 'sets the port to the given value' do
        expect(subject.port).to eq 1234
      end
    end
  end

  describe '#connect!' do
    context 'unsupported version' do
      before do
        stub_request(:get, /ret=a.version\z/).to_return({status: 200, body: '{"ret":"1.4.5.0"}'})
      end

      it 'raises a Kuby::UnsupportedTelemachusVersion exception' do
        expect {
          subject.connect!
        }.to raise_error Kuby::UnsupportedTelemachusVersion
      end
    end

    context 'connection refused' do
      before do
        stub_request(:get, /.+/).to_raise(Errno::ECONNREFUSED)
      end

      it 'raises a Kuby::TelemachusConnectionRefused exception' do
        expect {
          subject.connect!
        }.to raise_error Kuby::TelemachusConnectionRefused
      end
    end

    context 'connection ok' do
       it 'returns true' do
         expect(subject.connect!).to be_true
       end
    end
  end
end
