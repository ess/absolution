require 'uri'
module Absolution

  def absolute_url?(url)
    URI.parse(url.to_s).absolute?
  end

  def construct_absolute_url(base_url, path)
    uri = URI.parse(base_url)

    URI.parse(path.start_with?('/') ? path : "/#{path}").tap do |path_uri|
      uri.path = uri.path.chomp('/') + path_uri.path
      uri.query = path_uri.query
      uri.fragment = path_uri.fragment
    end

    uri.to_s
  end

  extend self
end
