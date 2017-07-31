require "test_helper"

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
end
