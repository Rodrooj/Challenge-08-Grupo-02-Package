# VictorLibary

Um pacote de **processamento de linguagem natural** em Swift, construído sobre o framework [`NaturalLanguage`](https://developer.apple.com/documentation/naturallanguage).

## 📦 Instalação

No seu `Package.swift`, adicione:

```swift
dependencies: [
    .package(url: "https://github.com/seu-usuario/VictorLibary.git", from: "1.0.0")
]

E depois importe no código:

import VictorLibary


⸻

🚀 Funcionalidades

1. Identificação de idioma

A função identificarIdioma recebe um texto e retorna o idioma predominante em formato ISO (por exemplo, "pt", "en", "es").
Se não reconhecer, retorna "Não encontrado".
```
import VictorLibary

let texto = "O vidro quebrou"
let idioma = identificarIdioma(texto: texto)
print(idioma) // "pt"
```

⸻

2. Tokenização de palavras

A função tokentizacao separa um texto em palavras e caracteres especiais, retornando um array de String.
```
import VictorLibary

let texto = "O vidro quebrou!"
let tokens = tokentizacao(texto: texto)
print(tokens) // ["O", "vidro", "quebrou", "!"]
```

⸻

📚 Roadmap
    •    Melhorar suporte a mais idiomas
    •    Adicionar análise de sentimento
    •    Criar integração com modelos de linguagem maiores

⸻

🛠 Requisitos
    •    Swift 5.5 ou superior
    •    iOS 13+, macOS 10.15+

⸻

📄 Licença

Este projeto está sob a licença MIT.

---

👉 Quer que eu também monte a estrutura de **pastas do projeto (Sources/, Package.swift, .docc)** para você só copiar e colar no Xcode/SwiftPM?
