import express from 'express';
import os from 'os';

const server = express();

server.get('/', (req, res) => {
  return res.send({
    msg: 'hello codemotion',
    hostname: os.hostname(),
  });
});

const PORT = process.env.PORT || 3000;

server.listen(PORT, () => {
  console.log(`🚀 server listening at http://localhost:${PORT}`);
});
