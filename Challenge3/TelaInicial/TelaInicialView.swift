import SwiftUI

struct TelaInicialView: View {
    var body: some View {
        VStack{
            HStack{
                Circle()
                    .frame(width: 50)
                    .foregroundColor(.blue)
                Circle()
                    .frame(width: 50)
                    .foregroundColor(.blue)
                //BOTOES DE CONFIGURAÇÃO Button(<#T##title: StringProtocol##StringProtocol#>, systemImage: <#T##String#>, action: <#T##() -> Void#>)
                //BOTOES DE CONFIGURAÇÃO Button(<#T##title: StringProtocol##StringProtocol#>, systemImage: <#T##String#>, action: <#T##() -> Void#>)
            }
            
            Rectangle()
                .frame(width: 500, height: 250)
                .foregroundColor(.cyan)
            
            //LOGO: Image(<#T##resource: ImageResource##ImageResource#>)
            
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Text("JOGAR")
            })
            .buttonStyle(.borderedProminent)
            
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Text("CRÉDITOS")
            })
            .buttonStyle(.borderedProminent)
        }
    }
}

#Preview {
    TelaInicialView()
}
