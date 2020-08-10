require './spec/graphql_api/trendscope/support/graphql_helpers'

module ReferenceDataSupport
  module_function
  
  def tpv_phases_schema (definition)
    {
      'type': 'object',
      'required': ['data'],
      'properties': {
        'data': {
          'type': 'object',
          'required': ['referenceData'],
          'properties': {
            'referenceData': {
              'type': 'object',
              'required': ['tpvPhases'],
              'properties': {
                'tpvPhases': {
                  'type': 'array',
                  'items': {
                    'type': 'object',
                    'required': GraphqlHelpers.filtered_definitions(definition, :property_name),
                    'properties':
                      GraphqlHelpers.filtered_definitions(definition ,:schema).reduce(&:merge)
                  }
                }
              }
            }
          }
        }
      }
    }
  end

  def tpv_phases_schema_full
    tpv_phases_schema(ReferenceDataDefinitions.tpv_phases)
  end

  def tpv_phases_schema_rand
    tpv_phases_schema(ReferenceDataDefinitions.rand_tpv_phases)
  end

  def permission_level_schema (definition)
    {
      'type': 'object',
      'required': ['data'],
      'properties': {
        'data': {
          'type': 'object',
          'required': ['referenceData'],
          'properties': {
            'referenceData': {
              'type': 'object',
              'required': ['permissionLevels'],
              'properties': {
                'permissionLevels': {
                  'type': 'array',
                  'items': {
                    'type': 'object',
                    'required': GraphqlHelpers.filtered_definitions(definition, :property_name),
                    'properties':
                      GraphqlHelpers.filtered_definitions(definition ,:schema).reduce(&:merge)
                  }
                }
              }
            }
          }
        }
      }
    }
  end

  def permission_level_schema_full
    permission_level_schema(ReferenceDataDefinitions.permission_levels)
  end

  def permission_level_schema_rand
    permission_level_schema(ReferenceDataDefinitions.rand_permission_level)
  end
end
