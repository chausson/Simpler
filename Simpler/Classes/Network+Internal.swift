//
//  Network+Internal.swift
//  Pods
//
//  Created by Chausson on 2017/2/22.
//
//

import Foundation
import Alamofire

public typealias ParameterEncoding = Alamofire.ParameterEncoding

public typealias DataRequest = Alamofire.DataRequest

public extension CHNetBuilder{
    typealias ResponseHandler = (DefaultDataResponse) -> Void
    func requestNormal(_ target:CHRequestable,_ completion: @escaping Completion) -> DataRequest{
        
        var url = target.baseURL+target.path
        if  target.customURL.characters.count > 0{
            url = target.customURL
        }
        if !url.hasPrefix("http://") {
            debugPrint("[Warning Request of URL is not valid]")
        }
        // 拼接Config中的基础参数
        let parms:[String :Any] = jointDic(target.parameters(),target.allParameters)
        let headFields:[String :String] = jointDic(target.headers(),target.allHttpHeaderFields) as! [String : String]
        
        let task = target.task
        let dataRequest = Alamofire.request(url, method: target.method, parameters: parms, encoding: target.encoding, headers: headFields)

        switch task {
        case .request:
            let defultResponseHandler:ResponseHandler = { defultResponse  in
                guard let c:Completion = completion else{
                    debugPrint("Request Finished nothing to do")
                    return
                }
                //将response序列化 将Result传入闭包
                let result =  serializeResponse(defultResponse.response, request: defultResponse.request, data: defultResponse.data, error: defultResponse.error)
                c(result)
            }
            
            dataRequest.response(completionHandler: defultResponseHandler)
//            dataRequest.responseJSON(completionHandler: { res in
//                print(res.value)
//            })
        default:
            dataRequest.response(completionHandler: { defultResponse in
                
            })
        }
        return dataRequest
    }
}

private func jointDic(_ dic:[String:Any], _ otherDic:[String:Any]) -> [String:Any] {
    var newDic:[String :Any] = [String: String]()
    dic.forEach { (key, value) in
        newDic[key] = value
    }
    otherDic.forEach { (key, value) in
        newDic[key] = value
    }
    return newDic
    
}
