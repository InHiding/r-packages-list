require 'package_metadata_parser'

class PackagesController < ApplicationController
  def index
    @packages = PackageMetadataParser.parse(Rails.root + 'PACKAGES.txt', 10)
    @packages.each do |package| 
      pack_version = "#{package['Package']}_#{package['Version']}.tar.gz"
      parsed = PackageMetadataParser.parse_zipped('http://cran.r-project.org/src/contrib/' + pack_version)
      parsed.first
    end
  end
end
