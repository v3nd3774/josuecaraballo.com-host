#!/bin/bash
function site_exec_path () {
  echo `find . -type f -regex ".*bin.*site\.exe" | head -n 1`
}
site=josuecaraballo
