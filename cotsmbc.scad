module lid() { //still need rod to connect lid to body
    difference() {
        cube([150,200,23]);
        cube([25,25,25]);
        translate([0,175,0]){
            cube([25,25,25]);
        }
    }
    difference() { //upper lid edge
         polyhedron(
            points=[ [25,5,23],[25,195,23],[145,5,23],[145,195,23], [25,0,18],[25,200,18],[145,0,18],[145,200,18] ],                             
            faces=[ [4,0,2,6],[6,2,3,7],[7,3,1,5],[0,1,2,3] ]
         );
    }
    minkowski() { //rounded rear edge of lid
        cylinder([]);
    }
}

module body() { //still need holes in hinges
    translate([200,0,0]) {
        cube([150,200,50]);
    }
    difference() { //base edge 
        polyhedron (
        
        );
    }
    difference() { //rounding so lid may rotate
        cylinder([]);
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



