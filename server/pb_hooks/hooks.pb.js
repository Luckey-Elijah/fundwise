/// <reference path="../pb_data/types.d.ts" />

onRecordBeforeCreateRequest((e) => {
  console.log(e.httpContext);
  console.log(e.record);
  console.log(e.uploadedFiles);
});

onRecordBeforeCreateRequest((e) => {
  console.log(e.httpContext);
  console.log(e.record);
  console.log(e.uploadedFiles);
});
