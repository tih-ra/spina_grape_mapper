Spina Grape Mapper
=============

Ruby library for build API on the fly from Spina CMS

## Installation
    Just move library to /app/lib, Gem will be soon))

## Quick Start

1. **How this is works with Grape**
Example:

    ```ruby
      module MySpinaSiteApi
        class API < Grape::API

          version 'v1', using: :header, vendor: 'my-spina-site'
          format :json

          Spina::Page.where.not(name: nil).map(&:name).each do |_resource|
            resource _resource.to_sym do
              get do
                SpinaGrapeMapper::MapJson.new(_resource).json_by_page_name
              end
            end
          end

        end
      end

    ```

### License
(The MIT License)

Copyright (c) 2017 Andriy Bazyuta &lt;andriy.bazyuta@gmail.com&gt;

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
'Software'), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

---
### Author
Andriy Bazyuta
