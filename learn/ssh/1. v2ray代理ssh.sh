
Host myserver
    HostName 
    User ecs-user
    IdentityFile ~/.ssh/id_ed25519
    IdentitiesOnly yes
    ProxyCommand nc -X 5 -x 127.0.0.1:10808 %h %p

