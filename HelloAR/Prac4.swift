//
//  Prac4.swift
//  HelloAR
//
//  Created by yc on 2023/06/15.
//

// MARK: - Prac 4. Add Entity When View Tapped
//
//import SwiftUI
//import RealityKit
//import ARKit
//
//struct Prac4: View {
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
//        arView.session.delegate = coordinator
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
//final class Coordinator: NSObject, ARSessionDelegate {
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
//            let anchor = ARAnchor(name: "Plane Anchor", transform: result.worldTransform)
//
//            view.session.add(anchor: anchor)
//
//            let modelEntity = ModelEntity(mesh: .generateBox(size: 0.3))
//            modelEntity.model?.materials = [SimpleMaterial(color: .blue, isMetallic: true)]
//
//            let anchorEntity = AnchorEntity(anchor: anchor)
//
//            anchorEntity.addChild(modelEntity)
//
//            view.scene.addAnchor(anchorEntity)
//        }
//    }
//}


// MARK: - Prac 4 (Refactor). Add Entity When View Tapped
//
//// ARAnchor - ARKit Framework
//// AnchorEntity - RealityKit Framework
//
//import SwiftUI
//import RealityKit
//
//struct Prac4: View {
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
//            let anchorEntity = AnchorEntity(raycastResult: result)
//
//            let modelEntity = ModelEntity(mesh: .generateBox(size: 0.3))
//            modelEntity.model?.materials = [SimpleMaterial(color: .blue, isMetallic: true)]
//
//            anchorEntity.addChild(modelEntity)
//
//            view.scene.addAnchor(anchorEntity)
//        }
//    }
//}
