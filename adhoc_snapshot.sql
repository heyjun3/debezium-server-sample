INSERT INTO public.debezium_signal (id, type, data) 
values ('ad-hoc-4',   
    'execute-snapshot',  
    '{"data-collections": ["public.users"], 
    "type":"blocking"}'); 
