9.1 Which of the following queries succeed, and which fail?

```
   ?-  12  is  2*6. true,
    
   ?-  14  =\=  2*6. true,
    
   ?-  14  =  2*7. 
    
   ?-  14  ==  2*7. 
    
   ?-  14  \==  2*7. 
    
   ?-  14  =:=  2*7. 
    
   ?-  [1,2,3|[d,e]]  ==  [1,2,3,d,e]. 
    
   ?-  2+3  ==  3+2. 
    
   ?-  2+3  =:=  3+2. 
    
   ?-  7-2  =\=  9-2. 
    
   ?-  p  ==  ’p’. 
    
   ?-  p  =\=  ’p’. 
    
   ?-  vincent  ==  VAR. 
    
   ?-  vincent=VAR,  VAR==vincent.
```