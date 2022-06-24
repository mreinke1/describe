# Illustration of the describe function


Create a matrix with random data. For example X contains in every column a variable.



```matlab:Code
X = randn(10,5);
```



Describe returns the summary statistic of each column.



```matlab:Code
describe(X)
```

| |Mean|Std|Min|25%|50%|75%|Max|
|:--:|:--:|:--:|:--:|:--:|:--:|:--:|:--:|
|1|0.6243|1.6791|-2.2588|-0.4336|0.4401|1.8339|3.5784|
|2|0.7049|1.1565|-1.3499|-0.1241|0.7201|1.4172|3.0349|
|3|0.3265|0.8155|-1.2075|-0.3034|0.5802|0.7269|1.6302|
|4|-0.4414|1.3481|-2.9443|-1.1471|-0.7822|0.8884|1.4384|
|5|0.2059|0.5866|-0.8649|-0.1649|0.1414|0.6277|1.1093|



Considering a table with some data and variable names. Calling describe



```matlab:Code
Xtable = array2table(randn(10,5));
describe(Xtable)
```

| |Mean|Std|Min|25%|50%|75%|Max|
|:--:|:--:|:--:|:--:|:--:|:--:|:--:|:--:|
|1 Var1|0.0072|0.5809|-1.0298|-0.1623|0.1592|0.3071|0.9492|
|2 Var2|-0.1281|0.9138|-1.1742|-0.7120|-0.3789|-0.1922|1.6821|
|3 Var3|-0.0104|0.9006|-1.5062|-0.4446|-0.1928|0.4434|1.6035|
|4 Var4|-0.5608|1.0635|-3.0292|-0.9480|-0.4824|0.0125|1.2424|
|5 Var5|0.0465|0.8477|-1.5651|-0.0845|0.0699|0.3503|1.6039|

