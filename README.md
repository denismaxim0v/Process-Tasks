# Task Processing

Calling **http://localhost:4000/process** with two different headers -H 'Accept: application/json' or -H 'Accept: plain/text' will return
either json or plain text

To run the result of the script directly in bash do the following

``` bash 
curl -d @yourjson.json -X POST -H 'Accept: text/plain' -H "Content-Type:application/json" http://localhost:4000/process | bash
```

### Example json
``` json
  {
   "tasks":[
      {
         "name":"task-1",
         "command":"touch /tmp/file1"
      },
      {
         "name":"task-2",
         "command":"cat /tmp/file1",
         "requires":[
            "task-3"
         ]
      },
      {
         "name":"task-3",
         "command":"echo 'Hello World!' > /tmp/file1",
         "requires":[
            "task-1"
         ]
      },
      {
         "name":"task-4",
         "command":"rm /tmp/file1",
         "requires":[
            "task-2",
            "task-3"
         ]
      }
   ]
}
```

### will return the following

``` bash
#!/usr/bin/env bash
touch /tmp/file1
echo ​ "Hello World!"​ > /tmp/file1
cat /tmp/file1
rm /tmp/file1
```