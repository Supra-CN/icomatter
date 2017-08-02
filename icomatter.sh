#!/bin/sh

src_name=${1}
dest_name=${2}
type_name=${3}
output_dir=${4}

main () {
    check_params
    echo_info
    cp_raw

    trans xxxhdpi 192x192;
    trans xxhdpi 144x144;
    trans xhdpi 96x96;
    trans hdpi 72x72; 
    trans mdpi 48x48;
} 

echo_usage () {
    echo "usage: ${0} src_name [dest_name [type_name [output_dir]]]";
}

check_params () {
    echo "----------"
    if [ -z ${src_name} ]
    then
	echo_usage;
	exit 1;
    fi

    if [ ! -f ${src_name} ]
    then
	echo "can not find src file: ${src_name}";
	echo_usage;
	exit 1;
    fi

    if [ -z ${dest_name} ]
    then
	dest_name=${src_name};
    fi

    if [ -z ${type_name} ]
    then
	type_name="drawable";
    fi

    if [ -z ${output_dir} ]
    then
	output_dir="${src_name}.output";
    fi

    if ! try_dir ${output_dir}
    then
	echo "can not make output dir: ${output_dir}";
	echo_usage;
	exit 1;
    fi
}

echo_info () {
    echo "----------"
    echo "convert src: ${src_name}";
    echo "    to dest: ${dest_name}";
    echo "    as type: ${type_name}";
    echo "     output: ${output_dir}";
}

try_dir () {
    dir_name=${1};
    if [ -z ${dir_name} ]
    then
	echo "try to mkdir with empty name";
	return 1;
    fi

    if [ -f ${dir_name} ] 
    then
	echo "ignore make dir: ${dir_name}, it is a file";
	return 1;
    fi

    if [ ! -e ${dir_name} ]
    then
	echo "mkdir ${dir_name}";
	mkdir ${dir_name}; 
    fi
    return 0;
}

trans () {
    echo "----------"
    size_name=${1};
    dest_size=${2};
    dest_dir="${output_dir}/${type_name}-${size_name}";
    dest_file="${dest_dir}/${dest_name}";

    result="skip"

    if try_dir ${dest_dir}
    then
	convert -resize ${dest_size} ${src_name} ${dest_file};
	result="done";
    fi
    echo "[${result}] trans to ${size_name} ${dest_size} at ${dest_file}";
}

cp_raw () {
    echo "----------"
    raw="${output_dir}/raw";
    if try_dir ${raw}
    then
	cp ${src_name} ${raw}/${dest_name};
	echo "done cp raw"
    else
	echo "skip cp raw"
    fi
}

main
