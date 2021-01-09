​	DEMO 说明

- fno_builtin.c

  作用：当自定义函数与标准 C 库函数重名时，不显示告警信息
  
  直接编译 `gcc -o fno_builtin fno_buitin.c` 会有如下告警，添加 `-fno-builtin` 编译选项后，不再告警 `gcc -o fno_builtin fno_buitin.c -fno-builtin`：
  
  ```bash
  fno_bulitin.c:3:6: warning: conflicting types for built-in function ‘printf’; expected ‘int(const char *, ...)’ [-Wbuiltin-declarati]
      3 | void printf(void)
        |      ^~~~~~
  fno_bulitin.c:2:1: note: ‘printf’ is declared in header ‘<stdio.h>’
      1 | #include <stdlib.h>
  +++ |+#include <stdio.h>
      2 | 
  ```
  
  