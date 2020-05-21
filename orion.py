from flask import Flask, render_template, flash, redirect, render_template_string, request, session
from forms import FirstStepForm, SecondStepForm

from werkzeug.datastructures import MultiDict

from flask_sqlalchemy import SQLAlchemy
from app import app, db
from sql_requests import get_data_from_sql, write_application_to_db, get_script_text_by_id

import argparse

@app.route('/')
def hello():

    return render_template('base.html', title='Sign In')

@app.route('/1', methods=['POST', 'GET'])
def first_step():
	if request.method == 'GET':
	    if session.get('first_step'):
	        print(session['first_step'])
	        form = FirstStepForm(MultiDict(session['first_step']))
	    else:
	        form = FirstStepForm()
	    script_text = get_script_text_by_id(1)
	    return render_template('1.html', title='1', form=form, text=script_text)
	else:
	    session['first_step'] = request.form
	    return redirect('/2')

@app.route('/2', methods=['POST', 'GET'])
def second_step():
	if request.method == 'GET':
		if not session.get('first_step'):
			return render_template_string(
					'''
					{% extends "base.html" %}

					{% block content %}
					    <h1>Начните анкетирование с первого шага</h1>

					{% endblock %}
					'''
			)
		if session.get('second_step'):
			print(session.get('second_step'))
			form = SecondStepForm(MultiDict({'plans': session['second_step']}))
		else:
			form = SecondStepForm()
		script_text = get_script_text_by_id(2)
		return render_template('2.html', title='2', form=form, text=script_text)
	else:
		session['second_step'] = request.form.getlist('plans')
		return redirect('/3')

@app.route('/3', methods=['POST', 'GET'])
def thirds_step():
	if request.method == 'GET':
		if not session.get('first_step') and not session.get('second_step'):
			return render_template_string(
					'''
					{% extends "base.html" %}

					{% block content %}
					    <h1>Начните анкетирование с первого шага</h1>

					{% endblock %}
					'''
			)
		else:
			data_dict = {**session['first_step'], **{'plans': session['second_step']}}
			find_data =  get_data_from_sql(data_dict)
			script_text = get_script_text_by_id(3)
			return render_template('3.html', title='3', data=find_data, text=script_text)
	else:
		write_application_to_db({**session['first_step'], **{'plans': session['second_step']}})
		return redirect('/4')

@app.route('/4', methods=['POST', 'GET'])
def final_step():
	script_text = get_script_text_by_id(4)
	return render_template('4.html', title='4', text=script_text)

@app.route('/clear_session', methods=['POST', 'GET'])
def clear_session():
	session.clear()
	return redirect('/')

if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument('-u', '--url', help='подключение к бд', required=True)
    args = vars(parser.parse_args())
    app.config['SQLALCHEMY_DATABASE_URI'] = args['url']

    app.run()