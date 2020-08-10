module MiscellaneousSupport
  module_function

  def fragment_schema
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
                  required: %w'id slug name scalingFactor pipeline',
                  properties: {
                    id: {
                      '$ref': "#{SchemaHelpers.schemas}/trendscope/!id.json"
                    },
                    slug: {
                      '$ref': "#{SchemaHelpers.schemas}/trendscope/!string.json"
                    },
                    name: {
                      '$ref': "#{SchemaHelpers.schemas}/trendscope/!string.json"
                    },
                    scalingFactor: {
                      '$ref': "#{SchemaHelpers.schemas}/trendscope/!float.json"
                    },
                    pipeline: {
                      oneOf: [
                        { type: 'object',
                          required: %w'id name run',
                          properties: {
                            id: {
                              '$ref': "#{SchemaHelpers.schemas}/trendscope/!string.json"
                            },
                            name: {
                              '$ref': "#{SchemaHelpers.schemas}/trendscope/!string.json"
                            },
                            run: {
                              oneOf: [
                                {
                                  type: 'object',
                                  required: %w'id startDate endDate',
                                  properties: {
                                    id: {
                                      '$ref': "#{SchemaHelpers.schemas}/trendscope/!string.json"
                                    },
                                    startDate: {
                                      '$ref': "#{SchemaHelpers.schemas}/support/date_regexp.json"
                                    },
                                    endDate: {
                                      '$ref': "#{SchemaHelpers.schemas}/support/date_regexp.json"
                                    }
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
  end
end
