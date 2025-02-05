    
    -- values_data.[time] is a string in the format PT...S (P: Period, T: Time, S: Seconds)
    -- This works with decimal values and with any combination of hours, minutes and seconds
    -- Examples: PT1H, PT1M, PT1S, PT1.5H, PT1.5M, PT1.5S, PT1H30M, PT1H30S, PT1M30S, PT1H30M30S
    -- Returns the total time in seconds
    -- Works with SQL Server. For other databases, you may need to adjust the syntax
    -- Extract the time value (PT...S format)
    values_data.[time] AS ptos_time,
 
    COALESCE(
        -- Extract hours if 'H' exists
        CASE
            WHEN CHARINDEX('H', values_data.[time]) > 0
            THEN TRY_CAST(REPLACE(
                LEFT(values_data.[time], CHARINDEX('H', values_data.[time]) - 1), 'PT', ''
            ) AS INT) * 3600
            ELSE 0
        END, 0
    ) +
    COALESCE(
        -- Extract minutes if 'M' exists (after 'T' and before 'S' or 'H')
        CASE
            WHEN CHARINDEX('M', values_data.[time]) > 0
            THEN TRY_CAST(
                SUBSTRING(values_data.[time],
                        CASE
                            WHEN CHARINDEX('H', values_data.[time]) > 0
                            THEN CHARINDEX('H', values_data.[time]) + 1
                            ELSE CHARINDEX('T', values_data.[time]) + 1
                        END,
                        CHARINDEX('M', values_data.[time]) -
                        (CASE
                            WHEN CHARINDEX('H', values_data.[time]) > 0
                            THEN CHARINDEX('H', values_data.[time]) + 1
                            ELSE CHARINDEX('T', values_data.[time]) + 1
                        END)
                ) AS INT
            ) * 60
            ELSE 0
        END, 0
    ) +
    COALESCE(
        -- Extract seconds if 'S' exists (including decimals)
        CASE
            WHEN CHARINDEX('S', values_data.[time]) > 0
            THEN TRY_CAST(
                REPLACE(
                    SUBSTRING(values_data.[time],
                            CASE
                                WHEN CHARINDEX('M', values_data.[time]) > 0
                                THEN CHARINDEX('M', values_data.[time]) + 1
                                WHEN CHARINDEX('H', values_data.[time]) > 0
                                THEN CHARINDEX('H', values_data.[time]) + 1
                                ELSE CHARINDEX('T', values_data.[time]) + 1
                            END,
                            LEN(values_data.[time])
                    ), 'S', ''
                ) AS FLOAT
            )
            ELSE 0
        END, 0
    ) AS time_seconds,
 
 