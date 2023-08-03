import Foundation
import SwiftUI
struct CardView: View
{
    let data:CardData
    var body: some View {
         
        GeometryReader {geometry in
            ZStack{
                    
                    //MARK: Image
                    AsyncImage(url: data.imageURL) { result in
                        if let image = result.image {
                            image
                                .resizable()
                                .scaledToFill()
                        } else {
        //                    Rectangle()
        //                        .fill(Color.black.opacity(0.1))
                            ProgressView()
                        }
                        
                    }.frame(width: geometry.size.width, height: geometry.size.height )
                    
                    VStack {
                        Spacer()
                        Text(data.title)
                           
                        HStack{
                            Text(data.subTitle)
                            
                           
                                
                        }
                        
                    } .frame(maxWidth: .infinity, alignment: .leading).foregroundColor(Color.white)
                    .padding(10)
                   
                  
            } .frame(width: geometry.size.width, height: geometry.size.height )
                    .clipped()
                .background(Gradient(colors: [Color.clear,Color.clear, Color.clear  ,Color.black]))
        }
       
        }
           
        
            
    
    
}


import Foundation
