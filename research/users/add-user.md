# add-user

Create the user:

- `useradd -s $(which bash) -G sudo -u 1001 -m mattjmcnaughton`
- `passwd mattjmcnaughton` to change the passwd.
- `scp public_ssh_key` and add to ~/.ssh/authorized_keys` and `chmod 0600 ~/.ssh/authorized_keys`
- turn off password ssh => set `PasswordAuthentication no` and `sudo systemctl restart ssh.service`
- Delete the `ubuntu` user => `deluser ubuntu`

