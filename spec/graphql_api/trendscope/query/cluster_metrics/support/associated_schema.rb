require './spec/graphql_api/trendscope/support/graphql_helpers'
require './spec/graphql_api/trendscope/definitions/assoc_metric_definitions'

module AssociatedSchema

  def self.pipeline_runs_associated (definition)
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
              required: ['runs'],
              properties: {
                runs: {
                  oneOf: [
                    {
                      type: 'object',
                      required: ['nodes'],
                      properties: {
                        nodes: {
                          type: 'array',
                          items: {
                            type: 'object',
                            required: %w'association',
                            properties: {
                              association: {
                                oneOf: [
                                  {
                                    type: 'object',
                                    required: %w'associated',
                                    properties:
                                      GraphqlHelpers.filtered_definitions(definition, :schema).reduce(&:merge)
                                  },
                                  {
                                    type: 'null'
                                  }
                                ]
                              }
                            }
                          }
                        }
                      }
                    },
                    {
                      type: 'null'
                    }
                  ]
                }
              }
            }
          }
        }
      }
    }
  end

  def self.pipeline_runs_associated_schema_full
    pipeline_runs_associated(AssocMetricDefinitions.associated)
  end

  def self.pipelines_runs_associated (definition)
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
                    required: ['runs'],
                    properties: {
                      runs: {
                        oneOf: [
                          {
                            type: 'object',
                            required: ['nodes'],
                            properties: {
                              nodes: {
                                type: 'array',
                                items: {
                                  type: 'object',
                                  required: %w'association',
                                  properties: {
                                    association: {
                                      oneOf: [
                                        {
                                          type: 'object',
                                          required: %w'associated',
                                          properties:
                                            GraphqlHelpers.filtered_definitions(definition, :schema).reduce(&:merge)
                                        },
                                        {
                                          type: 'null'
                                        }
                                      ]
                                    }
                                  }
                                }
                              }
                            }
                          },
                          {
                            type: 'null'
                          }
                        ]
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

  def self.pipelines_runs_associated_schema_full
    pipelines_runs_associated(AssocMetricDefinitions.associated)
  end
end
