require 'spec_helper'

class DummyClass
end

describe Kuby::Link::PausedMethods do
  subject { DummyClass.new }

  before do
    subject.extend Kuby::Link::PausedMethods
    subject.stub(:api_get)
  end

  describe '#paused?' do
    it 'implements the p.paused call' do
      subject.should_receive(:api_get).with('p.paused')

      subject.paused?
    end

    context 'ret is non-zero' do
      before do
        subject.stub(:api_get).and_return '1'
      end

      it 'returns true' do
        expect(subject).to be_paused
      end
    end

    context 'ret is zero' do
      before do
        subject.stub(:api_get).and_return '0'
      end

      it 'returns false' do
        expect(subject).to_not be_paused
      end
    end
  end

  describe '#pause_state' do
    context 'not paused' do
      before do
        subject.stub(:api_get).and_return '0'
      end

      it 'returns :not_paused' do
        expect(subject.pause_state).to be :not_paused
      end
    end

    context 'flight paused' do
      before do
        subject.stub(:api_get).and_return '1'
      end

      it 'returns :flight_paused' do
        expect(subject.pause_state).to be :flight_paused
      end
    end

    context 'out of power' do
      before do
        subject.stub(:api_get).and_return '2'
      end

      it 'returns :out_of_power' do
        expect(subject.pause_state).to be :out_of_power
      end
    end

    context 'antenna disabled' do
      before do
        subject.stub(:api_get).and_return '3'
      end

      it 'returns :antenna_disabled' do
        expect(subject.pause_state).to be :antenna_disabled
      end
    end

    context 'vessel without antenna' do
      before do
        subject.stub(:api_get).and_return '4'
      end

      it 'returns :vessel_wo_antenna' do
        expect(subject.pause_state).to be :vessel_wo_antenna
      end
    end

    context 'unknown pause state' do
      before do
        subject.stub(:api_get).and_return '5'
      end

      it 'returns :unknown_pause_state' do
        expect(subject.pause_state).to be :unknown_pause_state
      end
    end
  end
end
