RSpec.describe Uule do
  describe '.encode' do
    it do
      expect(Uule.encode('Sapporo,Hokkaido,Japan')).to eq 'w+CAIQICIWU2FwcG9ybyxIb2trYWlkbyxKYXBhbg=='
    end
  end
end
