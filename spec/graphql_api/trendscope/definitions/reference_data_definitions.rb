require './spec/graphql_api/trendscope/support/graphql_helpers'

module ReferenceDataDefinitions
  class << self
    attr_accessor :tpv_phases, :rand_tpv_phases, :permission_levels, :rand_permission_level
  end

  @permission_levels = [
    {
      query: 'level',
      property_name: 'level',
      schema: {
        level: {
          type: 'integer',
          enum: [0, 1, 2]
        }
      }
    },
    {
      query: 'label',
      property_name: 'label',
      schema: {
        label: {
          '$ref': "#{SchemaHelpers.schemas}/trendscope/!string.json"
        }
      }
    },
    {
      query: 'permission',
      property_name: 'permission',
      schema: {
        permission: {
          type: 'string',
          enum: %w'READ WRITE ADMIN'
        }
      }
    }
  ]

  @rand_permission_level = GraphqlHelpers.property_definition(ReferenceDataDefinitions.permission_levels)
  
  @tpv_phases = [
    {
      query: 'id',
      property_name: 'id',
      schema: {
        id: {
          '$ref': "#{SchemaHelpers.schemas}/trendscope/!string.json"
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
    }, {
      query: 'description',
      property_name: 'description',
      schema: {
        description: {
          '$ref': "#{SchemaHelpers.schemas}/trendscope/!string.json"
        }
      }
    }
  ]

  @rand_tpv_phases = GraphqlHelpers.property_definition(ReferenceDataDefinitions.tpv_phases)

end
