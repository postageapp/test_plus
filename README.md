# Test Plus

Helper extensions for testing Ruby and Rails code using Test::Unit and
MiniTest.

## Usage

The `TestPlus` library can be imported into any project as necessary. Typically
this is done in the `test/helper.rb` file or equivalent:

    class Test::Unit::TestCase
      include TestPlus::Extensions
    end

# Examples

The `test/` directory contains a number of examples demonstrating how the
various assertion rules are applied.

## Copyright

Copyright (c) 2017 Scott Tadman. See LICENSE.txt for
further details.
