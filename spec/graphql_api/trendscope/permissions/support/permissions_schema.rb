require './spec/graphql_api/trendscope/support/graphql_helpers'
require './spec/graphql_api/trendscope/definitions/assoc_metric_definitions'

module PermissionsSchema

  def self.pipelines_schema (definition)
    {
      type: 'object',
      required: ['data'],
      properties: {
        data: {
          type: 'object',
          required: ['pipelines'],
          properties: {
            pipelines: {
              type: 'object',
              required: ['nodes'],
              properties: {
                nodes: {
                  type: 'array',
                  items: {
                    type: 'object',
                    required: GraphqlHelpers.filtered_definitions(definition, :property_name),
                    properties:
                      GraphqlHelpers.filtered_definitions(definition, :schema).reduce(&:merge)
                  }
                }
              }
            }
          }
        }
      }
    }
  end

  def self.invalid_pipeline_schema
    {
      type: 'object',
      required: ['data'],
      properties: {
        data: {
          type: 'object',
          required: ['pipeline'],
          properties: {
            pipeline: {
              type: 'null'
            }
          }
        }
      }
    }
  end

  def self.invalid_report_schema
    {
      type: 'object',
      required: ['data'],
      properties: {
        data: {
          type: 'object',
          required: ['reports'],
          properties: {
            reports: {
              type: 'object',
              required: ['tpvReport'],
              properties: {
                tpvReport: {
                  type: 'null'
                }
              }
            }
          }
        }
      }
    }
  end


  def self.pipeline_schema (definition)
    {
      type: 'object',
      required: ['data'],
      properties: {
        data: {
          type: 'object',
          required: ['pipeline'],
          properties: {
            pipeline: {
              type: 'object',
              required: GraphqlHelpers.filtered_definitions(definition, :property_name),
              properties:
                GraphqlHelpers.filtered_definitions(definition, :schema).reduce(&:merge)
            }
          }
        }
      }
    }
  end

  def self.reports_tpv_reports_schema (definition)
    {
      type: 'object',
      required: ['data'],
      properties: {
        data: {
          type: 'object',
          required: ['reports'],
          properties: {
            reports: {
              type: 'object',
              required: ['tpvReports'],
              properties: {
                tpvReports: {
                  type: 'object',
                  required: ['nodes'],
                  properties: {
                    nodes: {
                      type: 'array',
                      items: {
                        type: 'object',
                        required: GraphqlHelpers.filtered_definitions(definition, :property_name),
                        properties:
                          GraphqlHelpers.filtered_definitions(definition, :schema).reduce(&:merge)
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }

  end

  def self.reports_tpv_report_schema (definition)
    {
      type: 'object',
      required: ['data'],
      properties: {
        data: {
          type: 'object',
          required: ['reports'],
          properties: {
            reports: {
              type: 'object',
              required: ['tpvReport'],
              properties: {
                tpvReport: {
                  type: 'object',
                  required: GraphqlHelpers.filtered_definitions(definition, :property_name),
                  properties:
                    GraphqlHelpers.filtered_definitions(definition, :schema).reduce(&:merge)
                }
              }
            }
          }
        }
      }
    }
  end


end
