require 'oystercard'

describe Oystercard do
	let ( :station ) { double(name: 'name', zone: 1) }

	  describe '#balance' do

		it { is_expected.to respond_to(:balance) }

		it 'has an initial balance of 0' do
			expect(subject.balance).to eq 0
		end

	  end

		describe "#top_up" do

			it { is_expected.to respond_to(:top_up).with(1).argument }

			it "should increase the balance" do
				expect{subject.top_up(5)}.to change{subject.balance}.by 5
			end

			it "raises an error if top_up amount would push balance over #{Oystercard::BALANCE_LIMIT}" do
				expect { subject.top_up(91) }.to raise_error "Can't add to your balance; would breach the £#{Oystercard::BALANCE_LIMIT} limit"
			end
		end

		describe '#touch_in(station)' do
		# 	it "should indicate that user has touched in and begins journey" do
		# 		subject.top_up(5)
		# 		subject.touch_in(station)
		# 		expect(subject).to be_in_journey
		# 	end

			it "raises an error if card balance is less than  £#{Oystercard::MIN_LIMIT}" do
				expect {subject.touch_in(station)}.to raise_error "Can't touch in your balance is below £#{Oystercard::MIN_LIMIT}"
			end
		end

		# 	it 'stores the name of a journey\'s entry station' do
		# 		subject.top_up(5)
		# 		subject.touch_in(station)
		# 		expect(subject.entry_station).to eq station
		# 	end
		# end

		describe '#touch_out(station)' do
			# it 'should indicate that the user has touched out and ends journey' do
			# 	subject.top_up(5)
			# 	subject.touch_in(station)
			# 	subject.touch_out(station)
			# 	expect(subject).not_to be_in_journey
			# end

			it "reduces the card balance by the journey fare #{Journey::FARE}" do
				subject.top_up(5)
				subject.touch_in(station)
				subject.touch_out(station)
				expect{subject.touch_out(station)}.to change{subject.balance}.by "-#{Journey::FARE}".to_i
			end

			# it 'sets the entry_station to nil on touch_out' do
			# 	subject.top_up(5)
			# 	subject.touch_in(station)
			# 	expect{subject.touch_out(station)}.to change{subject.entry_station}.to nil
			# end

			# it 'stores a journey in the journey log' do
			# 	subject.top_up(5)
			# 	subject.touch_in(station)
			# 	expect{subject.touch_out(station)}.to change{subject.journeys.length}.by 1
			# end

			# it 'should store the current entry station and exit station pair as a journey' do
			# end

			# 	it 'reset the journey\'s entry and exit stations' do
			# 	subject.top_up(5)
			# 	subject.touch_in(station)
			# 	subject.touch_out(station)
			# 	expect(subject.exit_station).to eq nil
			# end

		end

		# describe '#journeys' do
		# 	it 'has an empty log prior to the first journey' do
		# 		expect(subject.journeys).to eq []
		# 	end
		# end




		# describe '#entry_station'
		# 	it 'allows a card to "know" & store entry_station
		# end

end