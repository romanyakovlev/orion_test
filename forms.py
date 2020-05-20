from flask_wtf import FlaskForm
from wtforms import IntegerField, TextAreaField, SelectField, StringField, PasswordField, BooleanField, SubmitField, SelectMultipleField
from wtforms.validators import DataRequired, NumberRange
from app import db

class FirstStepForm(FlaskForm):

    city = SelectField('Город', choices=[], validators=[DataRequired()])
    fio = StringField('ФИО', validators=[DataRequired()])
    adress = StringField('Адрес', validators=[DataRequired()])
    cause = SelectField('Причина обращения', choices=[], validators=[DataRequired()])
    number = IntegerField('Телефон', validators=[DataRequired(), NumberRange(max=100000000000)])
    comment = TextAreaField('Комментарий')
    submit = SubmitField('Подтвердить')

    def __init__(self, *args, **kwargs):
        super(FirstStepForm, self).__init__(*args, **kwargs)
        choices_city = [[str(id), city] for id, city in db.session.execute('SELECT id, name FROM public.cities;')]
        self.city.choices = choices_city

        choices_cause = [[str(id), city] for id, city in db.session.execute('SELECT id, text FROM public.causes;')]
        self.cause.choices = choices_cause


class SecondStepForm(FlaskForm):

    plans = SelectMultipleField('Планы', choices=[], validators=[DataRequired()])
    submit = SubmitField('Подтвердить')

    def __init__(self, *args, **kwargs):
        super(SecondStepForm, self).__init__(*args, **kwargs)
        choices_plans = [[str(id), city] for id, city in db.session.execute('SELECT id, text FROM public.plans;')]
        self.plans.choices = choices_plans