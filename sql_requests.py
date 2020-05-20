
from app import db
from zope.sqlalchemy import mark_changed

def get_data_from_sql(data_dict):


	data_dict['city_name'] = db.session.execute(
		'SELECT id, name FROM public.cities WHERE id={};'.format(data_dict['city'])
	).first()[1]

	data_dict['cause_name'] = db.session.execute(
		'SELECT id, text FROM public.causes WHERE id={};'.format(data_dict['cause'])
	).first()[1]
	print(data_dict['plans'])
	if len(data_dict['plans']) != 1:
		data_dict['plans_names'] = [plan_name for _, plan_name in db.session.execute(
			'SELECT id, text FROM public.plans WHERE id in {};'.format(tuple (data_dict['plans']))
		)]
	else:
		data_dict['plans_names'] = [plan_name for _, plan_name in db.session.execute(
			'SELECT id, text FROM public.plans WHERE id={};'.format(data_dict['plans'][0])
		)]

	return data_dict

def write_application_to_db(data_dict):

	application_id = db.session.execute(
	''' 
			INSERT INTO public.applications(
			id, fio, adres, "number", comment, city_id, cause_id)
			VALUES ({}, '{}', '{}', {}, '{}', {}, {}) RETURNING id;

	'''.format(	
			"DEFAULT", data_dict['fio'], data_dict['adress'], data_dict['number'], 
			data_dict['comment'], data_dict['city'], data_dict['cause'],
	)).first()[0]

	for plan_id in data_dict['plans']:
		print('''
				INSERT INTO public.junction_application_plan(
				plan_id, application_id)
				VALUES ({}, {});
			'''.format(plan_id, application_id))

		db.session.execute(
			'''
	INSERT INTO public.junction_application_plan(
		plan_id, application_id)
		VALUES ({}, {});
			'''.format(plan_id, application_id)
		)

def get_script_text_by_id(id):
	return db.session.execute('''
	        	SELECT id, text
				FROM public.script_texts WHERE id = {};
	        	'''.format(id)).first()[1]