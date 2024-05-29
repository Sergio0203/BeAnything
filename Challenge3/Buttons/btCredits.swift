import Foundation
import SwiftUI

struct btCredits : View{
    
    var image = Image(.iconInte)
    
    var body: some View{
        HStack{
            NavigationLink{
                //CreditsView()
            } label: {
                Image(.iconInte)
                    .resizable()
                    .frame(width: 50, height: 50)
                    .padding(2.5)
            }
        }.padding(5)
    }
}
