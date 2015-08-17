# PpmToGdl Documentation

## Description

PpmToGdl provides both a command line application and a rake task
that is used to generate a .GDL file containing the PPMs parsed out
of the PrimaryParameters.xml file.

## Installation

Add this line to your gemfile:

    require 'ppmtogdl'

And then execute:

    $ bundle install

or install it yourself as:

    gem install ppmtogdl

## Usage

### Rake Task Usage

The rake task can be included in a rakefile by requiring ppmtogdl like so:

    require 'ppmtogdl'

and called as:

    PpmToGdlTask.new.execute( customer, srcPath, destPath )

### Command Line Application

Usage info can be retrieved from the application by calling it with the -h or --help
options:

    $ ppmtogdl --help


### Notes

* Using a parameter of `all` for customer will generate GDL for all PPMs in the file.

## Testing

PpmToGdl currently uses an outdated version of TestUnit for testing.
Tests can be found in the `test` directory.

## TODO

Update method naming convention to ruby standards.

## Contributing

1. Fork it ( https://github.com/jmcaffee/ppmtogdl/fork )
1. Clone it (`git clone git@github.com:[my-github-username]/ppmtogdl.git`)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Create tests for your feature branch
4. Commit your changes (`git commit -am 'Add some feature'`)
5. Push to the branch (`git push origin my-new-feature`)
6. Create a new Pull Request

## LICENSE

PpmToGdl is licensed under the MIT license.

See [LICENSE](https://github.com/jmcaffee/ppmtogdl/blob/master/LICENSE) for
details.

