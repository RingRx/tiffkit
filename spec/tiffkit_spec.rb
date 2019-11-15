require 'tempfile'
RSpec.describe Tiffkit do
  let(:files){ ['sample1.tif', 'sample2.tif'].map{|s| File.join(File.dirname(__FILE__), 'tiffs', s) }}

  it "has a version number" do
    expect(Tiffkit::VERSION).not_to be nil
  end

  it "should merge tiff files" do
    file = Tempfile.new(['test', '.tiff'])
    expect(File.size(file.path)).to eq(0)
    Tiffkit.merge(files, file.path)
    expect(File.size(file.path)).to be > 0
  end

  it "should throw error if file input files don't exist" do
    expect{
      Tiffkit.merge(['/nope.tiff'], 'out')
    }.to raise_error(Tiffkit::Error, 'File /nope.tiff not found')
  end

  it "should throw error if tiffcmd is not present" do
    allow(Tiffkit).to receive(:command_line).and_return('notiffcp')
    expect{
      Tiffkit.merge(files, 'out')
    }.to raise_error(Tiffkit::Error, 'No such file or directory - notiffcp')
  end

  it "wraps unknown errors with Tiffkit::Error" do
    allow(Tiffkit).to receive(:command_line).and_return('tiffcp x x x')
    expect{
      Tiffkit.merge(files, 'out')
    }.to raise_error(Tiffkit::Error, /Running `tiffcp x x x`/)
  end

end
