require_relative 'base'

# D3.js API references at https://github.com/mbostock/d3/wiki/Selections
module Selection

  include Base

  # A selection is an array of elements pulled from the current document.

  def select(*args, &block)
    add_action('select', *args, &block)
  end

  def selectAll(*args, &block)
    add_action('selectAll', *args, &block)
  end

  # After selecting elements, apply operators to them to do stuff.

  def attr(*args, &block)
    add_action('attr', *args, &block)
  end

  def classed(*args, &block)
    add_action('classed', *args, &block)
  end

  def style(*args, &block)
    add_action('style', *args, &block)
  end

  def property(*args, &block)
    add_action('property', *args, &block)
  end

  def text(*args, &block)
    add_action('text', *args, &block)
  end

  def html(*args, &block)
    add_action('html', *args, &block)
  end

  def append(*args, &block)
    add_action('append', *args, &block)
  end

  def insert(*args, &block)
    add_action('insert', *args, &block)
  end

  def remove(*args, &block)
    add_action('remove', *args, &block)
  end

  def data(*args, &block)
    add_action('data', *args, &block)
  end

  def enter(*args, &block)
    add_action('enter', *args, &block)
  end

  def exit(*args, &block)
    add_action('exit', *args, &block)
  end

  def filter(*args, &block)
    add_action('filter', *args, &block)
  end

  def datum(*args, &block)
    add_action('datum', *args, &block)
  end

  def sort(*args, &block)
    add_action('sort', *args, &block)
  end

  def order(*args, &block)
    add_action('order', *args, &block)
  end

end
