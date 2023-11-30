#!/usr/bin/env sh
set -ex

echo "Removing Case Type IDs for change id {{ .Values.change_id }} and case type ids {- join "," .Values.case_type_ids }}"

defResponseCode=$(curl -s -o /dev/null -w "%{http_code}" -k -I -X DELETE \
  {{tpl $.Values.api.ccdDefStore $ }}/api/testing-support/cleanup-case-type/{{ .Values.change_id }}/?caseTypeIds={{ join "," .Values.case_type_ids }})

# A 404 from this test is ok - we need to improve it to add a case type first
if [ "$defResponseCode"  != "404" ]; then
    echo "================================================================"
    echo "Unexpected response code from definition store ${defCode}"
    echo "================================================================"
    exit 1
fi;

dataResponseCode=$(curl -s -o /dev/null -w "%{http_code}" -k -I -X DELETE \
  {{tpl $.Values.api.ccdDataStore $ }}/testing-support/cleanup-case-type/{{ .Values.change_id }}/?caseTypeIds={{ join "," .Values.case_type_ids }})

if [ "$dataResponseCode"  != "200" ]; then
    echo "================================================================"
    echo "Unexpected response code from definition store ${$defResponseCode}"
    echo "================================================================"
    exit 1
fi;