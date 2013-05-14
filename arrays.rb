require_relative 'base'

# D3.js API references at https://github.com/mbostock/d3/wiki/Arrays
module Arrays

  include Base

  def range(*args, &block)
    add_action('range', *args, &block)
  end

end
