import CoreML
import Foundation

func animalClassification(prompt: String) -> String {
    var predictionLabel = ""
    
    do {
      let model = try Animais(configuration: MLModelConfiguration())
        
        let prediction = try model.prediction(text: prompt)
        predictionLabel = prediction.label
    } catch {
        print("Erro ao fazer a predição: \(error)")
    }
    
    return predictionLabel
}
