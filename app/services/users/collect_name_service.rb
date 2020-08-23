module Users
  class CollectNameService
    def execute
      feed_http_request(:get, url, nil)
    end

    private

    def feed_http_request(method, url, payload = {})
      rest_params = rest_params(method, url, payload)
      ap rest_params
      begin
        response = ::RestClient::Request.execute(rest_params)
        body = JSON.parse(response.body)
        names = []
        body['items'].each do |item|
          names << item['url']&.split('/')&.last&.titleize
        end
        ::OpenStruct.new(result: names, error: nil)
      rescue ::RestClient::ExceptionWithResponse, ::RestClient::NotFound, ::StandardError => error
        ap error
        ap error.backtrace
        ::OpenStruct.new(result: nil, error: error)
      end
    end

    def rest_params(method, url, payload)
      {
        method: method,
        url: url,
        headers: {
          content_type: 'application/json;charset=UTF-8',
          accept: 'application/json'
        },
        payload: payload.to_json,
        verify_ssl: false
      }
    end

    def url
      'http://therecord.co/feed.json'
    end
  end
end
