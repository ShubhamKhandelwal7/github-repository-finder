class GithubFinderController < ApplicationController

  def check_repo
    query_param = params.dig('github_finder', 'search') || ''
    @data = ::DataFetcher::GetRepositoryDetails.new(query_param).fetch
  end
end
