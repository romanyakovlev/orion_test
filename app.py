from flask import Flask, render_template, flash, redirect, render_template_string, request, session
import flask

from flask_sqlalchemy import SQLAlchemy

app = Flask(__name__)
app.config['SECRET_KEY'] = 'you-will-never-guess'
app.config['SQLALCHEMY_DATABASE_URI'] = 'postgresql://postgres:postgres@localhost/orion_test'

db = SQLAlchemy(app, session_options={'autocommit':True})