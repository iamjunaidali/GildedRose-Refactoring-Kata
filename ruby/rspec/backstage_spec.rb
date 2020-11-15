require_relative 'spec_helper'

describe BackstagePassItem do
  let(:expired) { described_class.new("Backstage Pass", 0, 5)}
  let(:less_than_five) { described_class.new("Backstage Pass", 2, 5)}
  let(:less_than_ten) { described_class.new("Backstage Pass", 8, 5)}
  let(:ten_or_greater) { described_class.new("Backstage Pass", 10, 5)}

  describe '#update_item' do
    context 'when sell_in is greater than 10' do
      it 'increase quality by 1' do
        ten_or_greater.update_item
        expect(ten_or_greater.quality).to eq 6
      end
    end

    context 'when sell_in is between 5-9' do
      it 'increase quality by 2' do
        less_than_ten.update_item
        expect(less_than_ten.quality).to eq 7
      end
    end

    context 'when sell_in is between 1-4' do
      it 'increase quality by 3' do
        less_than_five.update_item
        expect(less_than_five.quality).to eq 8
      end
    end

    context 'when expired' do
      it 'set quality to 0' do
        expired.update_item
        expect(expired.quality).to eq 0
      end
    end
  end
end
