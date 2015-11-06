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
            faces=[ [4,0,2,6],[6,2,3,7],[7,3,1,5],[0,8,4],[1,5,9],[0,2,10,8],[8,10,6,4],[2,3,11,10],[10,11,7,6],[11,3,1,9],[11,9,5,7], ]
         );
    }
    //minkowski() { //rounded rear edge of lid
    translate([]){
        //rotate
        cylinder();
    }//}
}

module body() { //still need holes in hinges
    difference() { //base edge 
        translate([200,0,0]) {
            cube([150,200,50]);
        }
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



