import SwiftUI

extension View {
    /// Função para centralizar uma View horizontalmente
    public func centerHorizontally() -> some View {
        HStack {
            Spacer()
            self
            Spacer()
        }
    }
}

