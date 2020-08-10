module RequestHelpers
  module_function

  def post(host, resource, payload, headers = {})
    request(:post, host, resource, payload: payload, headers: headers)
  end

  def put(host, resource, payload, headers = {})
    request(:put, host, resource, payload: payload, headers: headers)
  end

  def delete(host, resource, headers = {})
    request(:delete, host, resource, headers: headers)
  end

  def get(host, resource, headers = {})
    request(:get, host, resource, headers: headers)
  end

  def request(method, host, path, options = {})
    default_headers = { accept: :json, content_type: :json }
    args = {
        timeout: 70,
        method: method,
        url: "#{host}#{path}",
        headers: default_headers.merge(options[:headers] || {})
    }
    args[:payload] = options[:payload] if method == :post

    begin
      response = RestClient::Request.execute(args)
      json = Oj.load response
      pp json if ENV['DEBUG'] == 'true'
    rescue RestClient::Exceptions::Timeout => timeout
      pp timeout
    rescue RestClient::ExceptionWithResponse => err
      response = err.response
      json = Oj.load err.response
      pp json if ENV['DEBUG'] == 'true'
    end
    [json, response]
  end
end
