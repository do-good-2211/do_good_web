# frozen_string_literal: true

# app/facades/random_act_facade.rb
class RandomActFacade
  def initialize; end

  def create_acts
    RandomActService.get_acts[:data][:attributes][:deed_names].map do |act|
      RandomAct.new(act)
    end
  end
end
