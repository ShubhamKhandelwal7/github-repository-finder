module DataFetcher
  class GetRepositoryDetails

    GITHUB_SEARCH_API_URL = "https://api.github.com/search/repositories".freeze

    attr_reader :search_params

    def initialize(search_params, options = {})
      @search_params = search_params
      @details = {}
    end

    def fetch
      return @details unless @details.blank?

      @details = begin
                   JSON.parse(get_data)
                   rescue StandardError => e
                   ''
                 end
    end

    private

    def get_data
      begin
        Net::HTTP.get(request_url)
        rescue StandardError => e
        '{}'
      end
    end

    def request_url
      @request_url ||= URI.parse("#{GITHUB_SEARCH_API_URL}?q=#{search_params}")
    end

  end
end
