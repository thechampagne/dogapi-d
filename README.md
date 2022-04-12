# Dog API

[![](https://img.shields.io/github/v/tag/thechampagne/dogapi-d?label=version)](https://github.com/thechampagne/dogapi-d/releases/latest) [![](https://img.shields.io/github/license/thechampagne/dogapi-d)](https://github.com/thechampagne/dogapi-d/blob/main/LICENSE)

Dog API client for **D**.

### Download
[DUB](https://code.dlang.org/packages/dogapi/)

```
dub add dogapi
```

### Example

```d
void main()
{
	foreach(dog; multipleRandomImages(10))
		writeln(dog);
}
```

### License

Dog API client is released under the [Apache License 2.0](https://github.com/thechampagne/dogapi-d/blob/main/LICENSE).

```
 Copyright 2022 XXIV

 Licensed under the Apache License, Version 2.0 (the "License");
 you may not use this file except in compliance with the License.
 You may obtain a copy of the License at

     http://www.apache.org/licenses/LICENSE-2.0

 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License.
```