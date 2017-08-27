require 'shouhizei/version'
require 'yaml'

module Shouhizei
  RoundUp = 'Up'
  RoundDown = 'Down'

  def self.rate_on(date = Date.today)
    rate_list.reverse_each do |key_date, rate|
      return rate.to_r if date >= key_date
    end
    0.0r
  end

  def self.included(price:, date: Date.today)
    included_price = price + price * rate_on(date)
    return included_price.ceil if config[:rounding] == RoundUp
    included_price.floor
  end

  def self.config
    @@config ||= {ronding: RoundDown}
  end

  private

  def self.rate_list
    @@rate_list ||= YAML.load_file(File.expand_path('./../rate_list.yml', __FILE__))
  end
end
