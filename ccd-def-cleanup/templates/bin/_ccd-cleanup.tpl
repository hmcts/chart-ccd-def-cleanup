#!/usr/bin/env sh
set -ex

echo "Removing Case Type IDs for change id {{ .Values.change_id }} and case type ids {- join "," .Values.case_type_ids }}"

curl -v -k -X DELETE \
  {{tpl $.Values.api.ccdDefStore $ }}/api/testing-support/cleanup-case-type/{{ .Values.change_id }}/?caseTypeIds={- join "," .Values.case_type_ids }}


curl -v -k -X DELETE \
  {{tpl $.Values.api.ccdDataStore $ }}/internal/testing-support/cleanup-case-type/{{ .Values.change_id }}/?caseTypeIds={- join "," .Values.case_type_ids }}