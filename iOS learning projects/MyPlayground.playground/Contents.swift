import UIKit

var str = "Hello, playground"


class Activity {
    var name:String
    var description:String
    var date:Int
    var dateProper: Date
    
    init(name:String, description:String, date:Int) {
        self.name = name
        self.description = description
        self.date = date
        self.dateProper = Date()
    }
}

var activityArray = [Activity]()

activityArray.append(Activity (name: "shopping", description: "kroger food shopping", date: 25))
activityArray.append(Activity (name: "study", description: "Do cs hw", date: 29))

//activityArray.remove(at: 1)
print(activityArray[1].name)


