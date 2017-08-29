# guid_spanner

[![Travis Status](https://travis-ci.org/Sage/guid_spanner.svg?branch=master)](https://travis-ci.org/Sage/guid_spanner)

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
GuidSpanner::Guid.pack_to_36('1be7eaa5aba341e895a653e66be98fef')
=> '1be7eaa5-aba3-41e8-95a6-53e66be98fef'
```
## Pack a 36 char GUID to 32
```ruby
GuidSpanner::Guid.unpack_to_32('1be7eaa5-aba3-41e8-95a6-53e66be98fef')
=> '1be7eaa5aba341e895a653e66be98fef'
```
# Exceptions
Raises
```ruby
GuidSpanner::Exceptions::InvalidUuidFormatError
``` 
if an incorrectly formatted GUID is provided for packing or unpacking

## Licence

Guid Spanner is licensed under the [Apache-2.0 licence](https://github.com/Sage/guid_spanner/blob/master/LICENSE).

Copyright (c) 2017 Sage Group Plc. All rights reserved.
