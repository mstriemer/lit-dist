
static createElement(t,e){
  const parser = new DOMParser();
  const doc = parser.parseFromString(
    `<template>${t}</template>`,
    "text/html"
  );
  let i = document.importNode(doc.querySelector("template"), true);
  return i;
}
