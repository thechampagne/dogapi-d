/*
 * Copyright 2022 XXIV
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
module dogapi;

import std.format: format;
import std.string: strip;
import std.json: JSONValue, parseJSON, JSONException;
import std.net.curl : byLineAsync, CurlException;

class DogAPIException : Exception
{
    this(string message, string file = __FILE__, size_t line = __LINE__)
    {
        super(message, file, line);
    }
}

private string getRequest(string endpoint)
{
    auto response = byLineAsync(format("http://dog.ceo/api/%s", endpoint));
    string content = "";
    foreach (line; response)
        content ~= line;
    return content;
}

/** 
 * DISPLAY SINGLE RANDOM IMAGE FROM ALL DOGS COLLECTION
 *
 * Returns: random dog image
 * Throws: DogAPIException on failure
 */
string randomImage()
{
    try
    {
        auto response = getRequest("breeds/image/random");
        JSONValue data = parseJSON(response);
        if (data["status"].str != "success")
        {
            throw new Exception(data["message"].str);
        }
        else
        {
            return data["message"].str;
        }
    }
    catch (CurlException ex)
    {
        throw new DogAPIException(ex.msg);
    }
    catch (JSONException ex)
    {
        throw new DogAPIException(format("Something went wrong while reading josn: %s", ex.msg));
    }
    catch (Exception ex)
    {
        throw new DogAPIException(ex.msg);
    }
}

/** 
 * DISPLAY MULTIPLE RANDOM IMAGES FROM ALL DOGS COLLECTION
 *
 * Params:
 *   imagesNumber = number of images
 * Returns: multiple random dog image `NOTE` ~ Max number returned is 50
 * Throws: DogAPIException on failure
 */
string[] multipleRandomImages(byte imagesNumber)
{
    try
    {
        auto response = getRequest(format("breeds/image/random/%d", imagesNumber));
        JSONValue data = parseJSON(response);
        if (data["status"].str != "success")
        {
            throw new Exception(data["message"].str);
        }
        else
        {
            string[] list = [];
            foreach (i; data["message"].array)
            {
                list ~= i.str;
            }
            return list;
        }
    }
    catch (CurlException ex)
    {
        throw new DogAPIException(ex.msg);
    }
    catch (JSONException ex)
    {
        throw new DogAPIException(format("Something went wrong while reading josn: %s", ex.msg));
    }
    catch (Exception ex)
    {
        throw new DogAPIException(ex.msg);
    }
}

/** 
 * RANDOM IMAGE FROM A BREED COLLECTION
 *
 * Params:
 *   breed = breed name
 * Returns: random dog image from a breed, e.g. hound
 * Throws: DogAPIException on failure
 */
string randomImageByBreed(string breed)
{
    try
    {
        auto response = getRequest(format("breed/%s/images/random", strip(breed)));
        JSONValue data = parseJSON(response);
        if (data["status"].str != "success")
        {
            throw new Exception(data["message"].str);
        }
        else
        {
            return data["message"].str;
        }
    }
    catch (CurlException ex)
    {
        throw new DogAPIException(ex.msg);
    }
    catch (JSONException ex)
    {
        throw new DogAPIException(format("Something went wrong while reading josn: %s", ex.msg));
    }
    catch (Exception ex)
    {
        throw new DogAPIException(ex.msg);
    }
}

/** 
 * MULTIPLE IMAGES FROM A BREED COLLECTION
 *
 * Params:
 *   breed = breed name
 *   imagesNumber = number of images
 * Returns: multiple random dog image from a breed, e.g. hound
 * Throws: DogAPIException on failure
 */
string[] multipleRandomImagesByBreed(string breed, long imagesNumber)
{
    try
    {
        auto response = getRequest(format("breed/%s/images/random/%d", strip(breed), imagesNumber));
        JSONValue data = parseJSON(response);
        if (data["status"].str != "success")
        {
            throw new Exception(data["message"].str);
        }
        else
        {
            string[] list = [];
            foreach (i; data["message"].array)
            {
                list ~= i.str;
            }
            return list;
        }
    }
    catch (CurlException ex)
    {
        throw new DogAPIException(ex.msg);
    }
    catch (JSONException ex)
    {
        throw new DogAPIException(format("Something went wrong while reading josn: %s", ex.msg));
    }
    catch (Exception ex)
    {
        throw new DogAPIException(ex.msg);
    }
}

/** 
 * ALL IMAGES FROM A BREED COLLECTION
 *
 * Params:
 *   breed = breed name
 * Returns: an array of all the images from a breed, e.g. hound
 * Throws: DogAPIException on failure
 */
string[] imagesByBreed(string breed)
{
    try
    {
        auto response = getRequest(format("breed/%s/images", strip(breed)));
        JSONValue data = parseJSON(response);
        if (data["status"].str != "success")
        {
            throw new Exception(data["message"].str);
        }
        else
        {
            string[] list = [];
            foreach (i; data["message"].array)
            {
                list ~= i.str;
            }
            return list;
        }
    }
    catch (CurlException ex)
    {
        throw new DogAPIException(ex.msg);
    }
    catch (JSONException ex)
    {
        throw new DogAPIException(format("Something went wrong while reading josn: %s", ex.msg));
    }
    catch (Exception ex)
    {
        throw new DogAPIException(ex.msg);
    }
}

/** 
 * SINGLE RANDOM IMAGE FROM A SUB BREED COLLECTION
 *
 * Params:
 *   breed = breed name
 *   subBreed = sub_breed name
 * Returns: random dog image from a sub-breed, e.g. Afghan Hound
 * Throws: DogAPIException on failure
 */
string randomImageBySubBreed(string breed, string subBreed)
{
    try
    {
        auto response = getRequest(format("breed/%s/%s/images/random", strip(breed), strip(subBreed)));
        JSONValue data = parseJSON(response);
        if (data["status"].str != "success")
        {
            throw new Exception(data["message"].str);
        }
        else
        {
            return data["message"].str;
        }
    }
    catch (CurlException ex)
    {
        throw new DogAPIException(ex.msg);
    }
    catch (JSONException ex)
    {
        throw new DogAPIException(format("Something went wrong while reading josn: %s", ex.msg));
    }
    catch (Exception ex)
    {
        throw new DogAPIException(ex.msg);
    }
}

/** 
 * MULTIPLE IMAGES FROM A SUB-BREED COLLECTION
 *
 * Params:
 *   breed = breed name
 *   subBreed = sub_breed name
 *   imagesNumber = number of images
 * Returns: multiple random dog images from a sub-breed, e.g. Afghan Hound
 * Throws: DogAPIException on failure
 */
string[] multipleRandomImagesBySubBreed(string breed, string subBreed, long imagesNumber)
{
    try
    {
        auto response = getRequest(format("breed/%s/%s/images/random/%d", strip(breed), strip(subBreed), imagesNumber));
        JSONValue data = parseJSON(response);
        if (data["status"].str != "success")
        {
            throw new Exception(data["message"].str);
        }
        else
        {
            string[] list = [];
            foreach (i; data["message"].array)
            {
                list ~= i.str;
            }
            return list;
        }
    }
    catch (CurlException ex)
    {
        throw new DogAPIException(ex.msg);
    }
    catch (JSONException ex)
    {
        throw new DogAPIException(format("Something went wrong while reading josn: %s", ex.msg));
    }
    catch (Exception ex)
    {
        throw new DogAPIException(ex.msg);
    }
}

/** 
 * LIST ALL SUB-BREED IMAGES
 *
 * Params:
 *   breed = breed name
 *   subBreed = sub_breed name
 * Returns: an array of all the images from the sub-breed
 * Throws: DogAPIException on failure
 */
string[] imagesBySubBreed(string breed, string subBreed)
{
    try
    {
        auto response = getRequest(format("breed/%s/%s/images", strip(breed), strip(subBreed)));
        JSONValue data = parseJSON(response);
        if (data["status"].str != "success")
        {
            throw new Exception(data["message"].str);
        }
        else
        {
            string[] list = [];
            foreach (i; data["message"].array)
            {
                list ~= i.str;
            }
            return list;
        }
    }
    catch (CurlException ex)
    {
        throw new DogAPIException(ex.msg);
    }
    catch (JSONException ex)
    {
        throw new DogAPIException(format("Something went wrong while reading josn: %s", ex.msg));
    }
    catch (Exception ex)
    {
        throw new DogAPIException(ex.msg);
    }
}

/** 
 * LIST ALL BREEDS
 *
 * Returns: associative array of all the breeds as keys and sub-breeds as values if it has
 * Throws: DogAPIException on failure
 */
string[][string] breedsList()
{
    try
    {
        auto response = getRequest("breeds/list/all");
        JSONValue data = parseJSON(response);
        if (data["status"].str != "success")
        {
            throw new Exception(data["message"].str);
        }
        else
        {
            string[][string] list;
            foreach (k, v; data["message"].object)
            {
                string[] val = [];
                foreach (value; v.array)
                    val ~= value.str;
                list[k] = val;
            }
            return list;
        }
    }
    catch (CurlException ex)
    {
        throw new DogAPIException(ex.msg);
    }
    catch (JSONException ex)
    {
        throw new DogAPIException(format("Something went wrong while reading josn: %s", ex.msg));
    }
    catch (Exception ex)
    {
        throw new DogAPIException(ex.msg);
    }
}

/** 
 * LIST ALL SUB-BREEDS
 *
 * Params:
 *   breed = breed name
 * Returns: an array of all the sub-breeds from a breed if it has sub-breeds
 * Throws: DogAPIException on failure
 */
string[] subBreedsList(string breed)
{
    try
    {
        auto response = getRequest(format("breed/%s/list", strip(breed)));
        JSONValue data = parseJSON(response);
        if (data["status"].str != "success")
        {
            throw new Exception(data["message"].str);
        }
        else
        {
            string[] list = [];
            foreach (i; data["message"].array)
            {
                list ~= i.str;
            }
            if (list.length == 0)
                throw new DogAPIException("the breed does not have sub-breeds");
            return list;
        }
    }
    catch (CurlException ex)
    {
        throw new DogAPIException(ex.msg);
    }
    catch (JSONException ex)
    {
        throw new DogAPIException(format("Something went wrong while reading josn: %s", ex.msg));
    }
    catch (Exception ex)
    {
        throw new DogAPIException(ex.msg);
    }
}