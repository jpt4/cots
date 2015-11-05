module lid() {
    difference() {
        cube([150,200,23]);
        cube([25,25,25]);
        translate([0,175,0]){
            cube([25,25,25]);
        }
    }
}

module body() {
    translate([200,0,0]) {
        cube([150,200,50]);
    }
    union(){
        translate([200,0,50]){
                cube([25,25,25]);
        }
        translate([200,175,50]){
                cube([25,25,25]);
        }
    }
}

lid();
body();

module laptop() {
    union() {
        translate([700,300,50]) {
            lid();
        }
        translate([500,300,0]) {
            body();
        }
    }
}

laptop();