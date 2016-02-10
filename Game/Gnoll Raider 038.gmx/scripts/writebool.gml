var buffer, bool;
bool = argument[0];
buffer = send_buffer;
if (argument_count > 1){
  buffer = argument[1];
}
buffer_write(buffer,buffer_bool,bool);
