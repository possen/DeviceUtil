#!/usr/bin/env ruby

require 'xcodeproj'

task :xcodeproj do
  system "swift package generate-xcodeproj"
  data = File.read('Package.swift')
  /publicHeadersPath: "(?<result>.*)"/i =~ data
  path = Dir.pwd + "/Sources/" + result + "/"
  p path
  project = Xcodeproj::Project.open(Dir["*.xcodeproj"].first)
  main = project.main_group
  p project
  project.build_configurations.each { |config|
    config.build_settings["SDKROOT"] = "iphoneos"
    config.build_settings["IPHONEOS_DEPLOYMENT_TARGET"] = "9.3"
    config.build_settings.delete("SUPPORTED_PLATFORMS")
  }
  target = project.targets.last
  ref = main.new_group("PublicHeaders")
  Dir.foreach(path) do |file|
    next if file == '.' or file == '..'
    ref = project["PublicHeaders"].new_file(path + file)
    target.headers_build_phase.add_file_reference(ref)
  end
  for file in target.headers_build_phase.files
    file.settings = { "ATTRIBUTES" => ["Public"] }
  end
  project.save
end
