import time

delay_ms = 1000

def app(environ, start_response):
    """Simplest possible application object"""
    data = b'Hello, World!\n'
    status = '200 OK'
    response_headers = [
        ('Content-type', 'text/plain'),
        ('Content-Length', str(len(data)))
    ]

    time.sleep(delay_ms / 1000)
    start_response(status, response_headers)
    return iter([data])