#/bun/sh
./redpygments -h
echo test1 =======
echo ./redpygments test/test.md
./redpygments test/test.md
echo test2 =======
echo ./redpygments -s template/template.slim test/test.md
./redpygments -s template/template.slim test/test.md
echo test3 =======
echo ./redpygments -s template/template.slim test/test.md -o test/out.html
./redpygments -s template/template.slim test/test.md -o template/output.html

