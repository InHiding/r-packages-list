require 'tar_gz_parser'
require 'dcf' 

class PackageMetadataParser
  def self.parse(uri, length = 0)
    Rails.logger.info("Parsing file: #{uri}")
    data = []
    begin
      package_data = ''
      counter = 1 
      source = open(uri)
      while (line = source.gets)
        package_data += line 
        next unless line.include?('NeedsCompilation')
        counter += 1
        break if counter > length  
      end
      Rails.logger.info("Parsed #{counter} packages from #{uri}")
      data = parse_content(package_data)
    rescue StandardError => e
      Rails.logger.error e.message
    end 
    
    data
  end

  def self.parse_zipped(uri)
    source = TarGzParser.file_contents(uri, 'DESCRIPTION')
    parse_content(source)  
  end

  private

  def self.parse_content(data)
    return [] if data.blank?
    Dcf.parse data
  end  
end
