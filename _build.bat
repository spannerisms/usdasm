type nul >alttpu_reasm.sfc

asarmon -wnoW1006 -wnoW1030 --fix-checksum=off main.asm alttpu_reasm.sfc

certutil -hashfile alttpu_reasm.sfc md5

@echo Expected:
@echo 608c22b8ff930c62dc2de54bcd6eba72

pause