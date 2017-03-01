//
//  CHNetwork.swift
//  CHNetwork
//
//  Created by Chausson on 2017/2/22.
//  Copyright © 2017年 Chausson. All rights reserved.
//

import Foundation
import Result
import HandyJSON

open class Simpler<Target>{
    
    public typealias Completion = (_ result: Result<Response,Error>) -> ()
    
    public typealias RequestResult = () -> Void
    
    public typealias R = Target

    open let target: CHRequestable

    public init(_ target:CHRequestable) {
        self.target = target
    }
    @discardableResult
    open func request(_ completion: @escaping Completion) -> DataRequest{
         return  self.requestNormal(target,completion)
    }
    func upload() {
        
    }
}
protocol Resultable {
    associatedtype resultType //声明一个关联类型
    
}
public func serializeResponse(_ response: HTTPURLResponse?, request: URLRequest?, data: Data?, error: Swift.Error?) ->
    Result<Response,Error>{
        switch (response, data, error) {
        case let (.some(response), data, .none):
            let response = Response(statusCode: response.statusCode, data: data ?? Data(), request: request, response: response)
            return .success(response)
        case let (_, _, .some(error)):
            let error = Error.underlying(error)
            return .failure(error)
        default:
            let error = Error.underlying(NSError(domain: NSURLErrorDomain, code: NSURLErrorUnknown, userInfo: nil))
            return .failure(error)
        }
}
