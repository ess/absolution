require 'spec_helper'
require 'absolution'

class Dummy
  include Absolution
end

describe Absolution do
  let(:klass) {Absolution}

  context 'when included' do
    let(:dummy) {Dummy.new}

    it 'knows about absolute URLs' do
      klass.instance_methods.each do |method|
        expect(dummy).to respond_to(method)
      end
    end
  end

  describe '.absolute_url?' do

    it 'is true when given a HTTP URI' do
      expect(klass.absolute_url?('http://fake.url')).to be_true
    end

    it 'is true when given a HTTPS URI' do
      expect(klass.absolute_url?('https://fake.url')).to be_true
    end

    it 'is false when given a schemeless path' do
      expect(klass.absolute_url?('/asset.file')).to be_false
    end
  end

  describe '.construct_absolute_url' do
    it 'combines a base url with a path' do
      expect(klass.construct_absolute_url('http://fake.url', '/asset.file')).
        to eql('http://fake.url/asset.file')
    end

    it 'separates the base url from the asset with at least 1 /' do
      base_url = 'http://fake.url'
      asset_path = 'asset.file'
      expected_url = base_url + '/' + asset_path
      expect(klass.construct_absolute_url(base_url, asset_path)).
        to eql(expected_url)
    end

    it 'removes an extra / when both the base url and the asset path have it' do
      base_url = 'http://fake.url/'
      asset_path = '/asset.file'
      expected_url = base_url.chomp('/') + asset_path
      expect(klass.construct_absolute_url(base_url, asset_path)).
        to eql(expected_url)
    end

    it 'handles query strings appropriately' do
      base_url = 'http://fake.url'
      asset_path = '/asset.file?key=val'
      expected_url = base_url + asset_path
      expect(klass.construct_absolute_url(base_url, asset_path)).
        to eql(expected_url)
    end
  end
end

