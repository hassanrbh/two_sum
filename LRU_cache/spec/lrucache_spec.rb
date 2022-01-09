require 'rspec'
require 'lrucache'

describe LRUCache do
    let(:lcashe) { LRUCache.new(3) }

    describe '#initialize' do
    end
    describe '#add' do 
        it 'when we add a value that is less than the capacity' do 
            # add the values to the lcashe
            lcashe.add(1)
            lcashe.add(2)
            lcashe.add(3)
            expect(lcashe.count).to eq(3)
        end
        it 'when the lcashe exeed the capacity' do 
            # add values to the lcashe to exeed it
            lcashe.add(1)
            lcashe.add(2)
            lcashe.add(3)
            lcashe.add(4)
            expect(lcashe.cashe).to eq([2,3,4])
        end
    end
    describe 'count' do
        it 'count the values that in the lcashe' do
            # add a value to the lcashe
            lcashe.add(1)
            expect(lcashe.count).to eq(1)
        end 
    end
    describe 'show' do 
        it 'shows all the values currently in the lcashe' do 
            # add a value 
            lcashe.add(1)
            cash_show = [1]
            expect(lcashe.show).to eq(cash_show)
        end
    end
end