# FormulaAPI
A simple Swift framework that enables fetching of yearly Formula 1 and Formula E data.      


Using the framework you can obtain basic information about drivers, their team constructors and the circuits they were driving on.

The data is retrieved using the Ergast Developer API.

## Instalation

Since this framework has pod dependencies (Alamofire, RxAlamofire, RxSwift/RxCocoa, OHHTTPStubs) it is only available to use as a pod.

To use this framework in your project through CocoaPods, add this to your podfile:

```bash
pod 'FormulaAPI', :git => 'https://github.com/aivcec/FormulaAPI.git'
```

If you want to develop this pod alongside your main project (add it to development pods) you need to clone this repo and put this in your project podfile.

```bash
pod 'FormulaAPI', :path => '../FormulaAPI'
```
Where '../FormulaAPI', is the path to the cloned project.