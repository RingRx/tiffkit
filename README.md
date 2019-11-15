# Tiffkit


## Installation

To install private gem, generate [Github private token](https://github.blog/2012-09-21-easier-builds-and-deployments-using-git-over-https-and-oauth/) then add the full url with authentication in the gem file, like:


```
gem 'tiffkit', git: 'https://{TOKEN-GOES-HERE}:x-oauth-basic@github.com/RingRx/tiffkit.git'
```
Another alternative is to checkout the project into a directory and set its path in `Gemfile` like following:


```
gem 'tiffkit', path: '/opt/path/to/tiffkit-directory'
```

And then execute:

    $ bundle

## Usage

Use the method `merge` to inform the list of tiff file paths to be converted and the output file

```ruby
files = [ '/tmp/file1.tiff', '/tmp/file2.tiff' ]
Tiffkit.merge(files, '/tmp/output.tiff')
```

### Errors

Most common errors are:

**libtiff not installed**

```
Tiffkit::Error:
No such file or directory - tiffcp
```

Behind the scene `Tiffkit` calls system command `tiffcp` which is part of `libtiff` package, the error above pops up either if the `libtiff` was not installed of if it was installed by the `tiffcp` is out of `$PATH` environment variable.

**Any of source files couldn't be found**

```
Tiffkit::Error:
File /tmp/file.tiff
```

## Install libtiff on CentOS 7.x

Via `yum`:

```shell
yum install libtiff
```

From source:

```shell
curl -JOLs http://download.osgeo.org/libtiff/tiff-4.0.10.tar.gz
tar zxf tiff-4.0.10.tar.gz
cd tiff-4.0.10
./configure
make install
```

Or via source:
## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/RingRx/tiffkit.
