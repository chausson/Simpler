//
//  CHRequest.swift
//  CHNetwork
//
//  Created by Chausson on 2017/2/21.
//  Copyright © 2017年 Chausson. All rights reserved.
//

import Foundation


public protocol CHRequestable{
    /// return  Object of type
    associatedtype R

    /// Request Path append path to host
    var path: String { get }
    
    /// Request Method
    var method: HTTPMethod { get }

    var customURL: String { get }

    /// - Returns: headers
    func headers() -> [String: String]
    /// - Returns: parameters

    func parameters() -> [String: Any]
    
    var task:Task { get}
    
    var encoding:ParameterEncoding { get}
    
//    init()
    
}
public enum Task {
    case request
    case upload
    case download
}
public extension CHRequestable{

    var method: HTTPMethod {
        return .get
    }
    var task: Task {
        return .request
    }
    
    var customURL: String {
        return ""
    }
    var encoding: ParameterEncoding {
        return URLEncoding.default
    }
    func headers() -> [String: String] {
        return [ : ]
    }
    func parameters() -> [String: Any] {
        return [ : ]
    }

}



