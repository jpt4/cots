// cotsmbc.scad
// SCAD design for COTS MBC case

module lid() { //still need rod to connect lid to body
    
    difference() { //upper lid edge
        difference() {
            cube([150,200,23]);
            cube([25,25,25]);
            translate([0,175,0]){
                cube([25,25,25]);
            }
        }
        polyhedron(
            points=[ [25,5,23],[25,195,23],[145,5,23],[145,195,23], [25,0,18],[25,200,18],[150,0,18],[150,200,18], [25,0,23], [25,200,23], [150,0,23], [150,200,23] ],                             
            faces=[ [4,0,2,6],[6,2,3,7],[7,3,1,5],[0,8,4],[1,5,9],[0,2,10,8],[8,10,6,4],[2,3,11,10],[10,11,7,6],[11,3,1,9],[11,9,5,7],[0,2,6,4] ]
         );
    }
    union() { //rounded rear edge of lid
        translate([11,25,12]){
            rotate(a=270, v=[1,0,0]){
                cylinder(150,15,15,15);
            }
        }
    }
}

module body() { //still need holes in hinges
    difference() { //rounding so lid may rotate
        difference() { //base edge 
            translate([200,0,0]) {
                cube([150,200,50]);
            }
            polyhedron (
                points=[ [200,0,5],[200,200,5],[350,0,5],[350,200,5],[200,5,0],[200,195,0],[350,5,0],[350,195,0],[200,0,0],[200,200,0],[350,0,0],[350,200,0]
            ],
            faces=[ [0,2,10,8],[8,10,6,4],[1,0,8,9],[8,9,4,5],[3,1,9,11],[11,9,5,7],[2,3,11,10],[10,11,7,6],[0,2,6,4],[0,4,5,1],[1,5,7,3],[3,7,6,2]
            ]
            );
        }
        translate([210,25,65]){
            rotate(a=270, v=[1,0,0]){
                cylinder(150,15,15,15);
            }
        }
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


