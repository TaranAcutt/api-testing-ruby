require './spec/graphql_api/trendscope/support/graphql_helpers'
require './spec/graphql_api/trendscope/definitions/assoc_metric_definitions'

module AssociationCountsSchema
  
  def self.pipelines_runs_association_counts (definition)
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
                                  type: 'object',
                                  required: %w'associationCounts',
                                  properties: {
                                    associationCounts: {
                                      properties: {
                                        nodes: {
                                          type: 'array',
                                          items: {
                                            oneOf: [
                                              {
                                                type: 'object',
                                                required: GraphqlHelpers.filtered_definitions(definition, :property_name),
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
            }
          }
        }
      }
    }
  end
  
  def self.pipelines_runs_association_counts_full
    pipelines_runs_association_counts(AssocMetricDefinitions.association_count)
  end
  
  def self.pipelines_runs_association_counts_rand
    pipelines_runs_association_counts(AssocMetricDefinitions.rand_association_count)
  end
end
