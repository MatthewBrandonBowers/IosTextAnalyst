import Foundation
import CreateML

// Import data
let data = try MLDataTable(contentsOf: URL(fileURLWithPath: "/Users/calebstultz/Desktop/BullyClassifier.json"))
let (trainingData, testingData) = data.randomSplit(by: 0.8, seed: 5)

// Create MLTextClassifier instance
let bullyClassifier = try MLTextClassifier(trainingData: trainingData, textColumn: "text", labelColumn: "label")

// Create parameter to measure training accuracy
let trainingAccuracy = 1.0 - bullyClassifier.trainingMetrics.classificationError * 100

// Evaluate BullyClassifier's accuracy
let evaluationMetrics = bullyClassifier.evaluation(on: testingData)
let evaluationAccuracy = 1.0 - evaluationMetrics.classificationError * 100

// Save MLModel to disk
let metadata = MLModelMetadata(author: "Caleb Stultz", shortDescription: "An ML model to analyze cyber-bullying sentiments", version: "1.0")
try bullyClassifier.write(to: URL(fileURLWithPath: "Users/calebstultz/Desktop/BullyClassifier.mlmodel"), metadata: metadata)
