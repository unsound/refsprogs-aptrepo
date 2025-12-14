refsprogs APT repository
========================

This is an APT repository for the refsprogs project, allowing convenient updates through `apt` whenever refsprogs is updated.

To use it, first import the public key used to sign the repository:

`curl -L 'https://github.com/unsound/refsprogs-aptrepo/raw/refs/heads/main/catacombae.gpg' | sudo sh -c 'cat > /usr/share/keyrings/catacombae.gpg'`

Then add the repository to your `sources.list`:

`sudo sh -c 'echo "deb [signed-by=/usr/share/keyrings/catacombae.gpg] https://raw.githubusercontent.com/unsound/refsprogs-aptrepo/refs/heads/main main main" >> /etc/apt/sources.list'`

After which you can install `refsprogs` through `apt`: `sudo apt install refsprogs`
