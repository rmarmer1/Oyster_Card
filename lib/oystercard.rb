require_relative 'journey'


class Oystercard

	BALANCE_LIMIT = 90
	MIN_LIMIT = 1



	attr_reader :balance, :in_journey, :entry_station

	def initialize(journey = Journey.new)
		@journey = journey
		@balance = 0
		@in_journey = false
		@entry_station = nil
		@exit_station = nil
		@journeys = []
	end

	def in_journey?

		@entry_station
	end

	def top_up(amount)
		fail "Can't add to your balance; would breach the £#{Oystercard::BALANCE_LIMIT} limit" if @balance + amount > BALANCE_LIMIT
		@balance += amount
		self
	end

	def touch_in(station)
		fail "Can't touch in your balance is below £#{Oystercard::MIN_LIMIT}" if @balance < MIN_LIMIT
		@journey.start(station)
		@in_journey = true
		@entry_station = station
				# self
	end

	def touch_out(station)

		@journey.finish(station)
		@in_journey = false
		# @journeys << {:exit => station}
		fare = @journey.fare(@entry_station,station)
		# saves the journey and then sets entry station to nil
		# @entry_station = nil
		# @exit_station = nil
		deduct(fare)
		# self
	end

	private

	def deduct(amount)
		@balance -= amount
	end

end