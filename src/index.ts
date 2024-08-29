import Fastify from 'fastify'
const server = Fastify({
  logger: true
})

server.get('/', function (request, reply) {
  reply.send({ hello: 'world' })
})

server.listen({ port: Number(process.env.PORT), host: '0.0.0.0' }, function (err) {
  if (err) {
    server.log.error(err)
    process.exit(1)
  }
})
