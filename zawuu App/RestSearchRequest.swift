//
//  REST_SearchRequest.swift
//  zawuu App
//
//  Created by Anton Schertenleib on 25/09/2014.
//  Copyright (c) 2014 Anton Schertenleib. All rights reserved.
//

import Foundation

class RestSearchRequest {
    
    
    let str: String = "{\"articles\":[{\"available\":true,\"country\":\"de\",\"description\":\"Die DVD Sammlung Lauras Stern - DVDs 1-4 könnt ihr hier erfragen...\",\"id\":\"6643469947\",\"location\":{\"latitude\":51.71802109999999,\"longitude\":14.3775872},\"owner\":{\"fbid\":100000796573704,\"id\":\"3713748603\",\"name\":\"Heiko Wolf\"},\"pickup\":true,\"pictures\":true,\"postal\":\"03051\",\"privacy\":3,\"search\":\"DVD: Lauras Stern Die DVD Sammlung Lauras Stern - DVDs 1-4 könnt ihr hier erfragen...\",\"title\":\"DVD: Lauras Stern\"},{\"available\":true,\"country\":\"de\",\"description\":\"DVD Triologie von Zurueck in die Zukunft zu verleihen...Zurück in die Zukunft (im englischen Original: Back to the Future) ist der Name einer Science-Fiction-Film-Trilogie aus den Jahren 1985, 1989 und 1990. In allen drei Filmen führte Robert Zemeckis Regie. Die Trilogie zeigt die Zeitreisen des Jugendlichen Marty McFly (Michael J. Fox) und seines Freundes Dr. Emmett L. „Doc“ Brown (Christopher Lloyd) zwischen den Jahren 1885 und 2015. Die drei Teile sind: - Zurück in die Zukunft (1985) (spielt 1985 und 1955) - Zurück in die Zukunft II (1989) (spielt 1985, 2015 und 1955) - Zurück in die Zukunft III (1990) (spielt 1955, 1885 und 1985)Der erste Teil war zunächst als Einzelfilm geplant. Das offene Ende, das später den Übergang zu Teil 2 bildete, war eher scherzhaft gedacht. Erst der kommerzielle Erfolg führte zu den zwei Fortsetzungen. [Quelle wikipedia.org]\",\"id\":\"4650061435\",\"location\":{\"latitude\":51.71802109999999,\"longitude\":14.3775872},\"owner\":{\"fbid\":100000796573704,\"id\":\"3713748603\",\"name\":\"Heiko Wolf\"},\"pickup\":true,\"pictures\":true,\"postal\":\"03051\",\"privacy\":3,\"search\":\"DVD Sammlung Zurück in die Zukunft DVD Triologie von Zurueck in die Zukunft zu verleihen...Zurueck in die Zukunft (im englischen Original: Back to the Future) ist der Name einer Science-Fiction-Film-Trilogie aus den Jahren 1985, 1989 und 1990. In allen drei Filmen führte Robert Zemeckis Regie. Die Trilogie zeigt die Zeitreisen des Jugendlichen Marty McFly (Michael J. Fox) und seines Freundes Dr. Emmett L. „Doc“ Brown (Christopher Lloyd) zwischen den Jahren 1885 und 2015. Die drei Teile sind: Zurück in die Zukunft (1985) (spielt 1985 und 1955)  - Zurück in die Zukunft II (1989) (spielt 1985, 2015 und 1955)  - Zurück in die Zukunft III (1990) (spielt 1955, 1885 und 1985)  Der erste Teil war zunächst als Einzelfilm geplant. Das offene Ende, das später den Übergang zu Teil 2 bildete, war eher scherzhaft gedacht. Erst der kommerzielle Erfolg führte zu den zwei Fortsetzungen. [Quelle wikipedia.org]\",\"title\":\"DVD Sammlung Zurück in die Zukunft\"},{\"available\":true,\"country\":\"de\",\"description\":\"Videoabend aber keine passenden Film? Unterhaltung gefällig? Mit Kurt Krömers best of DVD-Box ist der Abend gerettet. 3 DVDs inklusive Bonus Material warten auf Dich.\",\"id\":\"6639341179\",\"location\":{\"latitude\":51.71802109999999,\"longitude\":14.3775872},\"owner\":{\"fbid\":100000796573704,\"id\":\"3713748603\",\"name\":\"Heiko Wolf\"},\"pickup\":true,\"pictures\":true,\"postal\":\"03051\",\"privacy\":3,\"search\":\"DVD: Best of Kurt Krömer Show Videoabend aber keine passenden Film? Unterhaltung gefällig? Mit Kurt Krömers best of DVD-Box ist der Abend gerettet. 3 DVDs inklusive Bonus Material warten auf Dich.\",\"title\":\"DVD: Best of Kurt Krömer Show\"}]}"
    
    var data = NSMutableData()
    
    func searchItem() -> ZawuuItemContainer {
    
        let jsonData: NSData = str.dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: true)!

        var error1: NSError?
        let deserializedJSON = NSJSONSerialization.JSONObjectWithData(jsonData, options: NSJSONReadingOptions.MutableContainers, error: &error1) as NSDictionary
        var articles = deserializedJSON.valueForKey("articles") as NSArray
        
        let container: ZawuuItemContainer = ZawuuItemContainer()
        for currentItem in articles {
            
            let newItem: ZawuuItem = ZawuuItem()
            newItem.name = currentItem.dictionaryWithValuesForKeys(["title"])["title"] as NSString
            //        item1.images = articles[0].dictionaryWithValuesForKeys(["title"])["title"] as NSString
            newItem.description = currentItem.dictionaryWithValuesForKeys(["search"])["search"] as NSString
            
            container.items.addObject(newItem)
            
            //println(item.dictionaryWithValuesForKeys(["id"]))
        }
        
        
        return container
    }
    
    /*
    func connect(query:NSString) {
        
        var url =  NSURL(string: "https://query.yahooapis.com/v1/public/yql?q=SELECT * from yahoo.finance.quote WHERE symbol in ('GE') &format=json&diagnostics=true&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys&callback="")
        var request = NSURLRequest(URL: url!)
        var conn = NSURLConnection(request: request, delegate: self, startImmediately: true)
    }
    */
    
/*    func connection(didReceiveResponse: NSURLConnection!, didReceiveResponse response: NSURLResponse!) {
        println("didReceiveResponse")
    }

    func connection(connection: NSURLConnection!, didReceiveData conData: NSData!) {
        self.data.appendData(conData)
    }
*/    
    func connectionDidFinishLoading(connection: NSURLConnection!) {
        //println(self.data)
    }
    
//    deinit {
//        println("deiniting")
//    }
}