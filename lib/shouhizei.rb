require 'shouhizei/version'
require 'yaml'
require 'active_support'
require 'active_support/core_ext'

module Shouhizei
  RoundUp = 'Up'
  RoundDown = 'Down'
  Round = 'Round'

  def self.rate_on(time = Time.current, reduced: false)
    date = time.in_time_zone('Asia/Tokyo').to_date
    rate_list.reverse_each do |key_date, rate|
      rate_key = reduced && rate['reduced'] ? 'reduced' : 'default'

      return rate[rate_key].to_r if date >= key_date
    end
    0.0r
  end

  def self.including(price:, time: Time.current, reduced: false, rounding: config[:rounding])
    including_price = price + price * rate_on(time, reduced: reduced)

    return including_price.round if rounding == Round
    return including_price.ceil if rounding == RoundUp
    including_price.floor
  end

  def self.config
    @@config ||= {rounding: RoundDown}
  end

  def self.rate_list
    @@rate_list ||= begin
      path = File.expand_path('./../rate_list.yml', __FILE__)
      list = YAML.safe_load_file(path, permitted_classes: [Date])
      list.each_value { |rate| rate.each_value(&:freeze).freeze }
      list.freeze
    end
  end
  private_class_method :rate_list
end
