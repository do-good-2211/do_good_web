class RandomActFacade
  def initialize; end

  def create_acts
    RandomActService.get_acts[:data][:attributes][:deed_names].map do |act|
      RandomAct.new(act)
    end
  end
end
