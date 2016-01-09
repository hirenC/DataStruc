//
//  Rot2D90Right.swift
//  Algorithms
//
//  Created by Michael MacCallum on 1/8/16.
//  Copyright © 2016 Michael MacCallum. All rights reserved.
//


struct Point: CustomStringConvertible {
    var x: Int = 0
    var y: Int = 0

    var description: String {
        return "(\(x), \(y))"
    }
}

public func rotate90Right(inout arr: [[Int]]) {
    var last = Point(x: 0, y: 0)
    var save = arr[last.x][last.y]

    for shift in 0 ..< arr.count / 2 {
        for offset in shift ..< arr.count.predecessor() - shift {
            last = Point(x: offset, y: shift)
            save = arr[last.y][last.x]

            for _ in 0 ... 3 {
                let next = Point(x: arr.count.predecessor() - last.y, y: last.x)
                let tmp = arr[next.y][next.x]
                arr[next.y][next.x] = save
                save = tmp
                last = next
            }
        }
    }
}
