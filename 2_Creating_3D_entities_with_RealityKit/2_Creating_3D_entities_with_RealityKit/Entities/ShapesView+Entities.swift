//
//  ShapesView+Entities.swift
//  2_Creating_3D_entities_with_RealityKit
//
//  Created by eiji.shirakazu on 2024/12/02.
//

import RealityKit

extension ShapesView {
    /// 照明に反応する白いマテリアル
    static let whiteMaterial = SimpleMaterial(color: .white, isMetallic: false)
    
    /// 箱状のジオメトリをもつエンティティ
    static let boxEntity: Entity = {
        // エンティティのインスタンスを作成
        let entity = Entity()
        
        // メッシュリソースを作成
        let boxSize: Float = 0.1
        let boxMesh = MeshResource.generateBox(size: boxSize)
        
        // メッシュリソースをモデルコンポーネントに追加し、それをエンティティに追加
        entity.components.set(ModelComponent(mesh: boxMesh, materials: [whiteMaterial]))
        
        return entity
    }()
    
    /// 丸みを帯びた箱状のジオメトリを持つエンティティ
    static let roundedBoxEntity: Entity = {
        // Create a new entity instance.
        let entity = Entity()

        // Create a new mesh resource.
        let boxSize: Float = 0.1
        let boxCornerRadius: Float = 0.03
        let roundedBoxMesh = MeshResource.generateBox(size: boxSize, cornerRadius: boxCornerRadius)

        // Add the mesh resource to a model component, and add it to the entity.
        entity.components.set(ModelComponent(mesh: roundedBoxMesh, materials: [whiteMaterial]))

        return entity
    }()
    
    /// 球状のジオメトリを持つエンティティ
    static let sphereEntity: Entity = {
        let entity = Entity()
        
        let sphereRadius: Float = 0.05
        let boxMesh = MeshResource.generateSphere(radius: sphereRadius)
        
        entity.components.set(ModelComponent(mesh: boxMesh, materials: [whiteMaterial]))
        
        return entity
    }()
    
    /// 円錐形のジオメトリを持つエンティティ
    static let coneEntity: Entity = {
        let entity = Entity()
        
        let coneHeight: Float = 0.1
        let coneRadius: Float = 0.05
        let roundedBoxMesh = MeshResource.generateCone(height: coneHeight, radius: coneRadius)
        
        entity.components.set(ModelComponent(mesh: roundedBoxMesh, materials: [whiteMaterial]))
        
        
        return entity
    }()
    
    /// 円筒形状のジオメトリを持つエンティティ
    static let cylinderEntity: Entity = {
        let entity = Entity()
        
        let cylinderHeight: Float = 0.1
        let cylinderRadius: Float = 0.05
        let roundedBoxMesh = MeshResource.generateCylinder(height: cylinderHeight, radius: cylinderRadius)
        
        entity.components.set(ModelComponent(mesh: roundedBoxMesh, materials: [whiteMaterial]))
        
        return entity
    }()
}
