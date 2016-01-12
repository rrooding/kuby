require 'spec_helper'

class DummyClass
end

describe Kuby::Link::ResourceMethods do
  subject { DummyClass.new }

  before do
    subject.extend Kuby::Link::ResourceMethods
    allow(subject).to receive(:api_get)
  end

  describe '#resource' do
    it 'implements the r.resource[LiquidFuel] call' do
      expect(subject).to receive(:api_set).with("r.resource", "LiquidFuel")

      subject.resource('LiquidFuel')
    end
  end
end
