reset-table:
	rails db:drop db:create db:migrate db:migrate

seed:
	rails db:seed

reset:
	make reset-table
	make seed