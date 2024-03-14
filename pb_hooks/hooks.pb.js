/// <reference path="../pb_data/types.d.ts" />

// fires for every db model
// onModelBeforeCreate(
//   (e) => {
//     console.log(e.model);
//   },
//   ["users"]
// );

// fires for every collection
onRecordBeforeCreateRequest((e) => {
  console.log(e.httpContext);
  console.log(e.record);
  console.log(e.uploadedFiles);
});

// fires only for "users" and "articles" collections
onRecordBeforeCreateRequest((e) => {
  console.log(e.httpContext);
  console.log(e.record);
  console.log(e.uploadedFiles);
});
