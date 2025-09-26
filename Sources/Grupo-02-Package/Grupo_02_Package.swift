// The Swift Programming Language
// https://docs.swift.org/swift-book

import NaturalLanguage
import Translation
import CoreML

/// Class animalPackage
/// classe responsável por manipular tudo sobre o código
public class animalPackage {
    
    private let model: Animais3?
    
    public init(){
        do {
            self.model = try Animais3(configuration: MLModelConfiguration())
        } catch {
            print("Erro no modelo: \(error)")
            self.model = nil
        }
    }
    
    /// Função de teste
    /// Função que retorna uma String escrita teste
    public func teste () -> String {
        return "teste"
    }
    
    /// Função animal
    /// Função que pega o model treinado, analisa a descrição sobre o animal e prevê qual o animal
    /// Ela prevê somente ente cachorro, peixe e pássaro
    ///
    /// - Parameter descricao: Pega um conteúdo textual que descreve um animal
    /// - Returns : Retorna a descrição do animal (por enquanto)
    public func whatAnimal(descricao: String) -> String {
        // TODO: Colocar o ML e retornar qual é o animal baseado na descrição
        guard let model = model else { return "Modelo não carregado" }
        let predicao: Animais3Output
        do {
            predicao = try model.prediction(text: "\(descricao)")
            return "O animal é: \(predicao.label)"
        } catch {
            return "Erro: \(error)"
        }
    }
    
    /// Função idioma
    /// Responsável por definir qual o idioma provável de um texto
    /// Caso não dê certo, retorna uma String de não foi possível identificar.
    ///
    /// - Parameter text: Pega o conteúdo de texto passado
    /// - Returns : Retorna o idioma do respectivo texto
    public func whatLanguage(text: String) -> String {
        let language = NLLanguageRecognizer.dominantLanguage(for: text)
        guard let languageName = language?.rawValue else { return "Não foi possível identificar o idioma" }
        return "O idioma é: \(languageName)"
    }
    
    /// Função de Tradução
    /// Responsável por Traduzir um texto para vários idiomas
    /// Puxa de uma API de tradução o necessário
    /// Traduz para três linguas, portugês (pt), inglês (en)  e francês (fr)
    ///
    /// - Parameter text: Recebe um conteúdo de texto para traduzir
    /// - Returns : Retorna um set com a linguagem e o texto traduzido para a linguagem respectiva
    public func translate(text: String) async throws -> [Locale.Language: String] {
        var results: [Locale.Language: String] = [:]
        let targets: [Locale.Language] = [Locale.Language.init(identifier: "pt"), Locale.Language.init(identifier: "en"), Locale.Language.init(identifier: "fr")]
        for lang in targets {
            let config = TranslationSession.Configuration(source: nil, target: lang)
            guard let cfgTarget = config.target else { return [:] }
            let session = TranslationSession(installedSource: config.source ?? Locale.Language.init(identifier: "pt") ,target: cfgTarget)
            let response = try await session.translate(text)
            results[lang] = response.targetText
        }
        return results
    }
}
