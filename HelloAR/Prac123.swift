////
////  Prac123.swift
////  HelloAR
////
////  Created by yc on 2023/06/15.
////
//
//import SwiftUI
//import RealityKit
//import ARKit
//
//struct Prac123 : View {
//    var body: some View {
//        ARViewContainer123().edgesIgnoringSafeArea(.all)
//    }
//}
//
//struct ARViewContainer123: UIViewRepresentable {
//
//    func makeUIView(context: Context) -> ARView {
//
//
//
//
//
//        // MARK: - Prac 1. Basic
//
////        let arView = ARView(frame: .zero)
////
////        // 앵커 - 수평
////        let anchor = AnchorEntity(plane: .horizontal)
////
////        // 박스 - 파란색 메탈, 0.3 미터 정육면체
////        let material = SimpleMaterial(color: .blue, isMetallic: true)
////        let box = ModelEntity(mesh: .generateBox(size: 0.3), materials: [material])
////
////        // 구 - 노란색 메탈x, 반지름 0.3미터 구
////        let sphereMaterial = SimpleMaterial(color: .yellow, isMetallic: false)
////        let sphere = ModelEntity(mesh: .generateSphere(radius: 0.3), materials: [sphereMaterial])
////
////        // 구 - 위치 설정
////        sphere.position = SIMD3(SIMD2(x: 0, y: 0.4), 0)
////
////        // 평면 - 빨간색 메탈, x축 길이 0.5미터, z축 길이 0.3미터
////        let planeMaterial = SimpleMaterial(color: .red, isMetallic: true)
////        let plane = ModelEntity(mesh: .generatePlane(width: 0.5, depth: 0.3), materials: [planeMaterial])
////
////        // 평면 - 위치 설정
////        plane.position = SIMD3(0, 0.7, 0)
////
////        // 앵커에 추가
////        anchor.addChild(box)
////        anchor.addChild(sphere)
////        anchor.addChild(plane)
////
////        // 화면에 추가
////        arView.scene.anchors.append(anchor)
////
////        return arView
//
//
//        // MARK: - Prac 2. Text
////        let arView = ARView(frame: .zero)
////
////        let anchor = AnchorEntity(plane: .horizontal)
////
////        let textMesh = MeshResource.generateText(
////            "Hello AR",
////            extrusionDepth: 0.03,
////            font: .systemFont(ofSize: 0.2),
////            containerFrame: .zero,
////            alignment: .center,
////            lineBreakMode: .byCharWrapping
////        )
////        let textMaterial = [SimpleMaterial(color: .blue, isMetallic: true)]
////        let text = ModelEntity(mesh: textMesh, materials: textMaterial)
////
////        anchor.addChild(text)
////        arView.scene.anchors.append(anchor)
////
////        return arView
//
//
//        // MARK: - Prac 3. Gesture
//        
//        let arView = ARView(frame: .zero)
//
//        let tapGesture = UITapGestureRecognizer(
//            target: context.coordinator,
//            action: #selector(context.coordinator.handleTap)
//        )
//        arView.addGestureRecognizer(tapGesture)
//
//        context.coordinator.view = arView
//        arView.session.delegate = context.coordinator
//
//        let anchor = AnchorEntity(plane: .horizontal)
//
//        let box = ModelEntity(mesh: .generateBox(size: 0.3), materials: [SimpleMaterial(color: .blue, isMetallic: true)])
//
//        box.generateCollisionShapes(recursive: true)
//
//        anchor.addChild(box)
//        arView.scene.anchors.append(anchor)
//
//        return arView
//
//    }
//
//    func makeCoordinator() -> Coordinator {
//        return Coordinator()
//    }
//
//    func updateUIView(_ uiView: ARView, context: Context) {}
//
//}
//
//// MARK: - Prac 3. Gesture
//
//class Coordinator: NSObject, ARSessionDelegate {
//
//    weak var view: ARView?
//
//    @objc func handleTap(_ recognizer: UITapGestureRecognizer) {
//        guard let view = self.view else { return }
//
//        let tapLocation = recognizer.location(in: view)
//
//        print("탭 위치", tapLocation)
//
//        if let entity = view.entity(at: tapLocation) as? ModelEntity {
//            print("탭한 엔터티", entity)
//
//            let material = SimpleMaterial(color: .random(), isMetallic: true)
//
//            entity.model?.materials = [material]
//        }
//    }
//}
//
//// MARK: - Prac 3. Gesture
//extension UIColor {
//    static func random() -> UIColor {
//        return UIColor(
//            displayP3Red: .random(in: 0...1),
//            green: .random(in: 0...1),
//            blue: .random(in: 0...1),
//            alpha: 1.0
//        )
//    }
//}
