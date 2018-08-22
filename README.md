# guid_spanner

[![Travis Status](https://travis-ci.org/Sage/guid_spanner.svg?branch=master)](https://travis-ci.org/Sage/guid_spanner)
[![Maintainability](https://api.codeclimate.com/v1/badges/8d12a8e1ea18edf6297c/maintainability)](https://codeclimate.com/github/Sage/guid_spanner/maintainability)
[![Test Coverage](https://api.codeclimate.com/v1/badges/8d12a8e1ea18edf6297c/test_coverage)](https://codeclimate.com/github/Sage/guid_spanner/test_coverage)
[![Gem Version](https://badge.fury.io/rb/guid_spanner.png)](http://badge.fury.io/rb/guid_spanner)

Packs and unpacks 32(compact) and 36 charactor GUIDs

# Install
```ruby
require 'guid_spanner'
```
```ruby
bundle
```

# Usage
## Unpack a 32 GUID to 36
```ruby
GuidSpanner::Guid.unpack_to_36('1be7eaa5aba341e895a653e66be98fef')
=> '1be7eaa5-aba3-41e8-95a6-53e66be98fef'
```
## Pack a 36 char GUID to 32
```ruby
GuidSpanner::Guid.pack_to_32('1be7eaa5-aba3-41e8-95a6-53e66be98fef')
=> '1be7eaa5aba341e895a653e66be98fef'
```
## Convert a 36 char GUID to binary
```ruby
GuidSpanner::Guid.str_to_bin('1be7eaa5-aba3-41e8-95a6-53e66be98fef')
=> '\e\xE7\xEA\xA5\xAB\xA3A\xE8\x95\xA6S\xE6k\xE9\x8F\xEF'
```
## Convert a binary GUID to 36 char
```ruby
GuidSpanner::Guid.bin_to_str('\e\xE7\xEA\xA5\xAB\xA3A\xE8\x95\xA6S\xE6k\xE9\x8F\xEF')
=> '1be7eaa5-aba3-41e8-95a6-53e66be98fef'
```
# Exceptions
Raises
```ruby
GuidSpanner::Exceptions::InvalidUuidFormatError
```
if an incorrectly formatted GUID is provided for packing or unpacking or conversion

## Licence

Guid Spanner is licensed under the [Apache-2.0 licence](https://github.com/Sage/guid_spanner/blob/master/LICENSE).

Copyright (c) 2018 Sage Group Plc. All rights reserved.
