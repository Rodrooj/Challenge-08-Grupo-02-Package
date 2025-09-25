// The Swift Programming Language
// https://docs.swift.org/swift-book

import NaturalLanguage

/// Função de teste
/// Função que retorna uma String escrita teste
public func teste () -> String {
    return "teste"
}

/// Função animal
/// Base de função que pega uma descrição e retorna um nome de animal
/// Por enquanto incompleta sem o ML
/// Ainda retorna so a própria descrição
///
/// - Parameter descricao: Pega um conteúdo textual que descreve um animal
/// - Returns : Retorna a descrição do animal (por enquanto)
public func animal(descricao: String) -> String {
    // TODO: Colocar o ML e retornar qual é o animal baseado na descrição
    return "O animal é: \(descricao)"
}

/// Função idioma
/// Responsável por definir qual o idioma provável de um texto
/// Caso não dê certo, retorna uma String de não foi possível identificar.
///
/// - Parameter texto: Pega o conteúdo de texto passado
/// - Returns : Retorna o idioma do respectivo texto
public func idioma(texto: String) -> String {
    let language = NLLanguageRecognizer.dominantLanguage(for: texto)
    guard let languageName = language?.rawValue else { return "Não foi possível identificar o idioma" }
    return "O idioma é: \(languageName)"
}
