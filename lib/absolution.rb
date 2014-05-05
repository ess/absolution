require 'uri'
module Absolution

  def absolute_url?(url)
    scheme = URI.parse(url.to_s).scheme
    !(scheme.nil? || scheme.empty?)
  end

  def construct_absolute_url(base_url, path)
    u = URI.parse(base_url)
    u.path = path.start_with?('/') ? path : "/#{path}"
    u.to_s
  end

  extend self
end
