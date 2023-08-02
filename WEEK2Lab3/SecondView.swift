
import SwiftUI
struct CardData: Identifiable {
    let id: UUID = UUID()
    let title: String
    let subTitle: String


    let imageURL: URL?
}
func makeCardData() -> Array<CardData>{
    return
    carsList.map { Cars in
        CardData (
            title: Cars,
            subTitle: "",
            imageURL: URL(string: "https://source.unsplash.com/200x200/?\(Cars)")
        )
}}


struct SecondView: View {
    let categories: Array<String> = [
        "ford",
        "Kia",
        "Toyota",
        "Acura"
    ]
  
 

    let cardArray: Array<CardData> = makeCardData()
    @State var title: String = "Calm"
    @State var  filtterCategory : Array<CardData> = []
    @State private var isToggleOn = true
    @ObservedObject var progress = UserProgress()

    @State private var searchText = ""
    @Binding var name: String
    var searchResults: Array<CardData> {
        searchText.isEmpty ? [] : cardArray.filter{$0.title.contains(searchText)}
    }
      
    var body: some View {

       
            VStack {
            
         
                Text("Wlcome \(self.name)").font(.system(.largeTitle))
              
            
                HStack {

                    Text("What is your favorite car?")
                        .font(.system(.title))
                        .foregroundColor(Color.gray)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                    
          

                ScrollView(.horizontal){
                    HStack {
                        ForEach(categories, id:
                                    \.self) { category in
                            Button(action: {
 
                                title = category
                               
                                print(category)
                            }, label: {
                                Text(category)
                            })
                            .padding(.horizontal, 12)
                                .padding(.vertical, 5)
                                .background(Color.gray.opacity(0.5))
                                .cornerRadius(16)
                                .foregroundColor(Color.black)
                            
                        }
                    }}
                .frame(maxWidth: .infinity, alignment: .leading)
                Spacer()
        
                ScrollView{
                    // MARK: Headline Card
                    CardView(data: CardData(
                        title: "Ready to start Your First Session?",
                        subTitle: "",
                        imageURL: URL(string: "https://source.unsplash.com/200x200/?[Car]")))
                    .frame(height: 200 )
                    .cornerRadius(16)
                        .padding(.horizontal, 3)
                        .padding(.vertical, 5)
                
                    // MARK: Popular Cards
                    HStack {
                        Text("Meditations").padding(2)
                        Spacer()
                        
                        NavigationLink(destination: {
                            List(cardArray) { card
                                in
                                NavigationLink( destination: {
                                    Text(card.title)
                                    AsyncImage(url: card.imageURL)
                                    
                                },
                                                
                                                label:{
                                    /*@START_MENU_TOKEN@*/Text(card.title)/*@END_MENU_TOKEN@*/
                                })
                              //    •searchable(text: Squery, prompt: "Find a person*") { if va.filteredData.isEmpty
//                                let randomNane = vm. data. randomElement () I . name
//                                Text ("Maybe you'r§ 100king for \ (randonName)?")
                            } .searchable(text: $searchText)
                        
                        },
                                            
                        label: {
                            Text("See All >>")
                        }
                                       
                        
                    )

                    }
                    ScrollView (.horizontal){
                        HStack (spacing: 10) {
                            
                            ForEach(cardArray) { card in
                                CardView(data: card)
                                
                                    .frame(width: 100, height: 200)
                                
                            }.cornerRadius(16)
                            Spacer()
                            //
                            
                        }
                        
                        
                    }
              
                    Toggle("Nignt Mode", isOn: $isToggleOn)
                        .preferredColorScheme(isToggleOn ? .dark : .light)
                    
                }
            }
            .onChange(of: searchText){ newValue in
                filtterCardBasedOn(newValue)
            }
            .padding()
            .navigationTitle(title)
            .toolbar {
                
                ToolbarItem(placement: .navigationBarTrailing){
                    // when you click here the save the name of user
                    Button(action:{
                        progress.score = name
                    }) {
                        
                        Image(systemName: "person.crop.circle.fill")
                            .padding(.horizontal)
                            
                    }.foregroundColor(Color.red)
                    
                }
            }
           
        }
    func filtterCardBasedOn(_ value: String){
        if !value.isEmpty {
            filtterCategory = cardArray.filter { $0.title.contains(value) }
           } else {
               filtterCategory = cardArray
           }
    }
}

struct ProfileView: View{
    var arrayList: Array<Int> = [1,2,3,4,5,6,7]
    @State var phoneNumber: String = ""
    @State var isShowMessage = false
    @State var message: String = ""
    @Binding var name: String
    var body: some View {
        
        Form{
            Section{
                TextField("Phone number", text: $phoneNumber)
            }
            
            Section{
                
               Text(name)
                
            }

            
        }.alert(isPresented: $isShowMessage){
            
            Alert(title: Text("Alert")
                  , message: Text(message),
                  dismissButton: .default(Text("OK")))
                
        }
        
        .onChange(of: phoneNumber) { newVlue in
            validateNumber (newVlue)
                            }
    }
    // body
        
    func validateNumber (_ value: String)
    {
        if value.isEmpty {
            message = "Enter number plaese"
            isShowMessage = true
        }
        else if !(value.allSatisfy({
            char in char.isNumber
        })){
            message = " Enter number plaese"
            isShowMessage = true
        }
    }
      
    }
    
struct SecondView_Previews: PreviewProvider {
    @State static var name:String = ""
    static var previews: some View {
        NavigationStack  {
            TabView{
                SecondView(name: $name)
                    .tabItem {
                        Image(systemName: "heart.fill")
                        Text("Home Screen")
                    }
                ProfileView(name: $name)
                    .tabItem {
                        Image(systemName: "person.fill")
                        Text("Profile")
                    }
            }}
        }
}


let carsList: Array<String> = """
Mercury
Ford
Chevrolet
Scion
Acura
Audi
Kia
Volkswagen
Mercedes-Benz
Nissan
Plymouth
Lincoln
Mercedes-Benz
Acura
Hummer
Toyota
Mercedes-Benz
Cadillac
Dodge
Cadillac
""" .components(separatedBy: "\n")
