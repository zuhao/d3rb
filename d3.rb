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
      args = a[:args].map { |x|
        # TODO: need to deal with embedded javascript functions more properly.
        if x.is_a?(Array) || x.start_with?('function')
          "#{x}"
        else
          "'#{x}'"
        end
      }
      js << ".#{a[:name]}(#{args.join(',')})"
    end
    js << "\n</script>"
    puts js
  end

end