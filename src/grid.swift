//
//  grid.swift
//  Grid Search
//
//  Created by Yukai Yang on 2018-12-28.
//

import Foundation


// the class SubGrid stores the points of the grid at certain dimension
class SubGrid {
  var points: [Double]
  
  // get the number of available points
  var count: Int {
    return points.count
  }
  
  init() {
    points = [Double]()
  }
  
  // there are three ways to initialize a new subgrid
  
  // by giving a Double array
  init(points: [Double]) {
    self.points = points.sort()
  }
  
  // from to and by
  init(from:Double, to:Double, by:Double) {
    self.init()
    var tmp = from
    repeat {
      points.append(tmp)
      tmp += by
    } while tmp < to
    points.append(to)
  }
  
  // from to and length
  init(from:Double, to:Double, length:Int) {
    let by = (to - from)/length
    self.init(from:from, to:to, by:by)
  }
}


// the class Grid is actually a collection of its subgrids
// so it is multiple dimensional
class Grid {
  var subgrids: [SubGrid]
  
  // get the dimension of the grid
  var dim: Int {
    return subgrids.count
  }
  
  // variadic type initializer
  init(_ subgrids: SubGrid...) {
    self.subgrids = [SubGrid]()
    for subgrid in subgrids {
      self.subgrids.append(subgrid)
    }
  }
}
