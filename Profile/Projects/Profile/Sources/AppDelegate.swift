import UIKit
import ProfileKit
import PokedexCore

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil
    ) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        
        let viewController = UIViewController()
        
        // let viewController = BackpackWireframe.makeViewController()
        // let dataProvider = BackpackDataProvider()
        // let actions =
        
        // BackpackWireframe.prepare(viewController, actions: <#T##BackpackActions#>, dataProvider: <#T##BackpackDataProvider#>)
        
        viewController.view.backgroundColor = .white
        window?.rootViewController = viewController
        window?.makeKeyAndVisible()
        return true
    }

}
