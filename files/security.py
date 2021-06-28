from flask import request

class Security:
    def __init__(self):
        return None

    def getUserIP(self):
        if request.environ.get('HTTP_X_REAL_IP') is not None:
            return request.environ.get('HTTP_X_REAL_IP')
        elif request.environ.get('HTTP_X_FORWARDED_FOR') is not None:
            return request.environ.get('HTTP_X_FORWARDED_FOR')
        else:
            return request.remote_addr

    def getUserReferrer(self):
        return request.base_url
