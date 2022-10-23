#include<bits/stdc++.h>
#define addop    "000000"
#define addiop   "001000"
#define adduop   "000000"
#define andop   "000000"
#define andiop   "001100"
#define luiop    "001111"
#define norop    "000000"
#define orop     "000000"
#define oriop    "001101"
#define sltop    "000000"
#define sltiop   "001010"
#define sltiuop  "001011"
#define subop    "000000"
#define subuop   "000000"
#define xorop    "000000"
#define xoriop   "001110"
#define sllop    "000000"
#define sllvop   "000000"
#define sraop    "000000"
#define sravop   "000000"
#define srlop    "000000"
#define srlvop   "000000"
#define divop    "000000"
#define divuop   "000000"
#define mfhiop   "000000"
#define mfloop   "000000" 
#define mthiop   "000000"
#define mtloop   "000000"
#define multop   "000000"
#define multuop  "000000"
#define beqop    "000100"
#define bgezop   "000001"
#define bgezalop "000001"
#define bgtzop   "000111"
#define blezop   "000110"
#define bltzop   "000001"
#define bltzalop "000001"
#define bneop    "000101"
#define breakop  "000000"
#define jop      "000010"
#define jalop    "000000"
#define jalrop   "000000"
#define jrop     "000000"
#define mfc0op   "010000"
#define mtc0op   "010000"
#define syscallop "000000"
#define lbop     "100000"
#define lbuop    "100100"
#define lhop     "100001"
#define lhuop    "100101"
#define lwop     "100011"
#define sbop     "101000"
#define shop     "101001"
#define swop     "101011"
#define shamt "00000"
#define mulop "000000"


using namespace std;
string joff(string s,int& ind){
   string h="";
    for(;(s[ind]!=')')&&(s[ind]!=' ');ind++){
        h+=s[ind];
    }
    cout<<"inside joff "<<h<<endl;
    long n1=stol(h);
    bitset<26> b(n1);
    return b.to_string();
}
string immof(string s,int& ind){
    string h="";
    for(int i=ind;(s[i]!=')')&&(s[i]!=' ');i++){
        h+=s[i];ind++;
    }
    cout<<"inside immof "<<h<<endl;
    long n1=stol(h);
    bitset<16> b(n1);
    return b.to_string();
}
string addRs(string s,int& ind){
    string h="";
    for(int i=ind;(s[i]!=',')&&(s[i]!=' ');i++){
        h+=s[i];ind++;
    }
    cout<<"inside Rs "<<h<<endl;
    long n1=stol(h);
    bitset<5> b(n1);
    return b.to_string();
}
void ex(string s,int& ind){
    cout<<"inside ex";
    while((s[ind]==' ')||(s[ind]=='$')||(s[ind]==',')||(s[ind]=='(')){
        ind++;
    }
}
string substr(string s,int& ind){
    string h="";
    for(;(s[ind]!=':')&&(ind<s.length());ind++){
        h+=s[ind];
    }ind++;
    return h;
}
string parse(string s,long& pc){
   
   string instr="",rs="",rt="",rd="",imm="",sa="";
   string temp="";
   int ind=0;bool bln=false;
    switch(s[0]){
        case 'a':
            switch(s[1]){
                case 'd':
                    switch(s[3]){
                        case ' ':
                            instr+=addop;
                            ind+=3;
                            ex(s,ind);                            
                            rd+=addRs(s,ind);
                            ex(s,ind);                            
                            rs+=addRs(s,ind);
                            ex(s,ind);
                            rt+=addRs(s,ind);
                            instr+=rs;
                            instr+=rt;
                            instr+=rd;
                            instr+=shamt;
                            instr+="100000";
                        break;
                        case 'i':
                            instr+=addiop;ind+=4;
                            ex(s,ind);
                            rt+=addRs(s,ind);
                            ex(s,ind);
                            rs+=addRs(s,ind);
                            ex(s,ind);
                            imm+=immof(s,ind);
                            instr+=rs;
                            instr+=rt;
                            instr+=imm;
                        break;
                        case 'u':
                            instr+=adduop;ind+=4;
                            ex(s,ind);                            
                            rd+=addRs(s,ind);
                            ex(s,ind);                            
                            rs+=addRs(s,ind);
                            ex(s,ind);
                            rt+=addRs(s,ind);
                            instr+=rs;
                            instr+=rt;
                            instr+=rd;
                            instr+=shamt;
                            instr+="100001";
                        break;            

                    }
                break;    
                case 'n':
                    switch(s[3]){
                        case ' ':
                            instr+=andop;
                            ind+=3;
                            ex(s,ind);                            
                            rd+=addRs(s,ind);
                            ex(s,ind);                            
                            rs+=addRs(s,ind);
                            ex(s,ind);
                            rt+=addRs(s,ind);
                            instr+=rs;
                            instr+=rt;
                            instr+=rd;
                            instr+=shamt;
                            instr+="100100";
                        break;
                        case 'i':
                            instr+=andiop;ind+=4;
                            ex(s,ind);
                            rt+=addRs(s,ind);
                            ex(s,ind);
                            rs+=addRs(s,ind);
                            ex(s,ind);
                            imm+=immof(s,ind);
                            instr+=rs;
                            instr+=rt;
                            instr+=imm;
                        break;        
                    }
                break;    
            }
        break;
        case 'b': //1
        switch(s[1]){
              case 'e': //2
              instr+=beqop ; ind+=3;
              ex(s,ind) ;
              instr+=addRs(s,ind) ;
              ex(s,ind) ;
              instr+=addRs(s,ind) ;
              ex(s,ind) ;
              instr+=immof(s,ind) ;
        break; //2
        case 'g': //3
        switch(s[2]){
            case 't': //4 
            instr+=bgtzop ; ind+=4 ;
            ex(s,ind) ;
            instr+=addRs(s,ind) ;
            ex(s,ind) ;
            instr+="00000";
            ex(s,ind) ;
            instr+=immof(s,ind) ;
            break ;//4
            case 'e'://5
            switch (s[4])
            {
            case ' ': //6
            instr+=bgezop ; ind+=4 ;
            ex(s,ind) ;
            instr+=addRs(s,ind) ;
            ex(s,ind) ;
            instr+="00001";
            ex(s,ind) ;
            instr+=immof(s,ind) ;
            break;//6
            case 'a'://7
            instr+=bgezalop; 
            ind+= 6 ;
            ex(s,ind) ;
            instr+=addRs(s,ind) ;
            ex(s,ind) ;
             instr+="10001";
            ex(s,ind) ;
            instr+=immof(s,ind) ;
            break ;//7
            }
            break ;   //5
        }
        break ;//3
             case 'l'://8
             switch(s[2]){
            case 'e'://9
            instr+=blezop ; ind+=4 ;
            ex(s,ind) ;
            instr+=addRs(s,ind) ;
            ex(s,ind) ;
            instr+="00000";
            ex(s,ind) ;
            instr+=immof(s,ind) ;
            break ; //9
            case 't'://10
            switch(s[4]){
            case ' '://11
            instr+=bltzop ; ind+=4 ;
            ex(s,ind) ;
            instr+=addRs(s,ind) ;
            ex(s,ind) ; 
            instr+="00000";
            ex(s,ind) ;
            instr+=immof(s,ind) ;
            break ;//11
            case 'a'://12
            instr+=bltzalop ; ind+=6 ; 
            ex(s,ind) ;
            instr+=addRs(s,ind) ;
            ex(s,ind) ;
            instr+="10000" ;
            ex(s,ind) ;
            instr+=immof(s,ind) ;
            break;//12
            }
            break ;//10
             }
             break; //8
             case 'n'://13
             instr+=bneop ; ind+=3;
             ex(s,ind);
             instr+=addRs(s,ind) ;
             ex(s,ind) ;
             instr+=addRs(s,ind) ;
             ex(s,ind) ;
             instr+=immof(s,ind) ;
             break ;//13
            }
        break ;
        case 'd'://d
            switch(s[3]){
                case ' ':
                instr+=divop;
                            ind+=3;
                             ex(s,ind);                            
                            rd+=addRs(s,ind);
                            ex(s,ind);                            
                            rs+=addRs(s,ind);
                            ex(s,ind);
                            rt+=addRs(s,ind);
                            instr+=rs;
                            instr+=rt;
                            instr+=rd;
                            instr+=shamt;
                            instr+="011010";    
                break;
                case 'u':
                instr+=divuop;
                            ind+=4;
                             ex(s,ind);                            
                            rd+=addRs(s,ind);
                            ex(s,ind);                            
                            rs+=addRs(s,ind);
                            ex(s,ind);
                            rt+=addRs(s,ind);
                            instr+=rs;
                            instr+=rt;
                            instr+=rd;
                             instr+=shamt;
                            instr+="011011";
                break;
            }
        break;
        case 'j':
        ind+=1;
            instr+=jop;
            ex(s,ind);
            instr+=joff(s,ind);       
        break;
        case 'l':
             switch(s[1])
                     {   case 'b':
                           instr+=lbop;
                           ind+=2;
                           ex(s,ind);
                            rt+=addRs(s,ind);
                            ex(s,ind);
                            rs+=addRs(s,ind);
                            ex(s,ind);
                            imm+=immof(s,ind);
                            instr+=rs;
                            instr+=rt;
                            instr+=imm;                   
                           
                         break;
                         case 'h':
                         instr+=lhop;
                           ind+=2;
                           ex(s,ind);
                            rt+=addRs(s,ind);
                            ex(s,ind);
                            rs+=addRs(s,ind);
                            ex(s,ind);
                            imm+=immof(s,ind);
                            instr+=rs;
                            instr+=rt;
                            instr+=imm;                   
                           
                            
                         break;
                         case 'w':
                         instr+=lwop;
                           ind+=2;
                           ex(s,ind);
                            rt+=addRs(s,ind);
                            ex(s,ind);
                            rs+=addRs(s,ind);
                            ex(s,ind);
                            imm+=immof(s,ind);
                            instr+=rs;
                            instr+=rt;
                            instr+=imm;  
                                              
                           
                         break;


                      }
        break;
        
        case 'm':
        switch (s[1]){
            case 'f':
            switch (s[2])
            {
                case 'c':
                instr+=mfc0op;
                instr+="00000";
                ind+=4;
                ex(s,ind);
                instr+=addRs(s,ind);
                ex(s,ind);
                instr+=addRs(s,ind);
                instr+="00000000000";
                break;

                case 'h':
                instr+=mfhiop;
                instr+="0000000000";
                ind+=4;
                ex(s,ind);
                instr+=addRs(s,ind);
                instr+=shamt;
                instr+="010000";
                break;

                case 'l':
                instr+=mfloop;
                instr+="0000000000";
                ind+=4;
                ex(s,ind);
                instr+=addRs(s,ind);
                instr+=shamt;
                instr+="010010";
                break;
            }
            
            break;

            case 't':
            switch (s[2])
            {
                case 'c':
                instr+=mtc0op;
                instr+="00100";
                ind+=4;
                ex(s,ind);
                instr+=addRs(s,ind);
                ex(s,ind);
                instr+=addRs(s,ind);
                instr+="00000000000";
                break;

                case 'h':
                instr+=mthiop;
                ind+=4;
                ex(s,ind);
                instr+=addRs(s,ind);
                instr+="000000000000000";
                instr+="010001";
                break;

                case 'l':
                instr+=mtloop;
                ind+=4;
                ex(s,ind);
                instr+=addRs(s,ind);
                instr+="000000000000000";
                instr+="010011";
                break;
            }
            break; 

            case 'u':
            switch(s[3]){
                 case ' ':
                             instr+=mulop;                                                                            //mul
                             ind+=3;
                             ex(s,ind);                            
                            rd+=addRs(s,ind);
                            ex(s,ind);                            
                            rs+=addRs(s,ind);
                            ex(s,ind);
                            rt+=addRs(s,ind);
                            instr+=rs;
                            instr+=rt;
                            instr+=rd;
                             instr+=shamt;
                             instr+="011000";

                 break;

                case 't':
                switch(s[4]){
                    case ' ':
                instr+=multop;
                ind+=4;
                ex(s,ind);
                instr+=addRs(s,ind);
                ex(s,ind);
                instr+=addRs(s,ind);
                instr+="0000000000";
                instr+="011000";
                break;

                case 'u':
                instr+=multuop;
                ind+=5;
                ex(s,ind);
                instr+=addRs(s,ind);
                ex(s,ind);
                instr+=addRs(s,ind);
                instr+="0000000000";
                instr+="011001";
                break;
                }
                 break;
            }
            break;          
        }
        break;

        case 'n':
        instr+=norop;
        ind+=3;
                                    ex(s,ind);                            
                            rd+=addRs(s,ind);
                            ex(s,ind);                            
                            rs+=addRs(s,ind);
                            ex(s,ind);
                            rt+=addRs(s,ind);
                            instr+=rs;
                            instr+=rt;
                            instr+=rd;
        instr+=shamt;
        instr+="100111";
        break;
        case 'o':
                 switch (s[2])
                 {
                 case ' ':
                 instr+=orop;
                 ind+=3;
                                             ex(s,ind);                            
                            rd+=addRs(s,ind);
                            ex(s,ind);                            
                            rs+=addRs(s,ind);
                            ex(s,ind);
                            rt+=addRs(s,ind);
                            instr+=rs;
                            instr+=rt;
                            instr+=rd;
                 instr+="00000";
                 instr+="100101";
                 break;
                case 'i':
                instr+=oriop;
                 ind+=3;
                                         ex(s,ind);
                            rt+=addRs(s,ind);
                            ex(s,ind);
                            rs+=addRs(s,ind);
                            ex(s,ind);
                            imm+=immof(s,ind);
                            instr+=rs;
                            instr+=rt;
                            instr+=imm;
                 break;
                 }

        break;
        case 's':  
                 switch(s[1]) {
                    case'b':
                    instr+=sbop;
                           ind+=2;
                           ex(s,ind);
                            rt+=addRs(s,ind);
                            ex(s,ind);
                            rs+=addRs(s,ind);
                            ex(s,ind);
                            imm+=immof(s,ind);
                            instr+=rs;
                            instr+=rt;
                            instr+=imm;
                    break;


                    case 'h':
                    instr+=shop;
                           ind+=2;
                           ex(s,ind);
                            rt+=addRs(s,ind);
                            ex(s,ind);
                            rs+=addRs(s,ind);
                            ex(s,ind);
                            imm+=immof(s,ind);
                            instr+=rs;
                            instr+=rt;
                            instr+=imm;
                    break;

                    case 'l':
                    switch(s[2]){
                        case 'l':
                        switch(s[3]){
                            /*case ' ':                                        //sll
                                instr+=sllop;
                                ind+=3;
                                ex(s,ind);
                                rd+=addRs(s,ind);
                                ex(s,ind);
                                rt+=addRs(s,ind);
                                ex(s,ind);
                                sa+=immof(s,ind);*/

                            break;
                             
                            case 'v':
                            instr+=sllvop;
                            ind+=4;
                             ex(s,ind);                            
                            rd+=addRs(s,ind);
                            ex(s,ind);                            
                            rt+=addRs(s,ind);
                            ex(s,ind);
                            rs+=addRs(s,ind);
                            instr+=rs;
                            instr+=rt;
                            instr+=rd;
                            instr+="00000";
                            instr+="000100";
                            break;
                        }
 
                        break;
                         
                        case 't':
                        switch(s[3]){
                            case ' ':
                            instr+=sltop;
                            ind+=3;
                                                        ex(s,ind);                            
                            rd+=addRs(s,ind);
                            ex(s,ind);                            
                            rs+=addRs(s,ind);
                            ex(s,ind);
                            rt+=addRs(s,ind);
                            instr+=rs;
                            instr+=rt;
                            instr+=rd;
                            instr+="00000";
                            instr+="101010";
                            break;
                            

                            case 'i':
                            switch(s[4]){
                                case ' ':
                                instr+=sltiop;
                                ind+=4;
                                                   ex(s,ind);
                            rt+=addRs(s,ind);
                            ex(s,ind);
                            rs+=addRs(s,ind);
                            ex(s,ind);
                            imm+=immof(s,ind);
                            instr+=rs;
                            instr+=rt;
                            instr+=imm;
                                break;

                                case 'u':
                                 instr+=sltiuop;
                                ind+=5;
                                                           ex(s,ind);
                            rt+=addRs(s,ind);
                            ex(s,ind);
                            rs+=addRs(s,ind);
                            ex(s,ind);
                            imm+=immof(s,ind);
                            instr+=rs;
                            instr+=rt;
                            instr+=imm;
                                break;
                            }
                            break;                         
                        }
                        break;

                    }
                    break;

                    case 'r':
                    switch(s[2]){
                        case 'a':
                        switch(s[3]){
                            case ' ':                                              //sra
//                                instr+=sllop;
//                                instr+="00000";
//                                ind+=3;
//                                ex(s,ind);
//                                instr+=addRs(s,ind);
//                                ex(s,ind);
//                                instr+=addRs(s,ind);
//                                ex(s,ind);
//                                instr+=addRs(s,ind);
//                                instr+="000011";

                            break;

                            case 'v':
                            instr+=sravop;
                            ind+=4;
                             ex(s,ind);                            
                            rd+=addRs(s,ind);
                            ex(s,ind);                            
                            rt+=addRs(s,ind);
                            ex(s,ind);
                            rs+=addRs(s,ind);
                            instr+=rs;
                            instr+=rt;
                            instr+=rd;
                            instr+=shamt;
                            instr+="000111";
                            break;
                        }
                        break;

                        case 'l':
                        switch(s[3]){
                            case ' ':                                               //srl
//                                instr+=sllop;
//                                ind+=3;
//                                ex(s,ind);
//                                instr+=addRs(s,ind);
//                                ex(s,ind);
//                                instr+=addRs(s,ind);
//                                ex(s,ind);
//                                instr+=addRs(s,ind);
//                                ex(s,ind);
//                                instr+=addRs(s,ind);
//                                instr+="000010";
                                
                            break;

                            case 'v':
                            instr+=srlvop;
                            ind+=4;
                             ex(s,ind);                            
                            rd+=addRs(s,ind);
                            ex(s,ind);                            
                            rt+=addRs(s,ind);
                            ex(s,ind);
                            rs+=addRs(s,ind);
                            instr+=rs;
                            instr+=rt;
                            instr+=rd;
                            instr+=shamt;
                            instr+="000110";
                            break;
                        }
                        break;
                    }
                    break;

                    case 'u':
                    switch(s[3]){
                        case ' ':
                        instr+=subop;
                            ind+=3;
                             ex(s,ind);                            
                            rd+=addRs(s,ind);
                            ex(s,ind);                            
                            rs+=addRs(s,ind);
                            ex(s,ind);
                            rt+=addRs(s,ind);
                            instr+=rs;
                            instr+=rt;
                            instr+=rd;

                            instr+="100010";
                        break;

                        case 'u':
                        instr+=subuop;
                             ex(s,ind);                            
                            rd+=addRs(s,ind);
                            ex(s,ind);                            
                            rs+=addRs(s,ind);
                            ex(s,ind);
                            rt+=addRs(s,ind);
                            instr+=rs;
                            instr+=rt;
                            instr+=rd;

                            instr+=shamt;
                            instr+="100011";
                        break;

                    }
                    break;

                    case 'w':
                    instr+=swop;
                           ind+=2;
                           ex(s,ind);
                            rt+=addRs(s,ind);
                            ex(s,ind);
                            rs+=addRs(s,ind);
                            ex(s,ind);
                            imm+=immof(s,ind);
                            instr+=rs;
                            instr+=rt;
                            instr+=imm;
                    break;
                 }
                 

                
        break;
        case 'x':
        switch (s[3])
                 {
                 case ' ':
                 instr+=xorop;
                 ind+=4;
                             ex(s,ind);                            
                            rd+=addRs(s,ind);
                            ex(s,ind);                            
                            rs+=addRs(s,ind);
                            ex(s,ind);
                            rt+=addRs(s,ind);
                            instr+=rs;
                            instr+=rt;
                            instr+=rd;

                 instr+="00000";
                 instr+="100110";

                    break;
                case 'i':
                instr+=xoriop;
                 ind+=4;
                           ex(s,ind);
                            rt+=addRs(s,ind);
                            ex(s,ind);
                            rs+=addRs(s,ind);
                            ex(s,ind);
                            imm+=immof(s,ind);
                            instr+=rs;
                            instr+=rt;
                            instr+=imm;
                 break;}

        break;
    }
    if(bln==false){pc+=4;}
    return instr;
}
int main(){
    ofstream ou;
    ifstream in;
    ou.open("A_bin.txt");
    if(!ou.is_open())cout<<"Error mani crashed\n";
    in.open("AssemblyCode.txt");
    string s,d;long pc=0;
//    while(getline(in,s)){
//        cout<<s;
//        s+=" ";
//        d=parse(s,pc);
//        cout<<d;
//        if(d!=""){
//        ou<<d<<"\n";}
//    }
    while(getline(in,s)){
            cout<<s;
            s+=" ";
            d=parse(s,pc);
            cout<<d;
            if(d!=""){
                //ou<<d;
            for(int j=0;j<4;j++)
            {for(int i=0;i<8;i++)
            ou<<d[8*j+i];
            ou<<"\n";}
            }
        }
    for(int i=0;i<4;i++){ou<<"00000000";ou<<"\n";}
    ou.close();
    in.close();
    return 0;
}
