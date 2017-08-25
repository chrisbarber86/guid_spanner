# guid_spanner
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
Guid.pack_to_36('1be7eaa5aba341e895a653e66be98fef')
=> '1be7eaa5-aba3-41e8-95a6-53e66be98fef'
```
## Pack a 36 char GUID to 32
```ruby
Guid.unpack_to_32('1be7eaa5-aba3-41e8-95a6-53e66be98fef')
=> '1be7eaa5aba341e895a653e66be98fef'
```
# Exceptions
Raises `InvalidUuidFormatError` if an incorrectly formatted GUID is provided for packing or unpacking
