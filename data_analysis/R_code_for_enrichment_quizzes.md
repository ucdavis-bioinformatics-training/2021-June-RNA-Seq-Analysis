R code for selected quizzes/questions

## Quiz 1
Rerun the KS test analysis using the molecular function (MF) ontology.  What is the top GO term listed?
```
GOdata.1 <- new("topGOdata", ontology = "MF", allGenes = geneList, geneSelectionFun = function(x)x, annot = annFUN.org , mapping = "org.Mm.eg.db")
resultKS.1 <- runTest(GOdata.1, algorithm = "weight01", statistic = "ks")
tab.1 <- GenTable(GOdata.1, raw.p.value = resultKS.1, topNodes = length(resultKS.1@score), numChar = 120)
tab.1[1, "Term"]
```
