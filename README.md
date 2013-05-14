d3rb
====
This is an early attempt to implement a Ruby wrapper for [d3.js](http://d3js.org/).

Nothing has been done yet, as you can see from above.

So currently this is more like a proof-of-concept kind of thing.

Usage
-----

Here we are trying to draw 10 circles with random radius and positions on canvas.


```ruby
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
```

Then run `d.build_final_js`, and the following javascript code will be generated.

```javascript
<script src='http://d3js.org/d3.v3.min.js'></script>
<script type='text/javascript'>
d3.select('body').append('svg').attr('width',800).attr('height',400).selectAll('circle')
.data(d3.range(10)).enter().append('circle')
.attr('cx',function() {return Math.random() * 800;})
.attr('cy',function() {return Math.random() * 400;})
.attr('r',function() {return 50 + Math.random() * 50;})
.style('fill-opacity',0.1).style('stroke','#000')
</script>
```

The code can be embedded into a html document and viewed in the browser.

You will see something like this in the browser.
![10 random circles](/examples/images/10-random-circles.png)