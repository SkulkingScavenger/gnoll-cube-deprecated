buffer = buffer_create(256, buffer_grow, 1);
if(argument_count > 0){
buffer_delete(argument[0]);
}else{
buffer_delete(send_buffer);
send_buffer = buffer;
}
return buffer;
