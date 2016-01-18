require 'spec_helper'

class DummyClass
end

describe Kuby::Link::ApiMethods do
  subject { DummyClass.new }

  before do
    subject.extend Kuby::Link::ApiMethods
    allow(subject).to receive(:api_get)
  end

  describe '#version' do
    it 'implements the a.version call' do
      expect(subject).to receive(:api_get).with('a.version')

      subject.version
    end

    it 'returns a Gem::Version instance' do
      expect(subject.version).to be_an_instance_of Gem::Version
    end

    it 'sets the version to the returned version' do
      allow(subject).to receive(:api_get).and_return('1.2.3.4')

      expect(subject.version.to_s).to eq '1.2.3.4'
    end
  end
end
