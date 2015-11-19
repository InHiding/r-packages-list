require 'open-uri'
require 'rubygems/package'
require 'zlib'

class TarGzParser
  def self.file_contents(uri, filename)
    begin
      source = open(uri)
      tar_file = Zlib::GzipReader.open(source)
    rescue StandardError => e
      Rails.logger.error e.message
      return nil
    end 

    tar_extract = Gem::Package::TarReader.new(tar_file)
    tar_extract.rewind # The extract has to be rewinded after every iteration
    tar_extract.each do |entry|
      if entry.file? && entry.full_name.include?(filename)
        return entry.read
      end 
    end
    tar_extract.close
  end 
end
