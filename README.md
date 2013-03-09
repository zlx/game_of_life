### 问题
细胞自动机，由一堆格子构成的封闭空间，尺寸为N的空间就有 N×N 个格子。每一个格子旁边都由邻居格子存在。 每个格子的生死遵循下面的原则：

游戏来源: [Conway's_Game_of_Life](http://en.wikipedia.org/wiki/Conway's_Game_of_Life)

1. 如果一个活细胞周围有两个或者三个活细胞，则这个细胞为生。
2. 如果一个活细胞周围少于两个活细胞，则这个细胞死亡。
3. 如果一个活细胞周围有超过三个活细胞，则这个细胞死亡。
4. 如果一个死细胞周围有三个活细胞，则这个细胞为生。

### Demo

- http://damp-beach-9911.herokuapp.com/

### TODO

- Add mutipul grid support
- Can apply grid by custom
