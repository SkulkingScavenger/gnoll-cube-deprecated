var buffer, str;
str = argument[0];
buffer = send_buffer;
if (argument_count > 1){
  buffer = argument[1];
}
buffer_write(buffer,buffer_string,str);
