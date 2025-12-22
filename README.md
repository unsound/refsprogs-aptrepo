refsprogs APT repository
========================

This is an APT repository for the refsprogs project, allowing convenient updates through `apt` whenever refsprogs is updated.

To use it, first import the public key used to sign the repository:

`curl -L 'https://github.com/unsound/refsprogs-aptrepo/raw/refs/heads/main/catacombae.gpg' | sudo sh -c 'cat > /usr/share/keyrings/catacombae.gpg'`

Then add the repository to your `sources.list`. The URL will differ depending on your operating system version:
- If you are on Ubuntu 20.04 to 25.04 or Debian 10 to 12, use the 'buster' distribution:
  `sudo sh -c 'echo "deb [signed-by=/usr/share/keyrings/catacombae.gpg] https://raw.githubusercontent.com/unsound/refsprogs-aptrepo/refs/heads/main buster main" >> /etc/apt/sources.list'`
- If you are on Ubuntu 25.10, Debian 13 or higher use the 'trixie' distribution:
  `sudo sh -c 'echo "deb [signed-by=/usr/share/keyrings/catacombae.gpg] https://raw.githubusercontent.com/unsound/refsprogs-aptrepo/refs/heads/main trixie main" >> /etc/apt/sources.list'`

After completing the above steps you can install `refsprogs` through `apt`: `sudo apt install refsprogs`
