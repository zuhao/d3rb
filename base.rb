module Base

  def add_action(name, *args, &block)
    @actions << {:name => name, :args => args}
    self.instance_eval(&block) if block_given?
    self
  end

end