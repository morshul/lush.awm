require('busted.runner')()

describe('sample test', function()
  it('adds 1 + 2 to equals 3', function()
    assert.are.equals(1 + 2, 3)
  end)
end)
