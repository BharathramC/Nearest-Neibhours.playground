//: Playground - noun: a place where people can play

import UIKit
import SceneKit
import Foundation

var nodePositions : [SCNVector3] = []
var neighbourDetails : [UInt : SCNVector3] = [UInt : SCNVector3]()

nodePositions.append(SCNVector3(x: 1.0, y: 1.0, z: 12.0))
nodePositions.append(SCNVector3(x: 1.0, y: 0.0, z: 20.0))
nodePositions.append(SCNVector3(x: 2.0, y: 1.0, z: 3.0))
nodePositions.append(SCNVector3(x: 2.0, y: 0.0, z: 4.0))
nodePositions.append(SCNVector3(x: 3.0, y: 1.0, z: 17.0))
nodePositions.append(SCNVector3(x: 3.0, y: 0.0, z: 9.0))

let nodeCount = nodePositions.count

func createDistanceDetails() {
    var nodeIndex : UInt = 0
    for node in nodePositions {
        var currentNearestDistance = 10000.0
        neighbourDetails[nodeIndex] = node
        for innerNode in nodePositions {
            if !(node.isEqual(to: innerNode)) {
                let currentDistance = node.distanceTo(B: innerNode)
                if currentDistance < currentNearestDistance {
                    neighbourDetails[nodeIndex] = innerNode
                    currentNearestDistance = currentDistance
                }
            }
        }
         nodeIndex = nodeIndex + 1
    }
}

createDistanceDetails()
neighbourDetails


extension SCNVector3 {
    
    func distanceTo(B: SCNVector3) -> Double {
            let l = sqrt(
                (self.x - B.x) * (self.x - B.x)
                    +   (self.y - B.y) * (self.y - B.y)
                    +   (self.z - B.z) * (self.z - B.z)
        )
            return Double(l)
        }
    
    func isEqual(to: SCNVector3) -> Bool {
        if ((self.x == to.x) && (self.y == to.y) && (self.z == to.z)){
            return true
        }
        return false
    }
}
