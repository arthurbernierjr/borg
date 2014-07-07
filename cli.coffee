switch cmd = process.argv[2]
  when 'rekey', 'assimilate', 'cmd'
    Borg = require './index'
    Borg cmd
  when 'test'
    (require './Test')()
  when '-V', '--version', 'version'
    pkg = require '../package.json'
    console.log """
    borg v#{pkg.version}

    """
  #when '-h', '--help', 'help'
  else
    switch process.argv[3]
      when 'rekey'
        console.log """
        Usage: borg rekey [options] <user:password@host ...>

        Options:

          -i  identity file path

        """
      when 'assimilate'
        console.log """
        Usage: borg assimilate [options] <user:password@host ...>

        Options:

          -r, --role  assign each node the following role

        """
      when 'cmd'
        console.log """
        Usage: borg cmd options] <user:password@host ...> -- <shell_command>

        """
      when 'test'
        switch process.argv[4]
          when 'list' then 1
          #when 'create'
          #when 'assimilate'
          #when 'use'
          #when 'login'
          #when 'destroy'
          else
            console.log """
            Usage: borg test <subcommand>

            Subcommands:

              list                list all machines
              create              create localhost virtualbox machine
              assimilate          assimilate the localhost vm
              use                 test successful assimilation
              login               open ssh session
              destroy             delete localhost vm

            """
      else
        console.log """
        Usage: borg <command> [options] <host ...>

        Commands:

          rekey       copy ssh public key to authorized_hosts on remote host(s)
          assimilate  bootstrap and cook remote host(s)
          cmd         bulk execute command on remote host(s)
          test        simulate assimilation on localhost

        Options:

          -h, --help     output usage information
          -V, --version  output version number

        """