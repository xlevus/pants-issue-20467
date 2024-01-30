import time
import sys
from threading import Thread, get_native_id

import ssl


def get_context():
    time.sleep(1)
    print(f"Getting ssl context for thread {get_native_id()}")
    ssl.create_default_context()


def main():
    threads = []

    for x in range(1):
        threads.append(Thread(target=get_context))

    [t.start() for t in threads]

    [t.join() for t in threads]


if __name__ == '__main__':
    if "import-first" in sys.argv:
        ssl.create_default_context()

    main()