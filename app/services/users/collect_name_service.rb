module Users
  class CollectNameService
    def execute
      rest_params = rest_params(:get, url, {})
      ap rest_params
      begin
        response = ::RestClient::Request.execute(rest_params)
        body = JSON.parse(response.body)

        sensitive_name_str = sensitive_names(body)
        result = transform_content_html(sensitive_name_str, body)

        ::OpenStruct.new(result: result, error: nil)
      rescue ::RestClient::ExceptionWithResponse, ::RestClient::NotFound, ::StandardError => error
        ap error
        ap error.backtrace
        ::OpenStruct.new(result: nil, error: error)
      end
    end

    private

    def transform_content_html(sensitive_name_str, body)
      regex = Regexp.new(sensitive_name_str, true)
      body['items'].each_with_index do |item, index|
        body['items'][index]['content_html'].gsub!(regex, '***')
      end
      body
    end

    def sensitive_names(body)
      names = []
      body['items'].each do |item|
        names << item['url']&.split('/')&.last.titleize.split(' ')
      end
      names.flatten.join('|')
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
