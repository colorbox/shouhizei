require 'test_helper'
require 'timecop'

class ShouhizeiTest < Minitest::Test
  def test_rate_on
    assert_equal(0.0r,  Shouhizei.rate_on(Date.new(1989, 3, 31)))
    assert_equal(0.03r, Shouhizei.rate_on(Date.new(1989, 4, 1)))
    assert_equal(0.03r, Shouhizei.rate_on(Date.new(1997, 3, 31)))
    assert_equal(0.05r, Shouhizei.rate_on(Date.new(1997, 4, 1)))
    assert_equal(0.05r, Shouhizei.rate_on(Date.new(2014, 3, 31)))
    assert_equal(0.08r, Shouhizei.rate_on(Date.new(2014, 4, 1)))
    assert_equal(0.08r, Shouhizei.rate_on())
  end

  def test_price_calculation
    assert_equal(108, Shouhizei.included(price: 100, date: Date.new(2014, 4, 1)))

    Timecop.freeze(Date.new(2014, 4, 1)) do
      Shouhizei.config[:rounding] = Shouhizei::RoundUp
      round_up_price = Shouhizei.included(price: 10)
      assert_equal(11, round_up_price)
      assert_instance_of(Integer, round_up_price)

      Shouhizei.config[:rounding] = Shouhizei::RoundDown
      round_down_price = Shouhizei.included(price: 10)
      assert_equal(10, round_down_price)
      assert_instance_of(Integer, round_down_price)
    end
  end
end
