require 'rails_helper'

module UiText
  describe HashKeys do
    let(:hash) do
      {
        b: 'Foo',
        a: {
          b: 'Foo',
          c: 'Bar',
          d: {
            e: 'Foo',
            x: [1, 2, 3],
            s: nil
          }
        },
      }
    end

    it 'Keys in same order' do
      expect(HashKeys.flat_key_map(hash).keys).to eq([
        'b',
        'a.b',
        'a.c',
        'a.d.e',
        'a.d.x',
        'a.d.s',
      ])
    end

    it 'Full data' do
      expect(HashKeys.flat_key_map(hash)).to eq({
        'b' => 'Foo',
        'a.b' => 'Foo',
        'a.c' => 'Bar',
        'a.d.e' => 'Foo',
        'a.d.x' => [1, 2, 3],
        'a.d.s' => nil,
      })
    end

    it 'nil' do
      expect(HashKeys.flat_key_map(nil)).to eq({})
    end
  end
end
