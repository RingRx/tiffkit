require 'tty-command'
require "tiffkit/version"

module Tiffkit
  class Error < StandardError; end
  extend self
  def validate_files!(file_list)
    file_list.each{|file| raise Tiffkit::Error.new("File #{file} not found") unless File.exist?(file) }
  end

  def command_line(tiff_files, output_file)
     ['tiffcp', *tiff_files, output_file].join(' ')
  end

  def merge(tiff_files, output_file)
    validate_files!(tiff_files)
    cmd = TTY::Command.new(printer: :null)
    cmd_line = command_line(tiff_files, output_file)
    cmd.run(cmd_line)
  rescue => e
    raise Tiffkit::Error.new(e.message)
  end

end
