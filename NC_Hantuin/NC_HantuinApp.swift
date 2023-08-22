//
//  NC_HantuinApp.swift
//  NC_Hantuin
//
//  Created by Irvan P. Saragi on 20/08/23.
//

import SwiftUI


@main
struct NC_HantuinApp: App {
    @StateObject var router = Router()
    
    
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $router.path) {
                SplashScreen()
                    .navigationDestination(for: Destination.self) { destination in
                        
                        if destination == .fivePage {
                            GameLevelThree()
                        } else {
                            
                            ViewFactory.viewForDestination(destination)
                        }
                        
                        
                    }
            }
            .environmentObject(router)
        }
    }
}


class Router: ObservableObject {
    @Published var path = NavigationPath()
    
    // example function inside router
    func popToRoot() {
        path.removeLast(path.count)
    }
    
}

// custom page
enum Destination: Hashable {
    case secondPage
    case thirdPage
    case fourthPage
    case fivePage
}

class ViewFactory {
    @ViewBuilder
    static func viewForDestination(_ destination: Destination) -> some View {
        switch destination {
        case .secondPage:
            LevelView()
        case .thirdPage:
            GameLevelOne()
        case .fourthPage:
            GameLevelTwo()
        case .fivePage:
            GameLevelThree()
        }
    }
}

struct CustomData: Equatable, Hashable {
    let x: Int = 0
}
