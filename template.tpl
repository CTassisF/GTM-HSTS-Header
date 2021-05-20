___TERMS_OF_SERVICE___

By creating or modifying this file you agree to Google Tag Manager's Community
Template Gallery Developer Terms of Service available at
https://developers.google.com/tag-manager/gallery-tos (or such other URL as
Google may provide), as modified from time to time.


___INFO___

{
  "type": "CLIENT",
  "id": "cvt_temp_public_id",
  "version": 1,
  "securityGroups": [],
  "displayName": "HTTP Strict-Transport-Security Header",
  "brand": {
    "id": "brand_dummy",
    "displayName": "HSTS",
    "thumbnail": "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAGAAAABgCAQAAABIkb+zAAACR0lEQVR42u2aO07DQBCGPxMokEwDZVpEwQVyBSSE0kEZKVwiJyBdEI+ki+AAkSigouIMPEIdkGigcpXC0lKgSMhrJzYx+7Dmn9Yj/d961zMrD4hEorIV0KDDiEc+UCg+eGREhwaB++brdHlHZcQ7Xerumt+kzzTT/Cym9Nl00f4hXwvNz+KLQ7fMrzLIbX4WA1Zdsb/ObWH7CsUt626s/t2f7CsUdy68hcGf7f9sJMs6yjA24ZJ9tgkJ2WafSyYZTx7ZtL/FZ+rXvk1Ne7ZGO7VCfLJlD6CfYuiGMPP5kJuUjL69qquXrdMF7ULAaUpps1SdT1JWf3G3E6S8hRMb9ld40/Z+mCsz1M7CGyvmARraOh7nzj3WchvmATraKtZy59a0t9cxDzBKWLgolH2RyB6ZB3hKWNgrlL2XyH4yD5AsYTuFsne0cmZcyRqwUSh7Q6sFxpX8jpjOFwABEAABEACzALv0eCFa6gqfJyJe6LFbrvk1zon/3frviDlnrTz790bNz+K+LIQzK/YVirNy9n5sDSAu4yz0rNlXKHrLAzxbBXheHiCyChCVX7AO/jlKL3ACIAACIAACIAACIAAWAFoMeSUi4pUhLb8AmlwnrkEx1zR9AWjykNoaP+RCcADgKrO7v/IBoDXnDh3nOAvWAYZzb1hD9wHGcwHG7gNEC+64AiBbqOqH2PvPqPeFrAKthPfNXAXaabmRCYAACIAACIAACEBVALz/0e39qIH3wx7ej9t4P/BUgZEz74f+KjB2KRKJRKKq6htq/RwmFOii4wAAAABJRU5ErkJggg\u003d\u003d"
  },
  "description": "Adds a custom HTTP Strict-Transport-Security response header to your Google Tag Manager server-side clients.\n\nRemember to add this server-side client with the highest priority possible!",
  "containerContexts": [
    "SERVER"
  ]
}


___TEMPLATE_PARAMETERS___

[
  {
    "type": "TEXT",
    "name": "maxAge",
    "displayName": "max-age",
    "simpleValueType": true,
    "valueUnit": "seconds",
    "help": "The time, in seconds, that the browser should remember that a site is only to be accessed using HTTPS.",
    "valueHint": "31536000",
    "valueValidators": [
      {
        "type": "NON_EMPTY"
      },
      {
        "type": "NON_NEGATIVE_NUMBER"
      }
    ]
  },
  {
    "type": "CHECKBOX",
    "name": "includeSubDomains",
    "checkboxText": "includeSubDomains",
    "simpleValueType": true,
    "help": "If this optional parameter is specified, this rule applies to all of the site\u0027s subdomains as well.",
    "enablingConditions": [
      {
        "paramName": "maxAge",
        "paramValue": "",
        "type": "PRESENT"
      }
    ]
  },
  {
    "type": "CHECKBOX",
    "name": "preload",
    "checkboxText": "preload",
    "simpleValueType": true,
    "help": "See \u003ca href\u003d\"https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Strict-Transport-Security#preloading_strict_transport_security\"\u003ePreloading Strict Transport Security\u003c/a\u003e for details.",
    "enablingConditions": [
      {
        "paramName": "includeSubDomains",
        "paramValue": true,
        "type": "EQUALS"
      }
    ]
  }
]


___SANDBOXED_JS_FOR_SERVER___

const setResponseHeader = require('setResponseHeader');

let header = 'max-age=' + data.maxAge;
if (data.includeSubDomains) {
	header += '; includeSubDomains';
}
if (data.preload) {
	header += '; preload';
}

setResponseHeader('Strict-Transport-Security', header);


___SERVER_PERMISSIONS___

[
  {
    "instance": {
      "key": {
        "publicId": "access_response",
        "versionId": "1"
      },
      "param": [
        {
          "key": "writeResponseAccess",
          "value": {
            "type": 1,
            "string": "specific"
          }
        },
        {
          "key": "writeHeaderAccess",
          "value": {
            "type": 1,
            "string": "specific"
          }
        },
        {
          "key": "writeHeadersAllowed",
          "value": {
            "type": 8,
            "boolean": true
          }
        },
        {
          "key": "writeHeaderWhitelist",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "headerName"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "Strict-Transport-Security"
                  }
                ]
              }
            ]
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  }
]


___TESTS___

scenarios: []


___NOTES___

https://github.com/CTassisF/GTM-HSTS-Header


