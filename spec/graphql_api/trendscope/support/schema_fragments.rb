module SchemaFragments
  class << self
    
    def non_nullable_string
      {
        type: 'string'
      }
    end
    
    def nullable_string
      {
        oneOf:
          [
            {
              type: 'null'
            },
            {
              'type': 'string'
            }
          ]
      }
    end
    
    def non_nullable_id
      {
        type: 'string'
      }
    end
    
    def nullable_id
      {
        oneOf:
          [
            {
              type: 'null'
            },
            {
              'type': 'string'
            }
          ]
      }
    end
    
    def non_nullable_integer
      {
        type: 'number'
      }
    end
    
    def nullable_integer
      {
        oneOf:
          [
            {
              type: 'null'
            },
            {
              'type': 'number'
            }
          ]
      }
    end
    
    def non_nullable_float
      {
        type: 'float'
      }
    end
    
    def nullable_float
      {
        oneOf:
          [
            {
              type: 'null'
            },
            {
              'type': 'float'
            }
          ]
      }
    end
    
    def non_nullable_boolean
      {
        type: 'boolean'
      }
    end
    
    def nullable_boolean
      {
        oneOf:
          [
            {
              type: 'null'
            },
            {
              'type': 'boolean'
            }
          ]
      }
    end
  end
end