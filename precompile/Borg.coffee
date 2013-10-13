Logger = require './Logger'
Ssh    = require './Ssh'
async = require 'async2'

# TODO: support:
# borg cmd --sudo u:p@localhost:223 -- test blah
# borg cmd --sudo u:p@localhost:223 test blah

module.exports =
class Borg
  constructor: (cmd) ->
    nodes = []
    options = {}
    args = []
    last_option = null
    for arg in process.argv.slice(3)
      if match = arg.match(/^(.+?)(:(.+))?@(.+?)(:(.+))?$/)
        nodes.push user: match[1], pass: match[3], host: match[4], port: match[6]
      else
        if arg[0] is '-'
          options[last_option = arg.split(/^--?/)[1]] = true
        else if last_option isnt null
          options[last_option] = arg
          last_option = null
        else
          args.push arg
    if options.sudo then options.c = "sudo #{options.c}" # TODO: double-escape quotes, multiple commands, etc.
    #console.log cmd: cmd, nodes: nodes, options: options, args: args
    flow = new async
    for own k, node of nodes
      ((node) ->
        flow.parallel (next) ->
          Borg[cmd] node, options, next
      )(node)
    flow.go (err, results...) ->
      if err
        #process.stderr.write err+"\n"
        Logger.out 'aborted with error.'
        #process.exit 1
      else
        Logger.out 'all done.'
        #process.exit 0

  @rekey: (node, options, cb) ->

  @assimilate: (node, options, cb) ->
    new Ssh user: node.user, pass: node.pass, host: node.host, port: node.port, cmd: options.c, (err, ssh) ->
      Logger.out host: node.host, 'were in!'
      #if err then return Logger.out host: node.host, type: 'err', err
      cb()

  @cmd: (node, options, cb) ->
    #console.log arguments
    new Ssh user: node.user, pass: node.pass, host: node.host, port: node.port, cmd: options.c, (err, ssh) ->
      Logger.out host: node.host, 'were in!'
      #if err then return Logger.out host: node.host, type: 'err', err
      ssh.cmd options.cmd, (err) ->
        ssh.close()
        cb()
