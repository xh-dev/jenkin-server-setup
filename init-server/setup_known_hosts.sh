setup_known_hosts(){
  export ip=$1 
  echo "Setup known_hosts for $ip" 
  ssh-keygen -R $ip 
  ssh-keyscan -H $ip > ~/.ssh/known_hosts 
}
