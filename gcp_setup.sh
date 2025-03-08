#!/bin/bash

gcloud iam service-accounts create debezium-sample
gcloud pubsub topics create sample.public.users
gcloud pubsub subscriptions create my-sub --topic=sample.public.users
gcloud pubsub topics add-iam-policy-binding sample.public.users --member='serviceAccount:debezium-sample@gsheet-355401.iam.gserviceaccount.com' --role='roles/pubsub.publisher'

gcloud pubsub topics create sample.public.debezium_signal
gcloud pubsub subscriptions create signal-sub --topic=sample.public.debezium_signal
gcloud pubsub topics add-iam-policy-binding sample.public.debezium_signal --member='serviceAccount:debezium-sample@gsheet-355401.iam.gserviceaccount.com' --role='roles/pubsub.publisher'

gcloud pubsub topics create sample.public.comments
gcloud pubsub subscriptions create comments-sub --topic=sample.public.comments
gcloud pubsub topics add-iam-policy-binding sample.public.comments --member='serviceAccount:debezium-sample@gsheet-355401.iam.gserviceaccount.com' --role='roles/pubsub.publisher'

gcloud iam service-accounts keys create service-account.json --iam-account='debezium-sample@gsheet-355401.iam.gserviceaccount.com'