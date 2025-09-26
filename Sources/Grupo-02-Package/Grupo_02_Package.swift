// The Swift Programming Language
// https://docs.swift.org/swift-book

import CoreML
import Foundation

/// A classe que interage com o modelo, predizendo um animal descrito em um prompt
class GuessAnimal {
    
    /// Essa função carrega o modelo `AnimalGuesser`, envia o prompt para ele
    /// e retorna o animal identificado. Se algum erro acontecer envolvendo o modelo
    /// ou sua previsão (Ex.: prompt vazio), o erro será printado no console e a função
    /// retorna uma string vazia
    ///
    /// - Parameter prompt: Uma `String` descrevendo o animal
    /// - Returns: Uma `String` contendo o nome do animal previsto pelo modelo
    func calculaAnimal(prompt: String) -> String{
        var predictionLabel = ""
        
        do {
            /// O ML
            let model = try AnimaisGuesser(configuration: MLModelConfiguration())
            
            /// A saída do modelo
            let prediction = try model.prediction(text: prompt)
            
            /// O nome do animal identificado (Ex.: Cachorro, Pássaro, Peixe)
            predictionLabel = prediction.label
        } catch {
            /// Captura qualquer erro e o printa
            print("Erro: \(error)")
        }
        
        return predictionLabel
    }
}
