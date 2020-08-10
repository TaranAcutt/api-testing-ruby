require './lib/helper/request_helpers'
require './spec/graphql_api/trendscope/support/graphql_data_service'
require './spec/graphql_api/trendscope/support/graphql_auth_tokens'
require './spec/graphql_api/trendscope/support/support_payloads'

module GraphqlDataService
  extend RequestHelpers
  class << self

    def graphql_schema
      @_graphql_schema ||=
        begin
          @schema, = RequestHelpers.post(Config.graphql,
                                         'graphql',
                                         SupportPayloads.graphql_schema,
                                         authorization: GraphqlAuthTokens.trendscope_user)
        end
      @schema['data']['__schema']
    end

    def permission_pipelines
      @_permission_pipelines ||=
        begin
          @perm1, = RequestHelpers.post(Config.graphql,
                                        'graphql',
                                        SupportPayloads.permission_pipelines,
                                        authorization: GraphqlAuthTokens.qafixtures_user1)

          @perm2, = RequestHelpers.post(Config.graphql,
                                        'graphql',
                                        SupportPayloads.permission_pipelines,
                                        authorization: GraphqlAuthTokens.qafixtures_user2)
        end
      {
        user1: @perm1['data']['pipelines']['nodes'],
        user2: @perm2['data']['pipelines']['nodes']
      }
    end

    def permission_reports
      @_permission_reports ||=
        begin
          @rep1, = RequestHelpers.post(Config.graphql,
                                       'graphql',
                                       SupportPayloads.permission_reports,
                                       authorization: GraphqlAuthTokens.qafixtures_user1)

          @rep2, = RequestHelpers.post(Config.graphql,
                                       'graphql',
                                       SupportPayloads.permission_reports,
                                       authorization: GraphqlAuthTokens.qafixtures_user2)
        end
      {
        user1: @rep1['data']['reports']['tpvReports']['nodes'],
        user2: @rep2['data']['reports']['tpvReports']['nodes']
      }
    end

    def report_id
      @_report_id ||=
        begin
          @response, = RequestHelpers.post(Config.graphql,
                                           'graphql',
                                           SupportPayloads.report_id,
                                           Authorization: GraphqlAuthTokens.trendscope_user)
        end
      thing = @response['data']['pipelines']['nodes'].delete_if { |hash| hash['name'].include? 'QAFIXTURES' }
      stuff = JsonPath.on(thing, '$..["reports"]["tpvReports"]["nodes"]')
      stuff.delete_if(&:empty?)[0][0]['id']
    end

    def report_id_selector (number)
      @_report_id_selector ||=
        begin
          @selector, = RequestHelpers.post(Config.graphql,
                                           'graphql',
                                           SupportPayloads.reports_selector,
                                           Authorization: GraphqlAuthTokens.trendscope_user)
        end
      JsonPath.on(@selector, '$..["reports"]["tpvReports"]["nodes"]')[0][number]['id']
    end

    def reports_pipelines
      @_reports_pipelines ||=
        begin
          @report_pipe, = RequestHelpers.post(Config.graphql,
                                              'graphql',
                                              SupportPayloads.reports_pipelines,
                                              Authorization: GraphqlAuthTokens.trendscope_user)
        end
      filtered_rp = JsonPath.on(@report_pipe, '$..["tpvReports"]["nodes"]')
      first = filtered_rp[0].delete_if { |x| x['pipeline'] == nil }

      first.delete_if { |x| x['pipeline']['status'] != 'COMPLETE' }
    end

    def cluster_name
      @_cluster_name ||=
        begin
          @cluster_name, = RequestHelpers.post( Config.graphql,
                                                'graphql',
                                                SupportPayloads.cluster_name,
                                                Authorization: GraphqlAuthTokens.trendscope_user)
        end
      JsonPath.on(@cluster_name, '$..["cluster"]')[0]
    end

    def stream_group_internal_key
      @_stream_group_internal_key ||=
        begin
          @stream_group_internal_key, = RequestHelpers.post(Config.graphql,
                                                            'graphql',
                                                            SupportPayloads.stream_groups_internal_key,
                                                            Authorization: GraphqlAuthTokens.trendscope_user)
        end
      @stream_group_internal_key['data']['streamGroups']['nodes'][0]['internalKey']
    end

    def internal_key
      @_internal_key ||=
        begin
          @internal_key, = RequestHelpers.post(Config.graphql,
                                               'graphql',
                                               SupportPayloads.internal_key,
                                               Authorization: GraphqlAuthTokens.trendscope_user)
        end
      @internal_key['data']['streams']['nodes'][0]['internalKey']
    end


    def top_associations (pipeline_id, report_id)
      @_top_assoc ||=
        begin
          @associated, = RequestHelpers.post(Config.graphql,
                                             'graphql',
                                             SupportPayloads.top_associations(pipeline_id, report_id),
                                             Authorization: GraphqlAuthTokens.trendscope_user)
        end
      @filtered_ta = JsonPath.on(@associated, '$..["tpv"]["metrics"]["nodes"]')[0]
    end

    def filtered_metric_associations
      top_associations(reports_pipelines[0]['pipeline']['id'], reports_pipelines[0]['id'])[0]
    end

    def metric_args
      @_metric_args ||=
        begin
          @metrics, = RequestHelpers.post(Config.graphql,
                                          'graphql',
                                          SupportPayloads.metric_args,
                                          Authorization: GraphqlAuthTokens.trendscope_user)
        end
      remove_fixtures = @metrics['data']['pipelines']['nodes'].delete_if { |hash| hash['name'].include? 'QAFIXTURES' }
      filtered_metrics = JsonPath.on(remove_fixtures, '$..["metrics"]["nodes"]')
      filtered_metrics.delete_if(&:empty?)[0][0]
    end
    
    def metrics_args_by_node
      @_metrics_args_by_node ||=
        begin
          @metrics_args_by_node, = RequestHelpers.post(Config.graphql,
            'graphql',
            SupportPayloads.metric_args,
            Authorization: GraphqlAuthTokens.trendscope_user)
        end
      remove_fixtures = @metrics_args_by_node['data']['pipelines']['nodes'].delete_if { |hash| hash['name'].include? 'QAFIXTURES' }
      filtered_metrics = JsonPath.on(remove_fixtures, '$..["metrics"]["nodes"]')
      filtered_metrics.delete_if(&:empty?)[0]
    end
    
    def metric_args_by_nodes(fields, node)
      metrics_args_by_node[node][fields]
    end

    def tpv_rank
      @_tpv_rank ||=
        begin
          @tpv_ranks, = RequestHelpers.post(Config.graphql,
                                            'graphql',
                                            SupportPayloads.tpv_rank,
                                            Authorization: GraphqlAuthTokens.trendscope_user)
        end
      JsonPath.on(@tpv_ranks, '$..["tpvRank"]').sort
    end

    def association_category
      @_association_category ||=
        begin
          @assoc_cat, = RequestHelpers.post(Config.graphql,
                                            'graphql',
                                            SupportPayloads.association_category,
                                            Authorization: GraphqlAuthTokens.trendscope_user)
        end
      JsonPath.on(@assoc_cat, '$..["category"]').sort
    end

    def step_type
      @_step_type ||=
        begin
          @type, = RequestHelpers.post(Config.graphql,
                                       'graphql',
                                       SupportPayloads.step_type,
                                       Authorization: GraphqlAuthTokens.trendscope_user)
        end
      JsonPath.on(@type, '$...["steps"][*]["type"]').uniq
    end

    def pipeline_id
      @_pipeline_id ||=
        begin
          @pipeline, = RequestHelpers.post(Config.graphql,
                                           'graphql',
                                           SupportPayloads.pipeline_id,
                                           Authorization: GraphqlAuthTokens.trendscope_user)
        end
      filtered = @pipeline['data']['pipelines']['nodes'].delete_if { |hash| hash['name'].include? 'QAFIXTURES' }

      mega_filtered = filtered.delete_if { |x| x['lastRun'].eql? nil }
      mega_filtered[0]['id']
    end

    def pipeline_id_selector(number)
      @_pipeline_id2 ||=
        begin
          @pipeline2, = RequestHelpers.post(Config.graphql,
                                           'graphql',
                                           SupportPayloads.pipeline_id,
                                           Authorization: GraphqlAuthTokens.trendscope_user)
        end
      filtered = @pipeline['data']['pipelines']['nodes'].delete_if { |hash| hash['name'].include? 'QAFIXTURES' }

      mega_filtered2 = filtered.delete_if { |x| x['lastRun'].eql? nil }
      mega_filtered2[number]['id']
    end

    def step_id
      @_step_id ||=
        begin
          @step_id, = RequestHelpers.post(Config.graphql,
                                          'graphql',
                                          SupportPayloads.pipeline_with_step,
                                          Authorization: GraphqlAuthTokens.trendscope_user)
        end
      @_step = @step_id['data']['pipelines']['nodes'].delete_if { |hash| hash['steps'].empty? }
      @_step[0]['steps'][0]['id']
    end

    def pipeline_run_id
      @_pipeline_run_id ||=
        begin
          @pipeline_run = RequestHelpers.post(Config.graphql,
                                              'graphql',
                                              SupportPayloads.pipeline_run_id(pipeline_id),
                                              Authorization: GraphqlAuthTokens.trendscope_user)
        end
      JsonPath.on(@pipeline_run, '$..["runs"]["nodes"][*]["id"]').delete_if(&:empty?)[0]
    end

    def pipeline_with_step
      @_pipeline_with_step ||=
        begin
          @pipeline_with_step, = RequestHelpers.post(Config.graphql,
                                                     'graphql',
                                                     SupportPayloads.pipeline_with_step,
                                                     Authorization: GraphqlAuthTokens.trendscope_user)
        end
      @valid = @pipeline_with_step['data']['pipelines']['nodes'].delete_if { |hash| hash['steps'].empty? }
      @valid[0]['id']
    end

    def pipeline_tag
      @_pipeline_tag ||=
        begin
          @pipeline_tag, = RequestHelpers.post(Config.graphql,
            'graphql',
            PipelineTagsQueries.pipeline_tags_with_empty_search_query,
            Authorization: GraphqlAuthTokens.trendscope_user)
        end
      @pipeline_tag['data']['pipelineTags']['nodes'][0]
    end
  end
end