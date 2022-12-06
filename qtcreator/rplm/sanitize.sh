# -DCMAKE_CXX_FLAGS:STRING=-B/usr/local/bin/mold/ -Wno-attributes -fsanitize=leak -g
# -DCMAKE_C_FLAGS:STRING=-B/usr/local/bin/mold/ -Wno-attributes -fsanitize=leak -g

LD_PRELOAD=/usr/lib/gcc/x86_64-pc-linux-gnu/8.3.0/libasan.so /home/andrey/projects/tfs/install/unix/Debug/bin/RPLM.Application