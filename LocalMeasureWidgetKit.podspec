Pod::Spec.new do |s|
  s.name             = "LocalMeasureWidgetKit"
  s.version          = "0.1.1"
  s.summary          = "Quick and easy Local Measure widget integration."
  s.description      = <<-DESC
                        This CocoaPod provides the ability to integrate Local Measure Widgets to your app quickly and easily.
                       DESC

  s.homepage         = "https://github.com/localmeasure/LocalMeasureWidgetKit"
  s.license          = "MIT"
  s.author           = { "solal" => "solal@getlocalmeasure.com" }
  s.source           = { :git => "https://github.com/localmeasure/LocalMeasureWidgetKit.git", :tag => s.version.to_s }
  s.social_media_url = "https://twitter.com/localmeasure"

  s.ios.deployment_target = "8.0"
  s.source_files = "LocalMeasureWidgetKit/*.swift"
  s.resource_bundles = {
    "LocalMeasureWidgetKit" => ["LocalMeasureWidgetKit/Assets/*.png"]
  }

  s.dependency "Alamofire", "~> 3.3"
  s.dependency "ObjectMapper", "~> 1.2"
end
