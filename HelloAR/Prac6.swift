//
//  Prac6.swift
//  HelloAR
//
//  Created by yc on 2023/06/16.
//

// MARK: - Prac 6. usdz file

//import SwiftUI
//import RealityKit
//
//struct Prac6: View {
//    var body: some View {
//        ARViewContainer().edgesIgnoringSafeArea(.all)
//    }
//}
//
//
//struct ARViewContainer: UIViewRepresentable {
//    func makeCoordinator() -> Coordinator {
//        return Coordinator()
//    }
//
//    func makeUIView(context: Context) -> ARView {
//        let coordinator = context.coordinator
//
//        let arView = ARView(frame: .zero)
//
//        coordinator.view = arView
//
//        let tapGesture = UITapGestureRecognizer(
//            target: coordinator,
//            action: #selector(coordinator.handleTap)
//        )
//
//        arView.addGestureRecognizer(tapGesture)
//
//        return arView
//    }
//
//    func updateUIView(_ uiView: ARView, context: Context) {}
//}
//
//final class Coordinator: NSObject {
//
//    weak var view: ARView?
//
//    @objc func handleTap(_ recognizer: UITapGestureRecognizer) {
//        guard let view = self.view else { return }
//
//        let tapLocation = recognizer.location(in: view)
//
//        let results = view.raycast(
//            from: tapLocation,
//            allowing: .estimatedPlane,
//            alignment: .horizontal
//        )
//
//        if let result = results.first {
//
//            // 앵커 앤터티 생성
//            let anchor = AnchorEntity(raycastResult: result)
//
//            // 앤터티 생성
//            guard let entity = try? ModelEntity.load(named: "robot") else {
//                fatalError("Robot model was not!")
//            }
//
//            anchor.addChild(entity)
//
//            // 씬에 앵커 앤터티 추가
//            view.scene.addAnchor(anchor)
//        }
//    }
//}


// MARK: - Prac 6 (refactor). usdz file

// load : sync
// loadAsync : async

import SwiftUI
import RealityKit
import Combine

struct Prac6: View {
    var body: some View {
        ARViewContainer().edgesIgnoringSafeArea(.all)
    }
}


struct ARViewContainer: UIViewRepresentable {
    func makeCoordinator() -> Coordinator {
        return Coordinator()
    }
    
    func makeUIView(context: Context) -> ARView {
        let coordinator = context.coordinator
        
        let arView = ARView(frame: .zero)
        
        coordinator.view = arView
        
        let tapGesture = UITapGestureRecognizer(
            target: coordinator,
            action: #selector(coordinator.handleTap)
        )
        
        arView.addGestureRecognizer(tapGesture)
        
        return arView
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {}
}

final class Coordinator: NSObject {
    
    weak var view: ARView?
    var cancellable: AnyCancellable?
    
    @objc func handleTap(_ recognizer: UITapGestureRecognizer) {
        guard let view = self.view else { return }
        
        let tapLocation = recognizer.location(in: view)
        
        let results = view.raycast(
            from: tapLocation,
            allowing: .estimatedPlane,
            alignment: .horizontal
        )
        
        if let result = results.first {
            
            // 앵커 앤터티 생성
            let anchor = AnchorEntity(raycastResult: result)
            
            // 앤터티 생성
//            guard let entity = try? ModelEntity.loadAsync(named: "robot") else {
//                fatalError("Robot model was not!")
//            }
            
//            anchor.addChild(entity)
            
            cancellable = ModelEntity.loadAsync(named: "robot")
                .sink { loadCompletion in
                    switch loadCompletion {
                    case .finished:
                        print("Complete Load Model")
                    case .failure(let error):
                        print("Unable to load model : \(error.localizedDescription)")
                    }
                    
                    self.cancellable?.cancel()
                } receiveValue: { entity in
                    anchor.addChild(entity)
                }
            
            // 씬에 앵커 앤터티 추가
            view.scene.addAnchor(anchor)
        }
    }
}
