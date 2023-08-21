#### Imported .bashrc from VSCode environment ####
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi
#### End of Import ####

export PATH=$PATH:/opt/bb/bin/code-server/lib/vscode/bin/remote-cli:/opt/bb/sbin:/opt/bb/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/root/bin
