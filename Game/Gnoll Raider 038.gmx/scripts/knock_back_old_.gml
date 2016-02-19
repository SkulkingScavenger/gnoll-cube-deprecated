/**
Right now, this function just teleports the character. 
In the future, we should make our movement a little
more sophisticated. We should have modifiable speeds
and friction. maybe don't use knockback till that's in place.
*/
var projectile, x_force, y_force, force_dir, force_mag;

projectile = argument0;
x_force = projectile.x - projectile.xprevious;//if x - xprevious = positive, then x > xprevious, then x is increasing
y_force = projectile.y - projectile.yprevious;
force_dir = point_direction(x,x+x_force,y,y+y_force);
force_mag = floor(sqrt(sqr(x_force) + sqr(y_force^2)));

if (place_free(x + x_force,y + y_force)){
  x += x_force;
  y += y_force;
}else{
  move_contact_solid(force_dir,force_mag);
}

