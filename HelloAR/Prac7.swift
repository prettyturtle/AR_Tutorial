//
//  Prac7.swift
//  HelloAR
//
//  Created by yc on 2023/06/19.
//

import SwiftUI
import RealityKit
import Combine

struct Prac7: View {
    var body: some View {
        ARViewContainer().edgesIgnoringSafeArea(.all)
    }
}

struct ARViewContainer: UIViewRepresentable {
    func updateUIView(_ uiView: ARView, context: Context) {}
    
    func makeUIView(context: Context) -> ARView {
        let arView = ARView(frame: .zero)
        
        context.coordinator.arView = arView
        context.coordinator.setup()
        
        return arView
    }
    
    
    func makeCoordinator() -> Coordinator {
        return Coordinator()
    }
}

final class Coordinator {
    weak var arView: ARView?
    
    private var cancellable: AnyCancellable?
    
    func setup() {
        guard let arView = arView else {
            return
        }
        
        let anchor = AnchorEntity(plane: .horizontal)
        
        let box = ModelEntity(
            mesh: .generateBox(size: 0.3),
            materials: [OcclusionMaterial()]
        )
        
        box.generateCollisionShapes(recursive: true)
        arView.installGestures(.all, for: box)
        
       cancellable = ModelEntity.loadAsync(named: "robot")
            .sink { [weak self] completion in
                if case let .failure(error) = completion {
                    fatalError("Unable to load model \(error.localizedDescription)")
                }
                
                self?.cancellable?.cancel()
            } receiveValue: { entity in
                anchor.addChild(entity)
            }
        
        anchor.addChild(box)
        arView.scene.addAnchor(anchor)
    }
}
