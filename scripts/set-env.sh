#!/bin/bash
function site_exec_path () {
  echo `find . -type f -regex ".*bin.*site.*" | head -n 1`
}
site=josuecaraballo
