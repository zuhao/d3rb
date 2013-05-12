require_relative 'selections'

class D3

  include Selection

  attr_accessor :actions

  def initialize(&block)
    @actions = []
    self.instance_eval(&block) if block_given?
  end

  def build_js
    js = "<script src='http://d3js.org/d3.v3.min.js'></script>\n"
    js += "<script type='text/javascript'>\n"
    js += "d3"
    actions.each do |a|
      args = a[:args].map {|x| x.is_a?(Array) ? "#{x}" : "'#{x}'"}
      js << ".#{a[:name]}(#{args.join(',')})"
    end
    js << "\n</script>"
    puts js
  end

end