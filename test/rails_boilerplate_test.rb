require 'test_helper'

class RailsBoilerplateTest < ActiveSupport::TestCase
  def setup
    @app = Dummy::Application
  end
  test 'modernizr is an asset' do
    assert_not_nil @app.assets["modernizr"]
  end
  test 'reset is an asset' do
    assert_not_nil @app.assets["reset"]
  end
  test 'plugins is an js asset' do
    assert_not_nil @app.assets["plugins"]
  end
end
