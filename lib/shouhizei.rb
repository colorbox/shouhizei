require "shouhizei/version"

require'yaml'

module Shouhizei
  def self.rate_on(date = Date.today)
    rate_list.reverse_each do |key_date, rate|
      return rate.to_r if date >= key_date
    end
    0.0r
  end

  private

  def self.rate_list
    @@rate_list ||= YAML.load_file(File.expand_path('./../rate_list.yml', __FILE__))
  end
end
