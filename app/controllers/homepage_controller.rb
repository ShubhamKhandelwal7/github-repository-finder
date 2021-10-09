class HomepageController < ApplicationController

  def check_repo
    query_param = params.dig('homepage', 'search') || ''
    @data = ::DataFetcher::GetRepositoryDetails.new(query_param).fetch
  end
end
