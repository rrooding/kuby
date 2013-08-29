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
end
