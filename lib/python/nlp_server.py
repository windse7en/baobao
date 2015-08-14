# -*- coding: utf-8 -*-
# 1.    pip install virtualenv
# 2.    pip install flask, jieba
# 3.    python file_name.py

from flask import Flask, request

import jieba.posseg as pseg
import logging, re
import json
from datetime import datetime

from logging.handlers import RotatingFileHandler

app = Flask(__name__)

@app.route('/', methods=['POST'])
def hello_world():
    try:
        rx = '[",]' # use regex to remove all the sign
        lines, results, i = request.data.split('\n'), [], 0
        for line in lines:
            i += 1
            s_list, result = pseg.cut(re.sub(rx, '', line)), []
            for word, flag in s_list:
                print('%s %s' % (word, flag))
                result.append({'word':word, 'flag':flag})
            results.append(result)
        return json.dumps(results)
    except:
        app.logger.error(str(datetime.now()) + " Error for the input: " + request.data)

if __name__ == '__main__':
    handler = RotatingFileHandler('log/foo.log', maxBytes=10000, backupCount=1)
    handler.setLevel(logging.INFO)
    app.logger.addHandler(handler)
    app.run(host='0.0.0.0', debug=True )
