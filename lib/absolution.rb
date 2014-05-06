require 'uri'
module Absolution

  def absolute_url?(url)
    scheme = URI.parse(url.to_s).scheme
    !(scheme.nil? || scheme.empty?)
  end

  def construct_absolute_url(base_url, path)
    uri = URI.parse(base_url)

    URI.parse(path.start_with?('/') ? path : "/#{path}").tap do |path_uri|
      uri.path = path_uri.path
      uri.query = path_uri.query
      uri.fragment = path_uri.fragment
    end

    uri.to_s
  end

  extend self
end
