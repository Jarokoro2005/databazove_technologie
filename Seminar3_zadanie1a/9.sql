CREATE OR REPLACE PROCEDURE apply_regional_discount(p_region_name VARCHAR, p_discount_rate DECIMAL)
LANGUAGE plpgsql
AS $$
BEGIN
    UPDATE orders
    SET sales = sales * (1 - p_discount_rate)
    WHERE customer_id IN (
        SELECT customer_id
        FROM customers
        WHERE region = p_region_name
    );

    RAISE NOTICE 'Aplikovaná zľava % na objednávky zákazníkov z regiónu %.', p_discount_rate, p_region_name;
END;
$$;

/*Zobrazenie*/
CALL apply_regional_discount('West', 0.10);
