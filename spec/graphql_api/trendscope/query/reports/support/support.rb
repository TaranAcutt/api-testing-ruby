require './spec/graphql_api/trendscope/support/graphql_helpers'
require './spec/graphql_api/trendscope/definitions/tpv_report_definitions'

module ReportsSupport
  
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

  def self.reports_tpv_reports_schema_full
    reports_tpv_reports_schema(TpvReportDefinitions.tpv_report)
  end

  def self.reports_tpv_reports_schema_rand
    reports_tpv_reports_schema(TpvReportDefinitions.rand_tpv_report)
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
  end

  def self.reports_tpv_report_schema_full
    reports_tpv_report_schema(TpvReportDefinitions.tpv_report)
  end

  def self.reports_tpv_report_schema_rand
    reports_tpv_report_schema(TpvReportDefinitions.rand_tpv_report)
  end
  
  def self.pipelines_tpv_reports_schema (definition)
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
                    required: ['reports'],
                    properties: {
                      reports: {
                        type: 'object',
                        required: %w'tpvReports',
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
            }
          }
        }
      }
    }
  end

  def self.pipelines_tpv_reports_schema_full
    pipelines_tpv_reports_schema(TpvReportDefinitions.tpv_report)
  end

  def self.pipelines_tpv_reports_schema_rand
    pipelines_tpv_reports_schema(TpvReportDefinitions.rand_tpv_report)
  end
  
  def self.pipeline_tpv_reports_schema (definition)
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
              required: ['reports'],
              properties: {
                reports: {
                  type: 'object',
                  required: %w'tpvReports',
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
      }
    }
  end

  def self.pipeline_tpv_reports_schema_full
    pipeline_tpv_reports_schema(TpvReportDefinitions.tpv_report)
  end

  def self.pipeline_tpv_reports_schema_rand
    pipeline_tpv_reports_schema(TpvReportDefinitions.rand_tpv_report)
  end
end
