import NaturalLanguage

/// Identificar o idioma do texto
///
/// - Parameter texto: Texto que será analisado.
/// - Returns: Retorna uma string indicando o idioma predominante (ex: "pt").
///   Em caso de não reconhecimento, retorna "Não encontrado".
public func identificarIdioma(texto: String) -> String {
    let reconhecedor = NLLanguageRecognizer()
    reconhecedor.processString(texto)
    if let language = reconhecedor.dominantLanguage {
        return language.rawValue
    }
    return "Não encontrado"
}

/// Enumera as palavras de uma String e retorna um array com cada palavra e caracteres especiais.
///
/// - Parameter texto: Texto que será tokenizado.
/// - Returns: Um array de `String` representando as palavras e símbolos do texto.
///   Exemplo: `["O", "vidro", "quebrou", "!"]`
public func tokentizacao(texto: String) -> [String] {
    let tokenizer = NLTokenizer(unit: .word)
    tokenizer.string = texto
    var palavras: [String] = []
    tokenizer.enumerateTokens(in: texto.startIndex..<texto.endIndex) { tokenRange, _ in
        palavras.append(String(texto[tokenRange]))
        return true
    }
    return palavras
}
