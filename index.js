const http = require('http');

const hostname = '127.0.0.1';   //로컬부스트 자기자신한테 요청
const port = 4000;  //자기자신에게 오는 3000번 포트에만 응답

const server = http.createServer((req, res) => {
    res.statusCode = 200;
    res.setHeader('Content-Type', 'text/plain');    //헤더
    res.end('Hello World\n');       //본문
});

server.listen(port, hostname, () => {
    console.log(`Server running at http://${hostname}:${port}/`);
});

