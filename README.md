# icomatter
icon formatter, a smart shell script for easy convert png icon to android res in different dpi size

# usage
```sh
$ icomatter.sh ${src_file} [${dest_name} [${type_name} [${output_dir}]]]
```

# sample
```sh
# this is a src logo png file
$ tree
.
└── logo.png

0 directories, 1 file


# exec for logo.png
$ icomatter.sh logo.png

# output
$ tree
.
├── logo.png
└── logo.png.output
    ├── drawable-hdpi
    │   └── logo.png
    ├── drawable-mdpi
    │   └── logo.png
    ├── drawable-xhdpi
    │   └── logo.png
    ├── drawable-xxhdpi
    │   └── logo.png
    ├── drawable-xxxhdpi
    │   └── logo.png
    └── raw
        └── logo.png

7 directories, 7 files


# exec with more params
$ icomatter.sh logo.png ic_logo.png mipmap out
$ tree
.
├── logo.png
└── out
    ├── mipmap-hdpi
    │   └── ic_logo.png
    ├── mipmap-mdpi
    │   └── ic_logo.png
    ├── mipmap-xhdpi
    │   └── ic_logo.png
    ├── mipmap-xxhdpi
    │   └── ic_logo.png
    ├── mipmap-xxxhdpi
    │   └── ic_logo.png
    └── raw
        └── ic_logo.png

7 directories, 7 files

```
