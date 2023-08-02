
//Task 5: Using @ObservableObject

//Define an ObservableObject class with a published property to represent data.
//In the main view, create an instance of the ObservableObject class and observe the data change.
//Implement a button in the main view to update the data and see the UI reflect the changes.
import Foundation
class UserProgress: ObservableObject {
    @Published var score  = ""
}
