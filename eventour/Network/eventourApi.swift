//
//  eventourApi.swift
//  eventour
//
//  Created by Alumnos on 10/25/18.
//  Copyright © 2018 Rafael. All rights reserved.
//

import Foundation

import os
import Alamofire



class eventourApi {
    static let baseUrl = "https://eventour-api.herokuapp.com/api"
    static let eventsUrl = "\(baseUrl)/events"
    static let organizersUrl = "\(baseUrl)/organizers"
    
   

    static private func get(
        
        
        from urlString: String,
        responseType: EventsResponse.Type,
        responseHandler: @escaping(((EventsResponse)->(Void))),
        errorHandler: @escaping ((Error)->Void)){
        
        //validar url
        guard  let url = URL(string: urlString)else{
            let message = "Error on URL"
            os_log("%@",message)
            return
            
        }
        
        //make a request
        Alamofire.request(url)
            .validate()
            .responseJSON(completionHandler: {response in
                switch response.result {
                case.success(_):
                    
                    do {
                        let decoder = JSONDecoder()
                        if let data = response.data{
                            
                            let dataResponse = try decoder.decode(EventsResponse.self,from:data)
                            responseHandler(dataResponse)
                        }
                        
                    }catch{
                        errorHandler(error)
                        
                        
                    }
                    
                case .failure(let error):
                    errorHandler(error)
                }
                
                
            })
        
        
    }
    
    
    static private func getOrganizers(
        
        
        from urlString: String,
        responseType: OrganizersResponse.Type,
        responseHandler: @escaping(((OrganizersResponse)->(Void))),
        errorHandler: @escaping ((Error)->Void)){
        
        //validar url
        guard  let url = URL(string: urlString)else{
            let message = "Error on URL"
            os_log("%@",message)
            return
            
        }
        
        //make a request
        Alamofire.request(url)
            .validate()
            .responseJSON(completionHandler: {response in
                switch response.result {
                case.success(_):
                    
                    do {
                        let decoder = JSONDecoder()
                        if let data = response.data{
                            
                            let dataResponse = try decoder.decode(OrganizersResponse.self,from:data)
                            responseHandler(dataResponse)
                        }
                        
                    }catch{
                        errorHandler(error)
                        
                        
                    }
                    
                case .failure(let error):
                    errorHandler(error)
                }
                
                
            })
        
        
    }
    
    
    static func getEventos(
        
        
        responseHandler:  @escaping ((EventsResponse)->(Void)),
        errorHandler: @escaping ((Error)-> Void)){
        
        self.get(
            
            
            from: eventsUrl,
            responseType: EventsResponse.self,
            responseHandler: responseHandler,
            errorHandler: errorHandler)
        
        
        
        
        
    }
    
    static func getOrganizadores(
        
        
        responseHandler:  @escaping ((OrganizersResponse)->(Void)),
        errorHandler: @escaping ((Error)-> Void)){
        
        self.getOrganizers(
            
            
            from: organizersUrl,
            responseType: OrganizersResponse.self,
            responseHandler: responseHandler,
            errorHandler: errorHandler)
        
        
        
        
        
    }
}
