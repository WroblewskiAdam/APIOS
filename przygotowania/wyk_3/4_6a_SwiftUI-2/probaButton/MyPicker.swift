//
//  Created by apios on 04/11/2019.
//  Copyright © 2019 Adam Wojtasik. All rights reserved.
//

import SwiftUI

struct MyPicker: View {
    @State private var selected = 0

    var body: some View {
        VStack {
            Picker(selection: $selected, label: Text("Wybierz liczbę: ")) {
              Text("0").tag(0)
              Text("1").tag(1)
              Text("2").tag(2)
              Text("3").tag(3)
              Text("4").tag(4)
              Text("5").tag(5)
              Text("6").tag(6)
              Text("7").tag(7)
            }

            Text("Wybrana liczba: \(selected)")
        }
    }
}

struct MyPicker_Previews: PreviewProvider {
    static var previews: some View {
        MyPicker()
    }
}
