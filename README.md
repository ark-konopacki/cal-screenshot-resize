# Cal::Screenshot::Resize

## Installation

Add this line to your Gemfile:

``` gem 'cal-screenshot-resize' ```

And then execute:
```
 $ bundle
```
Or install it yourself as:
```
 $ gem install cal-screenshot-resize
```
## Usage 

```
require "screenshot/resize"
```


```
Screenshot::Resize::screenshot_with_scale(:scale => 0.5)
```
`:scale => 0.5` mean that screenshot will be 2 times smaller than original
if you whant to use directly `screenshot_with_scale` add 
`include Screenshot::Resize` to your code

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/ark-konopacki/cal-screenshot-resize.

