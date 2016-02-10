var sock, buffer;
sock = argument[0];
buffer = send_buffer;
if (argument_count > 1){
  buffer = argument[1];
}
network_send_packet(sock, buffer, buffer_tell(buffer));
