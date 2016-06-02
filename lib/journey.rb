#should be responsible for starting a journey, finishing a journey, calculating the fare of a journey, and returning whether or not the journey is complete.
class Journey
  FARE = 1

  attr_reader :journey_log

  def initialize
    @journey_log = []
    journey = {}
  end

  def start station
    @journey_log << {:entry_station => station}
  end

  def finish station
    @journey_log << {:exit_station => station}
  end

  def fare (entry_station,exit_station)
    FARE
  end

  def complete
  end

end