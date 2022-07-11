require('busted.runner')()

describe('sample test', function()
  it('adds 5 + 2 to equals 7', function()
    assert.are.equals(5 + 2, 7)
  end)
end)
