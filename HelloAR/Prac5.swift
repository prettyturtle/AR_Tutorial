//
//  Prac5.swift
//  HelloAR
//
//  Created by yc on 2023/06/16.
//

// MARK: - Prac 5. Other Gesture (rotate, translate, scale)

//import SwiftUI
//import RealityKit
//
//struct Prac5: View {
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
//            modelEntity.generateCollisionShapes(recursive: true)
//
//            anchorEntity.addChild(modelEntity)
//
//            view.scene.addAnchor(anchorEntity)
//
//            view.installGestures(.all, for: modelEntity)
//        }
//    }
//}
