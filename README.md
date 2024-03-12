Jump to files indexed with [TaskFolders](https://www.taskfolders.com)

Just place yourself on top of a short id or UUID and type `<Leader>f`

For this script to work, the character `-` should be considered when matching whole words since it is part of hash tags and UUIDs. By default Vim does not use `-` when matching keywords. You can check it like this

```
:set iskeyword?                                                                                                   
```

If it is not listed, don't forget to update your config file

```
set iskeyword+=- 
```


