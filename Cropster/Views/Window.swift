//
//  Window.swift
//  Cropster
//
//  Created by Varun on 05/08/23.
//

import Foundation
import SwiftUI
// import enum Accelerate.vDSP

struct Window: Shape {

//    var width: CGFloat
//    var height: CGFloat
//    var radius: CGFloat
    var param: SomeVector

//    var animatableData: AnimatablePair<CGFloat, CGFloat> {
//        get { AnimatablePair(width, height) }
//        set {
//            width = newValue.first
//            height = newValue.second
//        }
//    }

    var animatableData: SomeVector {
        get { param }
        set { param = newValue }
    }
    
    var size: CGSize {
        .init(width: param.value.width, height: param.value.height)
    }
    
    func path(in rect: CGRect) -> Path {
        var path = Rectangle().path(in: rect)

        let origin = CGPoint(x: rect.midX - size.width / 2, y: rect.midY - size.height / 2)
        path.addRoundedRect(in: CGRect(origin: origin, size: size), cornerSize: .same(param.value.radius), style: .continuous, transform: .identity)
        
        return path
    }
}

struct Params: Equatable {
    var width: CGFloat
    var height: CGFloat
    var radius: CGFloat
    static var zero = Params.init(width: 0, height: 0, radius: 0)
}

struct SomeVector: VectorArithmetic {
    
    static func - (lhs: SomeVector, rhs: SomeVector) -> SomeVector {
        .init(value: .init(width: lhs.value.width - rhs.value.width, height: lhs.value.height - rhs.value.height, radius: lhs.value.radius - rhs.value.radius))
    }
    
    static func + (lhs: SomeVector, rhs: SomeVector) -> SomeVector {
        .init(value: .init(width: lhs.value.width + rhs.value.width, height: lhs.value.height + rhs.value.height, radius: lhs.value.radius + rhs.value.radius))
    }
    
    
    var value: Params
    
    mutating func scale(by rhs: Double) {
        value.width = value.width * rhs
        value.height = value.height * rhs
        value.radius = value.radius * rhs
    }
    
    var magnitudeSquared: Double {
        (value.height * value.height) + (value.width * value.width) + (value.radius * value.radius)
    }
    
    static var zero: SomeVector = .init(value: Params.zero)
    
}

//struct AnimatableVector: VectorArithmetic {
//    var values: [Float]
//
//    static var zero = AnimatableVector(values: [0.0])
//
//    static func + (lhs: AnimatableVector, rhs: AnimatableVector) -> AnimatableVector {
//        let count = min(lhs.values.count, rhs.values.count)
//        return AnimatableVector(
//            values: vDSP.add(
//                lhs.values[0..<count],
//                rhs.values[0..<count]
//            )
//        )
//    }
//
//    static func += (lhs: inout AnimatableVector, rhs: AnimatableVector) {
//        let count = min(lhs.values.count, rhs.values.count)
//        vDSP.add(
//            lhs.values[0..<count],
//            rhs.values[0..<count],
//            result: &lhs.values[0..<count]
//        )
//    }
//
//    static func - (lhs: AnimatableVector, rhs: AnimatableVector) -> AnimatableVector {
//        let count = min(lhs.values.count, rhs.values.count)
//        return AnimatableVector(
//            values: vDSP.subtract(
//                lhs.values[0..<count],
//                rhs.values[0..<count]
//            )
//        )
//    }
//
//    static func -= (lhs: inout AnimatableVector, rhs: AnimatableVector) {
//        let count = min(lhs.values.count, rhs.values.count)
//        vDSP.subtract(
//            lhs.values[0..<count],
//            rhs.values[0..<count],
//            result: &lhs.values[0..<count]
//        )
//    }
//
//    mutating func scale(by rhs: Double) {
//        vDSP.multiply(
//            Float(rhs),
//            values,
//            result: &values
//        )
//    }
//
//    var magnitudeSquared: Double {
//        Double(
//            vDSP.sum(
//                vDSP.multiply(values, values)
//            )
//        )
//    }
//
//    var count: Int {
//        values.count
//    }
//
//    subscript(_ i: Int) -> Float {
//        get {
//            values[i]
//        } set {
//            values[i] = newValue
//        }
//    }
//}
