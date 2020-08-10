require 'colorize'
require 'colorized_string'

class CustomMatchers

  RSpec::Matchers.define :include_iso_date do
    match do |actual|
      [actual].find { |str| str =~ /^([\+-]?\d{4}(?!\d{2}\b))((-?)((0[1-9]|1[0-2])(\3([12]\d|0[1-9]|3[01]))?|W([0-4]\d|5[0-2])(-?[1-7])?|(00[1-9]|0[1-9]\d|[12]\d{2}|3([0-5]\d|6[1-6])))([T\s]((([01]\d|2[0-3])((:?)[0-5]\d)?|24:?00)([\.,]\d+(?!:))?)?(\17[0-5]\d([\.,]\d+)?)?([zZ]|([\+-])([01]\d|2[0-3]):?([0-5]\d)?)?)?)?$/ }
    end
  end

  RSpec::Matchers.define :include_iso_date do
    match do |actual|
      [actual].find { |str| str =~ /^([\+-]?\d{4}(?!\d{2}\b))((-?)((0[1-9]|1[0-2])(\3([12]\d|0[1-9]|3[01]))?|W([0-4]\d|5[0-2])(-?[1-7])?|(00[1-9]|0[1-9]\d|[12]\d{2}|3([0-5]\d|6[1-6])))([T\s]((([01]\d|2[0-3])((:?)[0-5]\d)?|24:?00)([\.,]\d+(?!:))?)?(\17[0-5]\d([\.,]\d+)?)?([zZ]|([\+-])([01]\d|2[0-3]):?([0-5]\d)?)?)?)?$/ }
    end
  end

  RSpec::Matchers.define :include_id do
    match do |actual|
      [actual].find { |str| str =~ /^[a-zA-Z0-9]{10}$/ }
    end
  end

  RSpec::Matchers.define :stuff do
    match do |actual, operator|
      [actual].find { |str| str }
    end
  end

  RSpec::Matchers.define :include_colour_code do
    match do |actual|
      [actual].find { |str| str =~ /^#([A-Fa-f0-9]{6}|[A-Fa-f0-9]{3})$/ }
    end
  end

  RSpec::Matchers.define :include_regex do |regex|
    match do |actual|
      actual.find { |str| str =~ regex }
    end
  end

  RSpec::Matchers.define :return_expected_status_code do |code|
    match do |actual|
      actual[:raw].code == code
    end
  end

  RSpec::Matchers.define :return_expected_status_code2 do |code|
    match do |actual|
      actual.status == code
    end
  end

  RSpec::Matchers.define :return_expected_content_type do
    match do |actual|
      expect(actual[:raw].headers[:content_type]).to start_with 'application/json'
    end
  end

  RSpec::Matchers.define :return_response_without_errors do
    match do |actual|
      if actual[:json]['errors']
        actual[:json]['errors'].each do |error|
          unless [
            'Can\'t find successful run for pipeline',
            'No association mappings set for report:',
            'Cannot find association mapping for:',
            'Missing trendMetrics on subLens:',
            'Report not found with id:',
            'Failed to get mongo database usage stats',
            'Cannot return null for non-nullable type: \'ISO8601DateOnly\' within parent',
            'Entity \'Revision: 0\' not found',
            'Missing trendMetrics on cluster:'
          ].each do |message|
            message.include? error['message']
          end
          end
        end
      else
        expect(actual[:json]['errors']).to be_nil
      end
    end
  end
  
  RSpec::Matchers.define :be_boolean do
    match do |actual|
      expect(actual).to satisfy { |x| x == true || x == false }
    end
  end

  RSpec::Matchers.define :match_schema do |schema_path|
    match do |json|
      errors = JSON::Validator.fully_validate(schema_path, json[:json])
      if errors.empty?
        true
      else
        error = RuntimeError.new 'ValidationError'
        error.set_backtrace(errors)
        raise error
      end
    end
  end

  RSpec::Matchers.define :match_schema2 do |schema_path|
    match do |json|
      errors = JSON::Validator.fully_validate(schema_path, (Oj.load json.body))
      if errors.empty?
        true
      else
        error = RuntimeError.new 'ValidationError'
        error.set_backtrace(errors)
        raise error
      end
    end
  end

  RSpec::Matchers.define :match_graphql_error_schema do
    match do |json|
      errors = JSON::Validator.fully_validate(CommonSchema.graphql_error_schema, json[:json]['errors'])
      if errors.empty?
        true
      else
        error = RuntimeError.new 'ValidationError'
        error.set_backtrace(errors)
        raise error
      end
    end
  end

  RSpec::Matchers.define :match_graphql_error_schema do
    match do |json|
      errors = JSON::Validator.fully_validate(CommonSchema.graphql_error_schema, json[:json]['errors'])
      if errors.empty?
        true
      else
        error = RuntimeError.new 'ValidationError'
        error.set_backtrace(errors)
        raise error
      end
    end
  end
end
