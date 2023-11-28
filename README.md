# chart-ccd-def-cleanup

Remove old case types from CCD definition store and CCD data store once a PR has been cleaned up.

```
ccd-def-cleanup:
  enabled: true
  change_id: ${CHANGE_ID}
  case_type_ids:
    - NFD
    - NO_FAULT_DIVORCE_BulkAction
```

Will remove `NFD-<PR_NUMBER>` and `NO_FAULT_DIVORCE_BulkAction-<PR_NUMBER>`.
