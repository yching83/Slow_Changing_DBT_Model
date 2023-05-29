{% snapshot scd_opportunity %} 

{{
    config(
      unique_key = 'id',
      target_schema = 'gms',
      strategy ='timestamp',
      updated_at = 'system_modstamp',
    )
}}

select 
opp.ID
,opp.IS_DELETED
,opp.ACCOUNT_ID
,opp.RECORD_TYPE_ID
,opp.NAME
,opp.DESCRIPTION
,opp.STAGE_NAME
,try_to_date(opp.DEFERRAL_DATE_C) as DEFERRAL_DATE_C
,try_to_date(opp.BUSINESS_REVIEW_DATE_C) as BUSINESS_REVIEW_DATE_C
,try_to_date(opp.GRADUATION_DATE_C) as GRADUATION_DATE_C

from {{ source( 'salesforce', 'opportunity') }} opp
{% endsnapshot %}
