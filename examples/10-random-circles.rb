require_relative '../d3.rb'

width, height = 800, 400
range = D3.new.range(10)
svg = D3.new.select('body').append('svg').attr('width', width).attr('height', height)
d = svg.selectAll('circle') do
  data(range).enter
  append 'circle' do
    attr 'cx', "function() {return Math.random() * #{width};}"
    attr 'cy', "function() {return Math.random() * #{height};}"
    attr 'r', "function() {return 50 + Math.random() * 50;}"
    style 'fill-opacity', 0.1
    style 'stroke', '#000'
  end
end

puts d.build_final_js