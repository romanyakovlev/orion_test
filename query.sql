SELECT * 
FROM public.junction_application_plan 
	JOIN public.plans
		ON public.junction_application_plan.plan_id = public.plans.id
	JOIN public.applications
		ON public.junction_application_plan.application_id = public.applications.id;