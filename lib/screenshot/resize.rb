require "screenshot/resize/version"
require "fileutils"
require "calabash-cucumber"
require "calabash-cucumber/connection_helpers"
require "fastimage_resize"


module Screenshot
  module Resize
    extend Calabash::Cucumber::ConnectionHelpers

    module_function
    def screenshot_with_scale(options={:prefix => nil, :name => nil, :scale => nil})
      prefix = options[:prefix]
      name = options[:name]
      scale = options[:scale]

      @@screenshot_count ||= 0
      res = http({:method => :get, :path => 'screenshot'})
      prefix = prefix || ENV['SCREENSHOT_PATH'] || ''
      if name.nil?
        name = 'screenshot'
      else
        if File.extname(name).downcase == '.png'
          name = name.split('.png')[0]
        end
      end

      path = "#{prefix}#{name}_#{@@screenshot_count}.png"
      File.open(path, 'wb') do |f|
        f.write res
      end

      unless !scale
        if scale != 1 and scale < 1 and scale > 0
          weight = FastImage.size(path)[0]
          FastImage.resize(path, weight*scale, 0, :outfile=>path)
        end
      end
      @@screenshot_count += 1
      path
    end
  end
end
