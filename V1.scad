cookieLength = 12;
sideSphereR = 0.3;
$fn=50;

//main()
ChineseCookie();


module ChineseCookie(){
    translate([0,0,0]){
        //It's so difficult to calculate that I should disable it to let the project more smooth
        Biscuits();
        //Interlayer(); 
        //translate([0.25,0.1,0])
        //Chun();
   }

    
}

module Biscuits(){
      union(){
        cube([cookieLength,cookieLength,0.8]);
         //generate tetrahedron
        for(x = [0:1:11]){
            translate([x,0,0])
            edgeTetrahedron();
            translate([12,x,0])         rotate([0,0,90])
            edgeTetrahedron();
        }

        for(z = [1:1:12]){
            translate([0,z,0]) rotate([0,0,-90])
            edgeTetrahedron();
            translate([z,12,0]) rotate([0,0,180])
            edgeTetrahedron();   
        }

        
     }
}

module edgeTetrahedron(){
    intersection(){
        polyhedron(
        points=[ [0,0,0.8],[1,0,0.8],[0.5,0,0],[0.5,-0.5,0.5]],
        faces=[[0,1,3],[1,2,3],[3,2,0],[1,0,2]]);
                    
        translate([0.5,0.5,0.5])
        sphere(r=0.85,$fn=100);
                    
        translate([0.5,0.45,0.18]) rotate([45,0,0])
        cylinder(r=0.4,h=3,$fn=100);             
    }


}
//middle layer
module Interlayer(){
    
    translate([0.8,0.8,0.8]) 
    color(c=[1,0,0,1])
    
    minkowski()
    {
      cube([cookieLength-1.5,cookieLength-1.5,0.3]);
      cylinder(r=0.5,h=0.01);
    }
}

//'春'character
module Chun(){
    rotate([0,0,-0.5])
    Heng1();
    translate([6,7.8,1]) rotate([0,0,1])
    Heng2();
    translate([6,6.7,1])
    rotate([0,0,0.5])
    Heng3();
    translate([0,-5,0])
    Pie();
    translate([6.16,4.55,1.3]) rotate([0,90,-80]) scale([1.2,1.2,1.2])
    Na();
    
    translate([4.25,3.1,1]) rotate([-90,90,0])
    Shu();
    
    translate([5.6,4.4,1]) scale([0.5,1,1]) rotate([0,0,1])
    Heng2();
    
    //Shu2
    difference(){
    translate([6.6,1.4,0.85]) rotate([-90,0,0])
    Shu2();
    translate([6.16,4.55,1.3]) rotate([0,90,-80]) scale([1.2,1.2,1.2])
    Na();     
    }
    
    difference(){
        translate([4.4,2,0.85]) rotate([0,90,0])
        cylinder(r=0.38,h=2);
        difference(){
        translate([6.6,1.4,0.85]) rotate([-90,0,0])
        Shu2();
        translate([6.16,4.55,1.3]) rotate([0,90,-80]) scale([1.2,1.2,1.2])
        Na();     
        }  
    }
    
    translate([5.3,3.32,0.96]) scale([0.5,1,1]) rotate([0,0,1])
    Heng2();
}

/*translate([4,9,1]) rotate([0,90,0])
cylinder(r=0.3,h=4,$fn = 100);*/

module Heng1(){
    translate([6,9,1])
    rotate([0,-90,3])
    linear_extrude(height = 3.3, center = true, convexity = 10, scale=[1,1.5],  slices=20,$fn=100)
    translate([0, 0, 0])
    circle(r = 0.2);

    translate([3.87,8.91,0.89]) rotate([90,90,90])
    TipOfWriting1();
}
    
module Heng2(){
    intersection(){
        rotate([0,-90,0])
        linear_extrude(height = 3.3, center = true, convexity = 10, scale=[1,1.5],  slices=20,$fn=100)
        translate([0, 0, 0])
        circle(r = 0.2);
        
        translate([-0.48,-1.5,-0.2])
        cylinder(r=2.5,h=0.4);
        
    }
    translate([-2.15,-0.00,-0.11]) rotate([90,90,90])
    TipOfWriting2();
}



module Heng3(){
    intersection(){
        rotate([0,-90,0])
        linear_extrude(height = 5.1, center = true, convexity = 10, scale=[1,1.8],  slices=20,$fn=100)
        translate([0, 0, 0])
        circle(r = 0.2);
        
    }
    translate([-3.15,0,-0.25]) rotate([90,90,90])
    TipOfWriting3();
    translate([-0.3,0,0])
    RightTip();


}

module RightTip(){
        translate([3.4,0,0])
    rotate([270,90,90])
    TipOfWriting4();
    translate([3.48,-0.1,0])
    rotate([270,90,90])
    TipOfWriting4();
    translate([2.9,-0.1,0])
    sphere(r=0.2);
    translate([2.58,-0.14,0]) rotate([-90,0,97])
    difference(){
        cylinder(h=0.5, r1=0.19, r2=0, center=true);
        translate([0.4,0,-1])
    cylinder(r=0.4,h=2);
    
    }
}
    

module TipOfWriting1(){
    rotate([0,0,90])
    difference(){
    cylinder(r=0.33,h=0.5,$fn=100);
    translate([-0.48,0,0]) rotate([0,32,0])
    cube([2,2,1],center = true);
    }
}


module TipOfWriting2(){

    rotate([0,0,90])
    difference(){
    cylinder(r=0.33,h=0.5,$fn=100);
    translate([-0.48,0,0]) rotate([0,45,0])
    cube([2,2,1],center = true);
    }
}

module TipOfWriting3(){

    rotate([0,0,90])
    difference(){
    cylinder(r=0.46,h=0.6,$fn=100);
    translate([-0.46,0,0]) rotate([0,36,0])
    cube([2,2,1],center = true);
    }
}
module TipOfWriting4(){

    rotate([0,0,90])
    difference(){
    cylinder(r=0.2,h=0.6,$fn=100);
    translate([-0.46,0,0]) rotate([0,36,0])
    cube([2,2,1],center = true);
    }
}

module Pie(){
    translate([2.78,7,-1.11]) rotate([0,-90,65])
    intersection(){
    linear_extrude(height = 7, center = true, convexity = 10, scale=[1,5], $fn=100)
     translate([2, 0, 0])
     circle(r = 0.4);
     
    translate([0.8,9.6,-5]) rotate([0,90,0])
    cylinder(r=10,h=2);
    }
    
    //the top half part of Pie
    
    intersection(){
    translate([-3.9,16,0.98]) rotate([180,0,-6])
    rotate_extrude(angle=30,convexity = 10)
    translate([10, 0, 0])
    circle(r = 0.33, $fn = 100);
    translate([4,11.4,0.5])
    cylinder(r=4,h=2);
    }
    
}

module Na(){
    difference(){
        intersection(){
            linear_extrude(height = 3.2, center = true, convexity = 10, scale=[1,2.5],  slices=20,$fn=100)
                    translate([0, 0, 0])
                    circle(r = 1);
            translate([0,5,-1.6]) rotate([0,90,0])
            cylinder(r=5,h=1);
        }
        translate([0,5.33,-2.4]) rotate([0,90,0])
        cylinder(r=5,h=1);
    }
}

module Shu(){
    intersection(){
        difference(){
            linear_extrude(height = 3.6, center = true, convexity = 10, scale=[1,2],  slices=20,$fn=100)
            translate([0, 0, 0])
            circle(r = 0.18);
            
            translate([-0.2,-1.2,0.5]) rotate([45,0,0])
            cube([2,2,0.4]);
        }
        translate([-0.3,-2.8,1.47]) rotate([0,90,0])
        cylinder(r=4,h=0.8);
    }
}


module Shu2(){
    intersection(){
        cylinder(r=0.45,h=3.5);
        translate([-4,-0.5,3]) rotate([0,90,90])
        cylinder(r= 5,h=1,$fn=100);
        translate([3,0.5,4]) rotate([90,0,0])
cylinder(r= 5,h=1,$fn=100);
        translate([0,0.5,5.05]) rotate([90,0,0])
cylinder(r= 5,h=1,$fn=100);
    }
}


