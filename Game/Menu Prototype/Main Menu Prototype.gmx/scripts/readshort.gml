var buffer;
buffer = receive_buffer;
if (argument_count > 0){
  buffer = argument[0];
}
return buffer_read(buffer, buffer_s16);
