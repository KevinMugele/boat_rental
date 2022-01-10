# frozen_string_literal: true

class Dock
  attr_reader :name, :max_rental_time, :boats, :rental_log

  def initialize(name, max_rental_time)
    @name = name
    @max_rental_time = max_rental_time
    @rental_log = {}
  end

  def rent(boat, renter)
    @rental_log[boat] = renter
  end

  def max_rental_time?(boat)
    boat.hours_rented >= max_rental_time
  end

  def total_charge(boat)
    if max_rental_time?(boat)
      boat.max_rental_time * boat.price_per_hour
    else
      boat.hours_rented * boat.price_per_hour
    end
  end

  def charge(boat)
    charge_renter = {}
    charge_renter[:card_number] = @rental_log[boat].credit_card_number
    charge_renter[:amount] = total_charge(boat)
    charge_renter
  end
end
