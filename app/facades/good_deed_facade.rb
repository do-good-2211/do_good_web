# frozen_string_literal: true

# app/facades/good_deed_facade.rb
class GoodDeedFacade
  def initialize; end

  def get_deeds
    GoodDeedService.good_deeds[:data].map { |deed| Deed.new(deed) }
  end
end
