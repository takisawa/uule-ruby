# frozen_string_literal: true

RSpec.describe Uule do
  describe '.encode' do
    it do
      expect(Uule.encode('Sapporo,Hokkaido,Japan')).to eq 'w+CAIQICIWU2FwcG9ybyxIb2trYWlkbyxKYXBhbg=='
    end
  end

  describe '.decode' do
    it do
      expect(Uule.decode('w+CAIQICIWU2FwcG9ybyxIb2trYWlkbyxKYXBhbg==')).to eq 'Sapporo,Hokkaido,Japan'
    end
  end
end
