#
#  Be sure to run `pod spec lint FormulaAPI.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  s.name         = "FormulaAPI"
  s.version      = "1.0.0"
  s.summary      = "API that provides yearly information about Formula drivers, circuits and constructors"

  s.description  = "Neat little API."

  s.homepage     = "http://EXAMPLE/FormulaAPI"

  s.license      = "CopyLeft"

  s.author             = { "Antonio Ivcec" => "antonio.ivcec@protonmail.com" }

  s.source       = { :path => '.' }

  s.source_files  = "FormulaAPI/**/*.{h,m,swift}"
  s.exclude_files = "Classes/Exclude"
  
  s.swift_version = "4.2"   
  s.dependency 'Alamofire'
  s.dependency 'CodableAlamofire'

end
