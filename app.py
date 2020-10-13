import time

import redis
from flask import Flask, abort, jsonify

app = Flask(__name__)
cache = redis.Redis(host='redis', port=6379)
fail_count = 1


def get_hit_count():
    retries = 5
    while True:
        try:
            return cache.incr('hits')
        except redis.exceptions.ConnectionError as exc:
            if retries == 0:
                raise exc
            retries -= 1
            time.sleep(0.5)


@app.route('/')
def hello():
    count = get_hit_count()
    return 'Hello World! I have been seen {} times.\n'.format(count)


@app.route('/health')
def health():
    global fail_count
    fail_count += 1
    if fail_count > 5:
        abort(500, description="Resource not found")
    result = {"success": True}
    return jsonify(result)
