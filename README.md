This image will start 'xlogo' on your local display.  You will need to
provide XAUTH credentials in the `XAUTH_CREDS` environment variable.
You can find your `xauth` credentials by running `xauth list`:

    $ xauth list
    myhostname/unix:0  MIT-MAGIC-COOKIE-1  f0f9e41b11c4e1874c0ff1357300a5f9

And then run:

    docker run \
      -e XAUTH_CREDS="myhostname/unix:0  MIT-MAGIC-COOKIE-1  f0f9e41b11c4e1874c0ff1357300a5f9" \
      -e DISPLAY=:0 --net host larsks/xlogo

Notice that `--net host`, this is critical for access to the X display
to work correctly.  This runs the container in the host's global
network namespace.

**UPDATE**

You can make this work with `--net host` like this:

    docker run \
      -e XAUTH_CREDS="pk115wp-lkellogg/unix:0  MIT-MAGIC-COOKIE-1  f0f9e41b11c5dd566dfd01357300a5f9" \
      -e DISPLAY=:0  \
      --hostname $(hostname) \
      -v /tmp/.X11-unix/:/tmp/.X11-unix/ larsks/xlogo
