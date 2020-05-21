from flask import Flask, render_template, flash, redirect, render_template_string, request, session
import flask

from flask_sqlalchemy import SQLAlchemy

app = Flask(__name__)
app.config['SECRET_KEY'] = 'you-will-never-guess'

db = SQLAlchemy(app, session_options={'autocommit':True})