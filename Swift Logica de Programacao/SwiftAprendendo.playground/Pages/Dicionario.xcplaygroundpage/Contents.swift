import UIKit

// dicionario
let dicionarioAcademy: [Int:String] = [639:"Victor", 623:"Leonardo"]
// print(dicionarioAcademy)

// traz o valor referente aquela chave
print(dicionarioAcademy[639]!)

print("---------")

for (c, v) in dicionarioAcademy {
    print("\(c):\(v)")
}

print("---------")

// desafio da fila com senha
let filaMap: [String:String] = ["A001":"victor", "A002":"suarez", "A003":"messi", "P001":"idoso", "P002":"idoso2"]

print("Fila antes da ordenacao")
for (c, v) in filaMap {
    print("\(c):\(v)")
}

print("---------")

print("Fila organizada com o sorted(by: ): ")
//testando
(filaMap.keys).sorted(by: <)
print(filaMap)

print("---------")

// primeira versao do codigo do leonardo
//var filaNormal:[String] = []
//var filaPreferencial:[String] = []
//
//for (chave, _) in (filaMap){
//    if chave.first == "A"{
//        filaNormal.append(chave)
//    }
//    if chave.first == "P"{
//        filaPreferencial.append(chave)
//    }
//}
//
//filaNormal.sort()
//filaPreferencial.sort()
//
//for elementos in filaPreferencial{
//    print(elementos, filaMap[elementos]!)
//}
//
//for elementos in filaNormal{
//    print(elementos, filaMap[elementos]!)
//}

// segunda versao do codigo do leonardo
//var filaOrganizada = (filaMap.keys).sorted(by: <)
//
//for key in filaOrganizada{
//    if key.first == "P"{
//        print("Senha \(key): Nome \(filaMap[key]!)")
//    }
//}
//
//for key in filaOrganizada{
//    if key.first == "A"{
//        print("Senha \(key): Nome \(filaMap[key]!)")
//    }
//}

// codigo do Eduardo
//var filterPref = filaMap.filter({$0.key.hasPrefix("P")})
//var sortFilaPref = filterPref.sorted(by: <)
//
//var filterGeral = filaMap.filter({$0.key.hasPrefix("A")})
//var sortFilaGeral = filterGeral.sorted(by: <)
//
//for element in sortFilaPref {
//    print(element)
//}
//for element in sortFilaGeral{
//    print(element)
//}
    
// meu codigo/suarez
//var sortFilaGeral: [Dictionary<String, String>.Element] = (filaMap.filter({$0.key.hasPrefix("P")})).sorted(by: <) + (filaMap.filter({$0.key.hasPrefix("A")})).sorted(by: <)

// meu codigo utilizando como base o codigo do Eduardo
var sortFilaGeral = (filaMap.filter({$0.key.hasPrefix("P")})).sorted(by: <) + (filaMap.filter({$0.key.hasPrefix("A")})).sorted(by: <)

for pessoa in sortFilaGeral {
    print(pessoa)
}

// testar essa versao
// metodo starts()
// var sortFilaGeral = (filaMap.keys.starts(with: "P").sorted(by: <)) + (filaMap.keys.starts(with: "A").sorted(by: <))
