module CommitQueries
  class << self
    attr_accessor :commit_query, :invalid_sub_field, :invalid_field
  end

  @commit_query =
    {
      query: '{
        commit
      }'
    }.to_json

  @invalid_field =
    {
      query: '{
        invalid
      }'
    }.to_json
  
  @invalid_sub_field =
    {
      query: '{
         commit {
          id
        }
      }'
    }.to_json
end
