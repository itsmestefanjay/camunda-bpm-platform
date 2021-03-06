<#macro endpoint_macro docsUrl="">
{

  <@lib.endpointInfo
      id = "getProcessDefinitionDiagramByKey"
      tag = "Process Definition"
      summary = "Get Diagram"
      desc = "Retrieves the diagram for the latest version of the process definition which belongs to no tenant.

              If the process definition's deployment contains an image resource with the same file name
              as the process definition, the deployed image will be returned by the Get Diagram endpoint.
              Example: `someProcess.bpmn` and `someProcess.png`.
              Supported file extentions for the image are: `svg`, `png`, `jpg`, and `gif`." />

  "parameters" : [

    <@lib.parameter
        name = "key"
        location = "path"
        type = "string"
        required = true
        last = true
        desc = "The key of the process definition."/>
  ],

  "responses" : {

    "200": {
      "description": "Request successful. The image diagram of this process.",
      "content": {
        "application/octet-stream": {
          "schema": {
            "type": "string",
            "format": "binary",
            "description": "defaults to `application/octet-stream` if the file suffix is unknown"
          }
        },
        "*/*": {
          "schema": {
            "type": "string",
            "format": "binary",
            "description": "Files with MIME type information image/png, image/gif, ... "
          }
        }
      }
    },

    <@lib.response
        code = "204"
        desc = "The process definition doesn't have an associated diagram." />

    <@lib.response
        code = "404"
        dto = "ExceptionDto"
        last = true
        desc = "Process definition with given id does not exist. See the
                [Introduction](${docsUrl}/reference/rest/overview/#error-handling)
                for the error response format." />

  }
}

</#macro>