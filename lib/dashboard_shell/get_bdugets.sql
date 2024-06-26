SELECT
    b.id as id,
    b.name as name,
    df.format AS date_format,
    currency_formats.id AS currency,
    o.email AS owner,
    b.created,
    b.updated
FROM
    budgets b
    LEFT JOIN date_formats df ON b.date_format= df.id
    LEFT JOIN currency_formats currency_formats ON b.id = currency_formats.id
    LEFT JOIN users o ON b.owner = o.id;
