# require 'pry'
class Transporter

  def initialize(enterprise)
    @enterprise = enterprise
    @power = false
    connect_to_power
  end

  def connect_to_power
    @power = @enterprise.reactor.on
  end

  def energize(obj:, from:, to:)
    return unless @power

    if @enterprise.reactor.draw_power(3)
              # binding.pry
      to.contents << from.contents.delete(obj)
      return obj
    end
  end

end
