# mattjmcnaughton.mqtt

Role for installing Mqtt on a host.

## Account creation

Note, automating account creation has been a huge pain. The following were not
successful:

- Using `mosquitto_passwd` in batch mode.
- Using `mosquitto_passwd` in non-batch mode (it overwrote the file each time).
- Upgrading a plaintext passwd file via `mosquitto_passwd -U`.
- Pre-generating the encrypted `passwd` contents via `mkpasswd --method=SHA-512`.

Ultimately, the quickest method is to run `mosquitto_passwd -c
/tmp/scratch_passwd username`, and then copy the results into `hashed_password`.
We still specify `password` as well so that we have a record of it.
