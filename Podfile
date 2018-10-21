platform :ios, '9.0'

def app_pods
  pod 'Alamofire', '~> 4.7'
  pod 'CodableAlamofire'
  pod 'RxAlamofire'
end

def testing_pods
  pod 'OHHTTPStubs', '~> 6.0'
  pod 'OHHTTPStubs/Swift'
end

target 'FormulaAPI' do
  use_frameworks!

  # Pods for FormulaAPI
    app_pods

  
  target 'FormulaAPI Unit Tests' do
    inherit! :search_paths
    testing_pods
  end

end