# Testing user load

This script adds users to a JupyterHub instance to test the load. It was written to test the load on various Google Cloud configurations. To use:

```bash
$ python test-load.py --n=<NUM USERS TO ADD> --address=<HUB LOCATION> --startid=<START USER ID>
```

Example to add 20 users to a hub starting with `user1`:

```bash
$ python test-load.py --n=20 --address=http://xxx.xxx.xxx.xx --startid=1
```

The script will add users with the name `user<IDNUM>`, incrementing by 1 beginning with the `startid` provided.

### Dependencies

- Selenium

```bash
$ pip install selenium
```

- PhantomJS driver

```bash
$ brew install phantomjs
```