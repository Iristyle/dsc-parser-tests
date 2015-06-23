require 'mof'

green = "\e[32;3m"
red = "\e[31;3m"
reset = "\e[0m"
failed_count = 0

mof_files, options = MOF::Parser.argv_handler 'moflint', ARGV
options[:style] ||= :wmi
options[:includes] ||= []
options[:includes].unshift(Pathname.new('.'), Pathname.new('./DSC'), Pathname.new('./cim_schema_2.26.0Final-MOFs'))

parser = MOF::Parser.new(options)
schemas = Dir.glob(["DSC/*.mof"]) # , "ntfs.mof"])
extra_schemas = ['MSFT_Qualifiers.mof', 'qualifiers.mof', 'qualifiers_optional.mof', 'cim_schema_2.26.0.mof']
puts "Discovered #{schemas.count} total schemas to parse\n\n"

schemas.each do |file|
  begin
    # require 'pry'; binding.pry
    result = parser.parse(extra_schemas + [file])
    # result = parser.parse(schemas)
    puts "#{green}[SUCCESS]: Successfully parsed #{file}#{reset}\n"
  rescue Exception => e
    failed_count += 1
    puts "#{red}[ERROR]: Could not parse #{file}#{reset}"
    parser.error_handler e
    puts "\n"
  end
end

fail_msg = "#{green}0#{reset}"
if failed_count > 0
 fail_msg = "#{red}#{failed_count}#{reset}"
end

puts "\n\n######################"
puts "#{fail_msg} of #{schemas.count} total schemas failed to parse\n\n"


