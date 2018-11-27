require 'test_helper'
require 'timecop'

class ShouhizeiTest < Minitest::Test
  def test_rate_on
    Time.zone = 'Asia/Tokyo'
    assert_equal(0.0r,  Shouhizei.rate_on(Time.zone.local(1989, 3, 31)))
    assert_equal(0.03r, Shouhizei.rate_on(Time.zone.local(1989, 4, 1)))
    assert_equal(0.03r, Shouhizei.rate_on(Time.zone.local(1997, 3, 31)))
    assert_equal(0.05r, Shouhizei.rate_on(Time.zone.local(1997, 4, 1)))
    assert_equal(0.05r, Shouhizei.rate_on(Time.zone.local(2014, 3, 31)))
    assert_equal(0.08r, Shouhizei.rate_on(Time.zone.local(2014, 4, 1)))
    assert_equal(0.08r, Shouhizei.rate_on(Time.zone.local(2019, 9, 30)))
    assert_equal(0.08r, Shouhizei.rate_on(Time.zone.local(2019, 9, 30), reduced: true))
    assert_equal(0.1r, Shouhizei.rate_on(Time.zone.local(2019, 10, 01)))
    assert_equal(0.1r, Shouhizei.rate_on(Time.zone.local(2019, 12, 01)))
    assert_equal(0.08r, Shouhizei.rate_on(Time.zone.local(2019, 12, 01), reduced: true))

    Time.zone = 'Hawaii'
    assert_equal(0.03r, Shouhizei.rate_on(Time.zone.local(1989, 3, 31, 10, 0, 0)))
  end

  def test_price_calculation
    Time.zone = 'Asia/Tokyo'
    assert_equal(108, Shouhizei.including(price: 100, time: Time.zone.local(2014, 4, 1)))

    Timecop.freeze(Time.zone.local(2014, 4, 1)) do
      Shouhizei.config[:rounding] = Shouhizei::RoundUp
      round_up_price = Shouhizei.including(price: 10)
      assert_equal(11, round_up_price)
      assert_kind_of(Integer, round_up_price)

      Shouhizei.config[:rounding] = Shouhizei::RoundDown
      round_down_price = Shouhizei.including(price: 10)
      assert_equal(10, round_down_price)
      assert_kind_of(Integer, round_down_price)

      Shouhizei.config[:rounding] = Shouhizei::Round
      round_price = Shouhizei.including(price: 10)
      assert_equal(11, round_price)
      assert_kind_of(Integer, round_price)

      round_price = Shouhizei.including(price: 15)
      assert_equal(16, round_price)
      assert_kind_of(Integer, round_price)
    end
  end
end
