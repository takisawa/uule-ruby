# frozen_string_literal: true

RSpec.describe Uule do
  describe '.encode' do
    context 'when valid location canonical code' do
      it do
        expect(Uule.encode('Sapporo,Hokkaido,Japan')).to eq 'w+CAIQICIWU2FwcG9ybyxIb2trYWlkbyxKYXBhbg=='
      end
    end
    context 'when invalid location canonical code' do
      it do
        expect { Uule.encode('invalid') }.to raise_error(Uule::InvalidLocationCanonicalNameError)
      end
    end
  end

  describe '.decode' do
    it do
      expect(Uule.decode('w+CAIQICIWU2FwcG9ybyxIb2trYWlkbyxKYXBhbg==')).to eq 'Sapporo,Hokkaido,Japan'
    end
  end
end
