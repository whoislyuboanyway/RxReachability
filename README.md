![Logo](https://raw.githubusercontent.com/ivanbruel/RxReachability/master/Assets/Logo.png)

RxReachability
=========

[![Version](https://img.shields.io/cocoapods/v/MarkdownKit.svg?style=flat)](http://cocoapods.org/pods/MarkdownKit)
[![License](https://img.shields.io/cocoapods/l/MarkdownKit.svg?style=flat)](http://cocoapods.org/pods/MarkdownKit)
[![Platform](https://img.shields.io/cocoapods/p/MarkdownKit.svg?style=flat)](http://cocoapods.org/pods/MarkdownKit)

RxReachability adds easy to use RxSwift bindings for [ReachabilitySwift](https://github.com/ashleymills/Reachability.swift).
You can react to network reachability changes and even retry observables when network comes back up.

## Available APIs

RxReachability adds the following RxSwift bindings:

- `reachabilityChanged: Observable<Reachability>`
- `status: Observable<Reachability.NetworkStatus>`
- `isReachable: Observable<Bool>`
- `isConnected: Observable<Void>`
- `isDisconnected: Observable<Void>`

## Common Usage

1. Be sure to store an instance of `Reachability` in your `ViewController` or similar, and start/stop the notifier on `viewWillAppear` and `viewWillDisappear` methods.

```swift
class ViewController: UIViewController {

  let disposeBag = DisposeBag()
  var reachability: Reachability?

  override func viewDidLoad() {
    super.viewDidLoad()
    reachability = Reachability()
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    try? reachability?.startNotifier()
  }

  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    reachability?.stopNotifier()
  }
}

```

2. Subscribe to any of the bindings to know when a change happens.

```swift
extension ViewController {

  let disposeBag = DisposeBag()

  func bindReachability() {

    reachability?.rx.reachabilityChanged
      .subscribe(onNext: { reachability: Reachability in
        print("Reachability changed: \(reachability.currrentReachabilityStatus)")
      })
      .addDisposableTo(disposeBag)

    reachability?.rx.status
      .subscribe(onNext: { status: Reachability.NetworkStatus in
        print("Reachability status changed: \(status)")
      })
      .addDisposableTo(disposeBag)

    reachability?.rx.isReachable
      .subscribe(onNext: { isReachable: Bool in
        print("Is reachable: \(isReachable)")
      })
      .addDisposableTo(disposeBag)

    reachability?.rx.isConnected
      .subscribe(onNext: {
        print("Is connected")
      })
      .addDisposableTo(disposeBag)

    reachability?.rx.isDisconnected
      .subscribe(onNext: {
        print("Is disconnected")
      })
      .addDisposableTo(disposeBag)
  }
```

## Static Usage

1. Be sure to store an instance of `Reachability` somewhere on your `AppDelegate` or similar, and start the notifier.

```swift
import ReachabilitySwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var reachability: Reachability?

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    reachability = Reachability()
    try? reachability?.startNotifier()
    return true
  }
}

```

2. Subscribe to any of the bindings to know when a change happens.

```swift
import ReachabilitySwift
import RxReachability
import RxSwift

class ViewController: UIViewController {

  let disposeBag = DisposeBag()

  override func viewDidLoad() {
    super.viewDidLoad()

    Reachability.rx.reachabilityChanged
      .subscribe(onNext: { reachability: Reachability in
        print("Reachability changed: \(reachability.currrentReachabilityStatus)")
      })
      .addDisposableTo(disposeBag)

    Reachability.rx.status
      .subscribe(onNext: { status: Reachability.NetworkStatus in
        print("Reachability status changed: \(status)")
      })
      .addDisposableTo(disposeBag)

    Reachability.rx.isReachable
      .subscribe(onNext: { isReachable: Bool in
        print("Is reachable: \(isReachable)")
      })
      .addDisposableTo(disposeBag)

    Reachability.rx.isConnected
      .subscribe(onNext: {
        print("Is connected")
      })
      .addDisposableTo(disposeBag)

    Reachability.rx.isDisconnected
      .subscribe(onNext: {
        print("Is disconnected")
      })
      .addDisposableTo(disposeBag)
  }
```


## Installation

### Installation via CocoaPods

To integrate RxReachability into your Xcode project using CocoaPods, simply add the following line to your Podfile:

```ruby
pod 'RxReachability'
```

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## License

MarkdownKit is available under the MIT license. See the LICENSE file for more info.