curl.exe -v -X PUT "https://maaasvision.cognitiveservices.azure.com/computervision/retrieval/indexes/my-video-indexx?api-version=2023-05-01-preview" -H "Ocp-Apim-Subscription-Key: 4eaa3267886f4ed1b179f5e938df9024" -H "Content-Type: application/json" --data-ascii "
{
  'metadataSchema': {
    'fields': [
      {
        'name': 'cameraId',
        'searchable': false,
        'filterable': true,
        'type': 'string'
      },
      {
        'name': 'timestamp',
        'searchable': false,
        'filterable': true,
        'type': 'datetime'
      }
    ]
  },
  'features': [
    {
      'name': 'vision',
      'domain': 'surveillance'
    },
    {
      'name': 'speech'
    }
  ]
}"
curl.exe -v -X PUT "https://maaasvision.cognitiveservices.azure.com/computervision/retrieval/indexes/my-video-indexx/ingestions/my-ingestion?api-version=2023-05-01-preview" -H "Ocp-Apim-Subscription-Key: 4eaa3267886f4ed1b179f5e938df9024" -H "Content-Type: application/json" --data-ascii "
{
  'videos': [
    {
      'mode': 'add',
      'documentId': '01a504c9cd28296a8b74394ed7498047',
      'documentUrl': 'https://csg10032002e65bf6af.blob.core.windows.net/fefv/samplevideo.mp4?sp=r&st=2024-12-13T13:42:01Z&se=2024-12-13T21:42:01Z&sv=2022-11-02&sr=b&sig=VUMsv2nCVkS0XObUrXYVi65v3A2whsOsNU%2FfgbIaCXc%3D',
      'metadata': {
        'cameraId': 'camera1',
        'timestamp': '2023-06-30 17:41:33'
      }
    },
  
  ]
}"

curl.exe -v -X GET "https://maaasvision.cognitiveservices.azure.com/computervision/retrieval/indexes/my-video-indexx/ingestions?api-version=2023-05-01-preview&$top=20" -H "ocp-apim-subscription-key: 4eaa3267886f4ed1b179f5e938df9024"



curl.exe -v -X POST "https://maaasvision.cognitiveservices.azure.com/computervision/retrieval/indexes/my-video-indexx:queryByText?api-version=2023-05-01-preview" -H "Ocp-Apim-Subscription-Key: 4eaa3267886f4ed1b179f5e938df9024" -H "Content-Type: application/json" --data-ascii "
{
  'queryText': 'blackboard',
  'filters': {
    'stringFilters': [
      {
        'fieldName': 'cameraId',
        'values': [
          'camera1'
        ]
      }
    ],
    'featureFilters': ['vision']
  }
}"