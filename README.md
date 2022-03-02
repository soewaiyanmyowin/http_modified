A library for Dart developers.

## Usage

A simple usage example:

```dart
import 'package:http_modified/http_modified.dart';

// GET 
final result = await get(tag: _tag, url: url);

//POST
final result = await post(
      tag: _tag,
      url: url,
      headers: jsonHeadersWithBearer(token),
      body: json.encode(requestModel.toJson()),
    );
    
//REST with Attachment
 final result = await restWithFile(
      tag: _tag,
      apiMethod: HttpMethods.POST,
      url: url,
      headers: jsonHeadersWithBearer(token),
      apiKeyForFiles: 'attachment',
      files: [AttachmentFile()],
    );
```

## Features and bugs

Please file feature requests and bugs at the [issue tracker][tracker].

[tracker]: http://github.com/soewaiyanmyowin/http_modified/issues
