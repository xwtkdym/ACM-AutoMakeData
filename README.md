### ACM-AutoMake

只需要写好files下的
``` sh
  generator.cpp (数据生成器)
  validator.cpp (数据验证器)
  std.cpp       (标程)
  problem.tex   (题目)
```
然后执行 
``` sh
bash tools/doall.sh
```
即可在problem目录下得到problem.zip的题目压缩包(domjudge)
