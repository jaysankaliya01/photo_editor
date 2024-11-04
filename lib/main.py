from flask import Flask, flash, request, redirect, url_for ,render_template
from werkzeug.utils import secure_filename
UPLOAD_FOLDER = '/static/Images'
ALLOWED_EXTENSIONS = {'txt', 'png', 'jpg', 'jpeg', 'gif'}
app = Flask(__name__)
app.config['UPLOAD_FOLDER'] = UPLOAD_FOLDER
app.config['MAX_CONTENT_LENGTH'] = 16 * 1000 * 1000


def home():
    return render_template()

if __name__ == '__main__':
    app.run(debug=True)