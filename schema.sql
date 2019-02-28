CREATE TABLE "invoices_created" (
	id VARCHAR NULL,
	account_code VARCHAR NULL,
	account_name VARCHAR NULL,
	invoice_number DECIMAL,
	subscription_id VARCHAR NULL,
	plan_code VARCHAR NULL,
	coupon_code VARCHAR NULL,
	total DECIMAL,
	subtotal DECIMAL,
	tax_amount DECIMAL,
	currency VARCHAR NULL,
	date DATE,
	status VARCHAR NULL,
	closed_at DATE,
	purchase_country VARCHAR NULL,
	vat_number VARCHAR NULL,
	line_item_total DECIMAL,
	line_item_description VARCHAR NULL,
	line_item_origin VARCHAR NULL,
	line_item_product_code VARCHAR NULL,
	line_item_accounting_code VARCHAR NULL,
	line_item_start_date DATE,
	line_item_end_date DATE,
	net_terms VARCHAR NULL,
	po_number VARCHAR NULL,
	collection_method VARCHAR NULL,
	line_item_uuid VARCHAR NULL,
	tax_type VARCHAR NULL,
	tax_region VARCHAR NULL,
	tax_rate VARCHAR NULL,
	discount DECIMAL,
	original_adjustment_uuid VARCHAR NULL,
	modified_at DATE,
	invoice_type VARCHAR NULL,
	original_invoice_number VARCHAR NULL
);


CREATE TABLE "invoices_summary_created" (
	id VARCHAR NULL,
	invoice_number DECIMAL,
	billed_date DATE,
	due_on VARCHAR NULL,
	closed_at DATE,
	status VARCHAR NULL,
	net_terms VARCHAR NULL,
	collection_method VARCHAR NULL,
	account_code VARCHAR NULL,
	account_name VARCHAR NULL,
	account_company VARCHAR NULL,
	account_line1 VARCHAR NULL,
	account_line2 VARCHAR NULL,
	account_city VARCHAR NULL,
	account_state VARCHAR NULL,
	account_zip VARCHAR NULL,
	account_country VARCHAR NULL,
	vat_number VARCHAR NULL,
	po_number VARCHAR NULL,
	coupon_code VARCHAR NULL,
	currency VARCHAR NULL,
	invoice_total DECIMAL,
	invoice_subtotal DECIMAL,
	tax_amount DECIMAL,
	tax_type VARCHAR NULL,
	tax_region VARCHAR NULL,
	tax_rate VARCHAR NULL,
	credit_to_account DECIMAL,
	recovery_reason VARCHAR NULL,
	modified_at DATE,
	invoice_type VARCHAR NULL,
	original_invoice_number VARCHAR NULL,
	ship_address_name VARCHAR NULL,
	ship_address_line1 VARCHAR NULL,
	ship_address_line2 VARCHAR NULL,
	ship_address_city VARCHAR NULL,
	ship_address_state VARCHAR NULL,
	ship_address_zip VARCHAR NULL,
	ship_address_country VARCHAR NULL,
	ship_address_phone VARCHAR NULL,
	invoice_doc_type VARCHAR NULL,
	invoice_balance VARCHAR NULL,
	invoice_balance_modified_at DATE,
	invoice_discount DECIMAL,
	invoice_subtotal_before_discounts DECIMAL,
	invoice_refundable_amount VARCHAR NULL
);


CREATE TABLE "revenue_schedules_created" (
	revenue_schedule_id DECIMAL,
	invoice_number DECIMAL,
	invoice_date DATE,
	invoice_state VARCHAR NULL,
	account_code VARCHAR NULL,
	accounting_code VARCHAR NULL,
	line_item_id VARCHAR NULL,
	line_item_start_date DATE,
	line_item_end_date DATE,
	origin VARCHAR NULL,
	days DECIMAL,
	amount_per_day DECIMAL,
	total_amount DECIMAL,
	currency VARCHAR NULL,
	schedule_type VARCHAR NULL,
	revenue_recognition_date DATE,
	deferred_revenue_balance DECIMAL,
	arrears DECIMAL,
	february_19 DECIMAL,
	march_19 DECIMAL,
	april_19 DECIMAL,
	may_19 DECIMAL,
	june_19 DECIMAL,
	july_19 DECIMAL,
	august_19 DECIMAL,
	september_19 DECIMAL,
	october_19 DECIMAL,
	november_19 DECIMAL,
	december_19 DECIMAL,
	january_20 DECIMAL,
	future_revenue DECIMAL,
	invoice_origin VARCHAR NULL
);


CREATE TABLE "transactions_created" (
	account_code VARCHAR NULL,
	name VARCHAR NULL,
	transaction_id VARCHAR NULL,
	type VARCHAR NULL,
	amount DECIMAL,
	tax_amount DECIMAL,
	currency VARCHAR NULL,
	date DATE,
	status VARCHAR NULL,
	message VARCHAR NULL,
	test VARCHAR NULL,
	cc_type VARCHAR NULL,
	cvv_result VARCHAR NULL,
	avs_result VARCHAR NULL,
	avs_result_postal VARCHAR NULL,
	avs_result_street VARCHAR NULL,
	reference DECIMAL,
	approval_code VARCHAR NULL,
	description VARCHAR NULL,
	state VARCHAR NULL,
	country VARCHAR NULL,
	ip_address_country VARCHAR NULL,
	original_transaction_id VARCHAR NULL,
	invoice_id VARCHAR NULL,
	subscription_id VARCHAR NULL,
	po_number VARCHAR NULL,
	collection_method VARCHAR NULL,
	transaction_gateway_type VARCHAR NULL,
	modified_at DATE,
	origin VARCHAR NULL,
	gateway_error_codes VARCHAR NULL,
	payment_method VARCHAR NULL,
	collected_at DATE,
	fraud_decision VARCHAR NULL,
	fraud_score VARCHAR NULL,
	fraud_message VARCHAR NULL,
	failure_type VARCHAR NULL
);


CREATE TABLE "adjustments_created" (
	uuid VARCHAR NULL,
	account_code VARCHAR NULL,
	subscription_id VARCHAR NULL,
	invoice_id VARCHAR NULL,
	adjustment_status VARCHAR NULL,
	adjustment_type VARCHAR NULL,
	adjustment_created_at DATE,
	adjustment_start_at DATE,
	adjustment_end_at DATE,
	adjustment_description VARCHAR NULL,
	adjustment_quantity DECIMAL,
	adjustment_currency VARCHAR NULL,
	adjustment_amount DECIMAL,
	adjustment_total DECIMAL,
	adjustment_taxable VARCHAR NULL,
	adjustment_discount DECIMAL,
	adjustment_tax DECIMAL,
	adjustment_accounting_code VARCHAR NULL,
	adjustment_product_code VARCHAR NULL,
	adjustment_tax_code VARCHAR NULL,
	adjustment_origin VARCHAR NULL,
	tax_type VARCHAR NULL,
	tax_region VARCHAR NULL,
	tax_rate VARCHAR NULL,
	tax_amount VARCHAR NULL,
	country_juris VARCHAR NULL,
	country_rate VARCHAR NULL,
	country_amount VARCHAR NULL,
	state_juris VARCHAR NULL,
	state_rate VARCHAR NULL,
	state_amount VARCHAR NULL,
	county_juris VARCHAR NULL,
	county_rate VARCHAR NULL,
	county_amount VARCHAR NULL,
	city_juris VARCHAR NULL,
	city_rate VARCHAR NULL,
	city_amount VARCHAR NULL,
	special_juris VARCHAR NULL,
	special_rate VARCHAR NULL,
	special_amount VARCHAR NULL,
	adjustment_refund VARCHAR NULL,
	original_adjustment_uuid VARCHAR NULL,
	invoice_number DECIMAL,
	invoice_state VARCHAR NULL,
	adjustment_coupon_code VARCHAR NULL,
	invoice_billed_date DATE,
	invoice_closed_at DATE,
	invoice_net_terms VARCHAR NULL,
	invoice_po_number VARCHAR NULL,
	invoice_collection_method VARCHAR NULL,
	invoice_type VARCHAR NULL,
	account_name VARCHAR NULL,
	account_country VARCHAR NULL,
	account_vat_number VARCHAR NULL,
	adjustment_plan_code VARCHAR NULL,
	original_invoice_number VARCHAR NULL,
	invoice_due_on VARCHAR NULL,
	adjustment_subtotal DECIMAL,
	adjustment_credit_reason_code VARCHAR NULL,
	adjustment_refundable_amount VARCHAR NULL
);