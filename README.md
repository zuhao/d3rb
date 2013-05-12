d3rb
====
This is an early attempt to implement a Ruby wrapper for [d3.js](http://d3js.org/).

Nothing has been done yet, as you can see from above.

So currently this is more like a proof-of-concept kind of thing.

Usage
-----
```ruby
d = D3.new do
  select("body").style("background-color", "gray")
  data [4, 8, 15, 16, 23, 42]
  enter
  append "p"
  text "function(d) { return 'number ' + d + '!'; }"
end
```

Then run `d.build_js`, and the following javascript code will be generated.

```javascript
<script src='http://d3js.org/d3.v3.min.js'></script>
<script type='text/javascript'>
d3.select('body').style('background-color','gray').data([4, 8, 15, 16, 23, 42]).enter().append('p').text(function(d) { return 'number ' + d + '!'; })
</script>
```

The code can be embedded into a html document and viewed in the browser.