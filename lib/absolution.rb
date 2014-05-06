require 'uri'
module Absolution

  def absolute_url?(url)
    scheme = URI.parse(url.to_s).scheme
    !(scheme.nil? || scheme.empty?)
  end

  def construct_absolute_url(base_url, path)
    u = URI.parse(base_url)
    path.split('?').tap do |path_array|
      u.path = path_array.first.start_with?('/') ? path_array.first : "/#{path_array.first}"
      u.query = path_array.last if path_array.length > 1
    end
    u.to_s
  end

  extend self
end
