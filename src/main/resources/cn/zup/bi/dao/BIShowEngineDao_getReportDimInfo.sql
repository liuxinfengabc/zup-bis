SELECT 
	bd.BIZ_TABLE_NAME AS DIM_TABLE, bd.DRILL_TYPE, bd.DRILL_INFO, bd.ID_FIELD, bd.TEXT_FIELD, 
	btf.FIELD_TITLE, btf.FIELD_TYPE, btf.FIELD_NAME, bt.BIZ_TABLE_NAME AS TOPIC_TABLE, bt.TOPIC_NAME,
	brf.FIELD_LOCATION, brf.DIM_ORDER
FROM bi_topic_field btf 
JOIN bi_dim bd ON btf.DIM_ID = bd.DIM_ID JOIN bi_topic bt ON btf.TOPIC_ID = bt.TOPIC_ID 
JOIN bi_report_field brf ON btf.FIELD_ID = brf.FIELD_ID
WHERE 1=1 
<#if ids?exists>
	AND btf.FIELD_ID IN (${ids})
</#if>


AND brf.REPORT_ID = ${report_Id}
AND brf.DISPLAY = 1
GROUP BY bd.BIZ_TABLE_NAME, bd.DRILL_TYPE, bd.DRILL_INFO, bd.ID_FIELD, bd.TEXT_FIELD, 
btf.FIELD_TITLE, btf.FIELD_TYPE, btf.FIELD_NAME, bt.BIZ_TABLE_NAME, bt.TOPIC_NAME 
	ORDER BY brf.FIELD_LOCATION,
 brf.DIM_ORDER ;