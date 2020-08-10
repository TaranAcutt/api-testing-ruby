module SchemaHelpers
  class << self
    attr_accessor :schemas
  end
  
  @schemas = "#{Dir.pwd}/lib/schemas"

end
