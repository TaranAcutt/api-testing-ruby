require './spec/graphql_api/trendscope/support/graphql_helpers'

module Common
  class << self
    attr_accessor :float_time_series, :float_time_s, :int_time_series, :int_time_s, :named_time_series, :named_time_s, :taxonomy_node, :tax_node, :entity_permission, :lift_time_series,
                  :int_time_series_with_percent, :int_time_series_with_p, :named_time_series_with_percent, :py_pi_libraries, :rand_py_pi_libraries
  end

  @float_time_series = [
    {
      query: 'totalValue',
      property_name: 'totalValue',
      schema: {
        totalValue: {
          '$ref': "#{SchemaHelpers.schemas}/trendscope/!float.json"
        }
      }
    },
    {
      query: 'percentChange',
      property_name: 'percentChange',
      schema: {
        percentChange: {
          '$ref': "#{SchemaHelpers.schemas}/trendscope/float.json"
        }
      }
    },
    {
      query: 'dayOfWeek',
      property_name: 'dayOfWeek',
      schema: {
        dayOfWeek: {
          type: 'array',
          items: {
            '$ref': "#{SchemaHelpers.schemas}/trendscope/float.json"
          }
        }
      }
    },
    {
      query: 'timeOfDay',
      property_name: 'timeOfDay',
      schema: {
        timeOfDay: {
          type: 'array',
          items: {
            '$ref': "#{SchemaHelpers.schemas}/trendscope/float.json"
          }
        }
      }
    },
    {
      query: 'values',
      property_name: 'values',
      schema: {
        values: {
          type: 'array',
          items: {
            '$ref': "#{SchemaHelpers.schemas}/trendscope/float.json"
          }
        }
      }
    }
  ]

  @lift_time_series = [
    {
      query: 'totalValue',
      property_name: 'totalValue',
      schema: {
        totalValue: {
          '$ref': "#{SchemaHelpers.schemas}/trendscope/!float.json"
        }
      }
    },
    {
      query: 'percentChange',
      property_name: 'percentChange',
      schema: {
        percentChange: {
          '$ref': "#{SchemaHelpers.schemas}/trendscope/float.json"
        }
      }
    },
    {
      query: 'dayOfWeek',
      property_name: 'dayOfWeek',
      schema: {
        dayOfWeek: {
          oneOf: [
            {
              type: 'array',
              items: {
                '$ref': "#{SchemaHelpers.schemas}/trendscope/float.json"
              }
            },
            {
              type: 'null'
            }
          ]
        }
      }
    },
    {
      query: 'timeOfDay',
      property_name: 'timeOfDay',
      schema: {
        timeOfDay: {
          oneOf: [
            {
              type: 'array',
              items: {
                '$ref': "#{SchemaHelpers.schemas}/trendscope/float.json"
              }
            },
            {
              type: 'null'
            }
          ]
        }
      }
    },
    {
      query: 'values',
      property_name: 'values',
      schema: {
        values: {
          oneOf: [
            {
              type: 'array',
              items: {
                '$ref': "#{SchemaHelpers.schemas}/trendscope/float.json"
              }
            },
            {
              type: 'null'
            }
          ]
        }
      }
    },
    {
      query: 'supportA',
      property_name: 'supportA',
      schema: {
        supportA: {
          '$ref': "#{SchemaHelpers.schemas}/trendscope/float.json"
        }
      }
    },
    {
      query: 'supportB',
      property_name: 'supportB',
      schema: {
        supportB: {
          '$ref': "#{SchemaHelpers.schemas}/trendscope/float.json"
        }
      }
    },
    {
      query: 'supportAB',
      property_name: 'supportAB',
      schema: {
        supportAB: {
          '$ref': "#{SchemaHelpers.schemas}/trendscope/float.json"
        }
      }
    }
  ]

  @entity_permission = [
    {
      query: 'name',
      property_name: 'name',
      schema: {
        name: {
          '$ref': "#{SchemaHelpers.schemas}/trendscope/!string.json"
        }
      }
    },
    {
      query: 'permission',
      property_name: 'permission',
      schema: {
        permission: {
          '$ref': "#{SchemaHelpers.schemas}/trendscope/!permission.json"
        }
      }
    }
  ]

  @float_time_s = GraphqlHelpers.property_definition(@float_time_series)

  @int_time_series = [
    {
      query: 'totalValue',
      property_name: 'totalValue',
      schema: {
        totalValue: {
          '$ref': "#{SchemaHelpers.schemas}/trendscope/!integer.json"
        }
      }
    },
    {
      query: 'percentChange',
      property_name: 'percentChange',
      schema: {
        percentChange: {
          '$ref': "#{SchemaHelpers.schemas}/trendscope/float.json"
        }
      }
    },
    {
      query: 'dayOfWeek',
      property_name: 'dayOfWeek',
      schema: {
        dayOfWeek: {
          type: 'array',
          items: {
            '$ref': "#{SchemaHelpers.schemas}/trendscope/integer.json"
          }
        }
      }
    },
    {
      query: 'timeOfDay',
      property_name: 'timeOfDay',
      schema: {
        timeOfDay: {
          type: 'array',
          items: {
            '$ref': "#{SchemaHelpers.schemas}/trendscope/integer.json"
          }
        }
      }
    },
    {
      query: 'values',
      property_name: 'values',
      schema: {
        values: {
          type: 'array',
          items: {
            '$ref': "#{SchemaHelpers.schemas}/trendscope/integer.json"
          }
        }
      }
    }
  ]

  @int_time_s = GraphqlHelpers.property_definition(@int_time_series)

  @int_time_series_with_percent = [
    {
      query: 'totalValue',
      property_name: 'totalValue',
      schema: {
        totalValue: {
          '$ref': "#{SchemaHelpers.schemas}/trendscope/!integer.json"
        }
      }
    },
    {
      query: 'percentChange',
      property_name: 'percentChange',
      schema: {
        percentChange: {
          '$ref': "#{SchemaHelpers.schemas}/trendscope/float.json"
        }
      }
    },
    {
      query: 'dayOfWeek',
      property_name: 'dayOfWeek',
      schema: {
        dayOfWeek: {
          type: 'array',
          items: {
            '$ref': "#{SchemaHelpers.schemas}/trendscope/integer.json"
          }
        }
      }
    },
    {
      query: 'timeOfDay',
      property_name: 'timeOfDay',
      schema: {
        timeOfDay: {
          type: 'array',
          items: {
            '$ref': "#{SchemaHelpers.schemas}/trendscope/integer.json"
          }
        }
      }
    },
    {
      query: 'values',
      property_name: 'values',
      schema: {
        values: {
          type: 'array',
          items: {
            '$ref': "#{SchemaHelpers.schemas}/trendscope/integer.json"
          }
        }
      }
    },
    {
      query: 'percent',
      property_name: 'percent',
      schema: {
        percent: {
          '$ref': "#{SchemaHelpers.schemas}/trendscope/float.json"
        }
      }
    }
  ]

  @int_time_series_with_p = GraphqlHelpers.property_definition(@int_time_series_with_percent)

  @named_time_series = [
    {
      query: 'key',
      property_name: 'key',
      schema: {
        key: {
          '$ref': "#{SchemaHelpers.schemas}/trendscope/!string.json"
        }
      }
    },
    {
      query: 'value { ' + GraphqlHelpers.filtered_definitions(@int_time_s, :query).join(' ') + ' }',
      property_name: 'value',
      schema: {
        value: {
          type: 'object',
          required: GraphqlHelpers.filtered_definitions(@int_time_s, :property_name),
          properties:
            GraphqlHelpers.filtered_definitions(@int_time_s, :schema).reduce(&:merge)
        }
      }
    }
  ]

  @named_time_s = GraphqlHelpers.property_definition(@named_time_series)

  @named_time_series_with_percent = [
    {
      query: 'key',
      property_name: 'key',
      schema: {
        key: {
          '$ref': "#{SchemaHelpers.schemas}/trendscope/!string.json"
        }
      }
    },
    {
      query: 'value { ' + GraphqlHelpers.filtered_definitions(@int_time_series_with_percent, :query).join(' ') + ' }',
      property_name: 'value',
      schema: {
        value: {
          type: 'object',
          required: GraphqlHelpers.filtered_definitions(@int_time_series_with_percent, :property_name),
          properties:
            GraphqlHelpers.filtered_definitions(@int_time_series_with_percent, :schema).reduce(&:merge)
        }
      }
    }
  ]

  @taxonomy_node = [
    {
      query: 'id',
      property_name: 'id',
      schema: {
        id: {
          '$ref': "#{SchemaHelpers.schemas}/trendscope/!id.json"
        }
      }
    },
    {
      query: 'name',
      property_name: 'name',
      schema: {
        name: {
          '$ref': "#{SchemaHelpers.schemas}/trendscope/!string.json"
        }
      }
    }
  ]

  @tax_node = GraphqlHelpers.property_definition(@taxonomy_node)

  @py_pi_libraries = [
    {
      query: 'packageName',
      property_name: 'packageName',
      schema: {
        packageName: {
          '$ref': "#{SchemaHelpers.schemas}/trendscope/!string.json"
        }
      }
    },
    {
      query: 'repo',
      property_name: 'repo',
      schema: {
        repo: {
          '$ref': "#{SchemaHelpers.schemas}/trendscope/string.json"
        }
      }
    }
  ]

  @rand_py_pi_libraries = GraphqlHelpers.property_definition(@py_pi_libraries)


end
