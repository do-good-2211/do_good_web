class GoodDeedFacade
  def initialize
  end

  def get_deeds
    x = GoodDeedService.good_deeds[:data].map { |deed| Deed.new(deed) }
  end
end