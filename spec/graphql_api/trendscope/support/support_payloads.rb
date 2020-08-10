module SupportPayloads
  class << self
    attr_accessor :graphql_schema, :report_id, :reports_pipelines, :metric_args, :association_category, :tpv_rank, :associations,
                  :pipeline_id,  :pipeline_with_step, :permission_pipelines, :permission_reports, :step_type, :internal_key, :stream_groups_internal_key, :reports_selector,
                  :cluster_name
  end

  @graphql_schema = { query: 'query IntrospectionQuery {
    __schema {
      queryType { name }
      mutationType { name }
      subscriptionType { name }
      types {
        ...FullType
      }
      directives {
        name
        description
        locations
        args {
          ...InputValue
        }
      }
    }
  }

  fragment FullType on __Type {
    kind
    name
    description
    fields(includeDeprecated: true) {
      name
      description
      args {
        ...InputValue
      }
      type {
        ...TypeRef
      }
      isDeprecated
      deprecationReason
    }
    inputFields {
      ...InputValue
    }
    interfaces {
      ...TypeRef
    }
    enumValues(includeDeprecated: true) {
      name
      description
      isDeprecated
      deprecationReason
    }
    possibleTypes {
      ...TypeRef
    }
  }

  fragment InputValue on __InputValue {
    name
    description
    type { ...TypeRef }
    defaultValue
  }

  fragment TypeRef on __Type {
    kind
    name
    ofType {
      kind
      name
      ofType {
        kind
        name
        ofType {
          kind
          name
          ofType {
            kind
            name
            ofType {
              kind
              name
              ofType {
                kind
                name
                ofType {
                  kind
                  name
                }
              }
            }
          }
        }
      }
    }
  }' }.to_json

  @associations = {
    query: '{
  pipelines(pageSize: 1000) {
    nodes {
      id
      steps {
        type
      }
    }
  }
}
'
  }.to_json


  @reports_selector = { query:
         '{
          reports {
            tpvReports {
            nodes {
              id
              }
            }
          }
        }' }.to_json

  @report_id = { query:
                   '{
  pipelines (pageSize: 100) {
    nodes {
      id
      name
      reports {
        tpvReports (pageSize: 100) {
          nodes {
            id
            name
          }
        }
      }
    }
  }
}' }.to_json

  @reports_pipelines = { query:
                           '{
                              reports {
                              tpvReports (pageSize: 100) {
                                 nodes {
                                   id
                                   name
                                   pipeline {
                                     id
                                     name
                                     status
                                     runs {
                                       nodes {
                                         id
                                         status
                                       }
                                     }
                                   }
                                 }
                               }
                             }
                           }' }.to_json

  @permission_reports = { query:
                            '{
                            reports {
                              tpvReports (pageSize: 100) {
                                nodes {
                                  id
                                  name
                                }
                              }
                            }
                          }' }.to_json

  def self.top_associations(pipeline_id, report_id)
    { query:
        '{
        pipeline (id: "' + pipeline_id + '"){
           runs {
              nodes {
                tpv {
                  metrics(market: "Global") {
                    nodes {
                      market
                      category
                      lens
                      subLens
                      topAssociations(reportId: "' + report_id + '") {
                        market
                        category
                        lens
                        subLens
                        association {
                          category
                          lens
                          subLens
                        }
                      }
                    }
                  }
                }
              }
            }
          }
      }' }.to_json
  end

  @internal_key = {
    #language=GraphQL
    query: '{
      streams {
        nodes {
          internalKey
        }
      }
    }'
  }.to_json

  @stream_groups_internal_key = {
    #language=GraphQL
    query: '{
      streamGroups {
        nodes {
          internalKey
        }
      }
    }'
  }.to_json

  @metric_args = { query:
                     '{
                    pipelines (filter: "status == COMPLETE", pageSize: 50){
                      nodes {
                        name
                        lastRun {
                          tpv {
                            metrics(market: "Global") {
                              nodes {
                                market
                                category
                                lens
                                subLens
                                trendMetrics {
                                  tpvRank
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }' }.to_json

  @tpv_rank = { query:
                  '{
                      pipelines (pageSize: 100) {
                        nodes {
                          lastRun {
                            tpv {
                              metrics(market: "Global") {
                                nodes {
                                  trendMetrics {
                                    tpvRank
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }' }.to_json

  @association_category = { query:
                              '{
                                 pipelines (pageSize: 100){
                                   nodes {
                                     lastRun {
                                       association {
                                         metrics(market: "Global", category: "Food Elements", lens: "Ingredients", subLens: "Cream") {
                                           nodes {
                                             association {
                                               category
                                             }
                                           }
                                         }
                                       }
                                     }
                                   }
                                 }
                               }' }.to_json

  @pipeline_id = { query:
                     '{
                       pipelines(pageSize:100) {
                         nodes {
                           id
                           name
                           lastRun {
                            id
                           }
                         }
                       }
                     }' }.to_json

  def self.pipeline_run_id (pipeline_id)
    { query:
        '{
          pipeline (id: "'+ pipeline_id +'") {
            runs {
              nodes {
                id
              }
            }
          }
        }' }.to_json
  end

  @pipeline_with_step = {
    query:
          '{
            pipelines (pageSize: 100) {
            nodes {
              id
            steps {
              id
            }
          }
        }
      }' }.to_json

  @step_type = { query:
                   '{
                  pipelines(pageSize: 100) {
                    nodes {
                      steps {
                        type
                      }
                    }
                  }
                }' }.to_json


  @permission_pipelines = {
    query: '{
      pipelines(pageSize: 100) {
        nodes {
          id
          name
        }
      }
    }'
  }.to_json
  
  @cluster_name  = {
     query:
      '{
          pipelines(pageSize: 50, filter: "status == COMPLETE") {
            nodes {
              id runs(pageSize: 50) {
                nodes {
                  tpv {
                    clusterOverview(market: "Global") {
                      cluster
                      tpvScore
                    }
                  }
                }
              }
            }
          }
        }'
      }.to_json
end
