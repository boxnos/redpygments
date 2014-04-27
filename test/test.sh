#/bun/sh
bin/redpygments -h
echo  ======= test1
echo bin/redpygments test/test.md
bin/redpygments test/test.md
echo  ======= test2
echo bin/redpygments -s template/template.slim test/test.md
bin/redpygments -s template/template.slim test/test.md
echo  ======= test3
echo bin/redpygments -s template/template.slim test/test.md -o test/out.html
bin/redpygments -s template/template.slim test/test.md -o template/output.html

