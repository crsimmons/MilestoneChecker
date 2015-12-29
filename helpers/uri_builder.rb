class UriBuilder
  BASE = "https://api.github.com/repos/:owner/:repo/milestones"

  def initialize(per_page, page)
    @per_page = per_page
    @page = page
  end

  def getURI
    params = getParams(per_page, page)
    uri = URI.parse([BASE, params].compact.join('?'))
  end

  private

  attr_reader :per_page, :page

  def getParams(per_page, page)
    paramsBase = [ "state=closed", "per_page=#{per_page}" ].join('&')
    params = [ "#{paramsBase}", "page=#{page}" ].join('&')
  end
end