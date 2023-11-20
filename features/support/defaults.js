const { request, settings } = require('pactum');
const { Before } = require('@cucumber/cucumber');

Before(() => {
  request.setBaseUrl('https://api.rudderstack.com');
  settings.setReporterAutoRun(false);
});