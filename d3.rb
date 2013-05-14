require_relative 'selections'
require_relative 'arrays'

class D3

  include Selection
  include Arrays

  attr_accessor :actions

  def initialize(&block)
    @actions = []
    self.instance_eval(&block) if block_given?
  end

  def build_partial_js
    js = "d3"
    actions.each do |a|
      args = a[:args].map { |x|
        # TODO: need to deal with embedded javascript functions more properly.
        if x.respond_to?(:build_partial_js)
          "#{x.build_partial_js}"
        elsif x.is_a?(Array) || x.is_a?(Numeric)
          "#{x}"
        elsif x.is_a?(String) && x.start_with?('function')
          "#{x}"
        else
          "'#{x}'"
        end
      }
      js << ".#{a[:name]}(#{args.join(',')})"
    end
    js
  end

  def build_final_js
    js = "<script src='http://d3js.org/d3.v3.min.js'></script>\n"
    js += "<script type='text/javascript'>\n"
    js += self.build_partial_js
    js += "\n</script>"
  end


end