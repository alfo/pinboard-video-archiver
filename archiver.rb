# Setup boring things
require 'rubygems'
require 'bundler'
Bundler.setup(:default)

# Require needed things
require 'pinboard'
require 'json'
require 'uri/http'

# Require your secret things
require './config.rb'

# Load which ones we've downloaded already
json_path = "#{PATH}/index.json"
downloaded = JSON.parse(File.read(json_path)) rescue []

# Get your Pinboard posts
pinboard = Pinboard::Client.new(username: USERNAME, password: PASSWORD)
posts = pinboard.posts

# Loop over all them
posts.each do |post|

  # Skip it if we've already done it
  next if downloaded.include?(post.href)

  # Is it even a valid URL?
  begin uri = URI.parse(post.href)
    domain = uri.host

    # Is it from one of your selected domains?
    if SITES.include?(domain)

      puts "Downloading #{post.href}"

      # Run the download
      `viddl-rb #{post.href} --save-dir #{PATH}`

      # Add it to the downloaded list
      downloaded << post.href
    end
  rescue
    puts "Ignoring #{post.href}"
  end

end

# Write the downloaded list as a JSON
File.open(json_path,"w+") do |f|
  f.write(JSON.pretty_generate(downloaded))
end
