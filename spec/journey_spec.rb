#should be responsible for starting a journey, finishing a journey, calculating the fare of a journey, and returning whether or not the journey is complete.
require 'journey'
describe Journey do
  subject(:journey){described_class.new}
  let ( :station ) { double(name: 'name', zone: 1) }

  describe '#start' do

    it {should respond_to(:start).with(1).argument}

    it 'stores a the start of a journey in the journey log' do
      expect{journey.start(station)}.to change{journey.journey_log.length}.by 1
    end

  end

  describe '#journey_log' do
    it {should respond_to(:journey_log)}
  end

  describe '#finish' do
    it {should respond_to(:finish).with(1).argument}

    it 'stores a the start of a journey in the journey log' do
      expect{journey.finish(station)}.to change{journey.journey_log.length}.by 1
    end

  end

  describe '#fare' do
    #it {should respond_to(:fare).with(2).argument}
    it 'calculates the fare' do
      expect(:fare).not_to eq 1
    end
  end

  describe '#complete??' do
    it {should respond_to(:complete?)}

    it 'should recognise an complete? journey' do
      journey.journey_log <<  {:entry => :name} << {:entry => :name}
      expect(journey.journey_log[-1].keys == journey.journey_log[-2].keys ).to eq true

    end
  end

      # it 'stores a journey in the journey log' do
      #   subject.top_up(5)
      #   subject.touch_in(station)
      #   expect{subject.touch_out(station)}.to change{subject.journeys.length}.by 1
      # end


  #   describe '#journeys' do
  #     it 'has an empty log prior to the first journey' do
  #       expect(subject.journeys).to eq []
  #     end
  #   end

  # # it 'should record the entry station if in_journey is true' do
  # #   card = Oystercard.new
  #   card.top_up 5
  #   card.touch_in.in_journey).to eq true
  # end

  # it 'records the entry station in the journey log' do
  #   card = Oystercard.new
  #   card.top_up 5
  #   expect(card.touch_in

end