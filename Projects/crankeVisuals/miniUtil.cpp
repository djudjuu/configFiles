#include<vector>
#include<fstream>
#include<iostream>
#include<math.h>

using namespace std;

vector<int> readLEDmap(char* pathToLEDKarte)
{    
	std::ifstream inFile(pathToLEDKarte);
	//std::ifstream inFile("../LEDkarte.txt");
	//Create an input file stream
	//ifstream in(pathToLEDKarte, ios::in);

	//this used to work outside ardiuno
	//ifstream in("./LEDkarte.txt".)pathToLEDKarte, ios::in);
	vector<int>numbers;
	//Read number using the extraction (>>) operator
	int number;	//Variable to hold each number as it is read
	// As long as we haven't reached the end of the file, keep reading entries.
	while( inFile  >> number)
	{
		numbers.push_back(number);
	}
	//Close the file stream
	inFile.close();
	//uncommment this code for testing by printing out the first k= 20 entries
	cout << "Numbers:\n";
	int k = 20;
	for (int i=0; i<numbers.size(); i++) 
	{
		cout << numbers[i] << ',';
	}
	/**/
	return numbers;
} 

int NUM_LEDS =31;
int LEDkarte [31] = {0,0,1,1,2,2,3,3,4,4,5,5,6,6,7,7,8,8,9,9,10,10,11,11,12,12,13,13,14,14,15};
const int nSegs = 8;

//---------- initialization ------------
//create a lookupTable for LEDpositions and fill it
// list of pointers to vector<int>s
vector<int>* seg2ledsLookup [nSegs];

vector<int>* mapSeg(int seg)
{
	//returns a pointer to a vector of ints that represent all indeces of the LEDs in the given segement
	return seg2ledsLookup[seg];
} 

void fillSegLookUp(){
	//create one vector for each segment
	for (int s=0; s <= nSegs; s++) 
	{
		cout << "segment"<< s<< "holds LEDS: ";
		vector<int>* segVec = new vector<int>(); //create new empty vector for the segment//TODO use new operation
		//now go over the LEDS and push their locations on the segment-vector
		for (int j=0; j < NUM_LEDS; j++)
		{
		if (LEDkarte[j]==s){
				segVec->push_back(j);
				cout << segVec->back()<<',';
			}
		}
		//now save the adress of the segVec in the lookupTable
		seg2ledsLookup[s] = segVec;

		cout << segVec->size()<<endl;
	}
	cout << "firstnumber is"<<(*seg2ledsLookup[0])[0]<<endl;
	//return 1;
} 

int bounceIndex(int tau, int d){
	if (d>0){
		return tau % nSegs;
	}else{
		return(nSegs- (tau % nSegs)); 
	}
}

void bouncingBeam(int start=0){
     /* makes a beam bounce back and forth
      * basically it goes
      * 1) compute the index to turn off
      * 2) increase counters
      * 3) compute where to turn on next
      * 4) call fire
      * */
     int bounces = 0; //counts how often the beam went back and forth
     int d = 1; // direction: either -1 or +1
     int tau = start; //der takt
     while (bounces<3){//use this for 3 iterations
     //while (1){ //use this for endless bouncing
	   int offIndex = bounceIndex(tau,d);
	   tau++;
	   if (tau%nSegs==0){	//if beam reached some end of the segment
	      bounces++;	//remember and
	      d = d*(-1);	//switch direciton
	   }
     	   int onIndex = bounceIndex(tau,d);
	   //fire
	   //vleds[onIndex]= CHSV(gHue, 255, 255);
           //vleds[offIndex]=CRGB::Black;
	   cout << onIndex<< "  "<<offIndex << endl;
     }
}

//void crashingBeams(){
int getDelay(int tau){
	  int tempi=10;
	    return 0 + (int(floor(tau/10))%tempi)*50;
}

void fadingBeam(){
  int breite=2;
  int speeed=5;
  //int d = 1; // direction: either -1 or +1
  //int inc = floor(256/(floor(breite/2) +1));
  int tau = 0; //der takt
  //int inc = floor(256/speeed);
  //int beamReach = floor(breite/2);  // Beam: -beamreach<-centerLED->+beamReach
  int onLED =0;
  int offLED;
  //CHSV front = CHSV(gHue,255,0);
  ////CHSV back = CHSV(gHue,255,0);
  while (1 and (tau<1000)){
    onLED = floor(tau/speeed);
    float intensity = float((tau%speeed))/float(speeed);
    if (onLED<nSegs){ 
      //front.val = front.val+inc;
      //front.hue = front.hue+20;
      cout<< intensity<<"->";
      //vleds[onLED] = front;
    }
    if ((onLED-breite)>=0){
      int offLED = max(0,onLED-breite);
      //back.val = back.val-inc;
      //vleds[offLED] = back;//.val = vleds[onLED].val-inc;
      cout<< " ,"<< 1-intensity; 
    }
    tau++;
    //fire(200);
  }
} 


/*
	for (int i=0; i<nSegs;i++){
		cout<<"off: ";
		for (int j=i-1; j>=i-beamReach-1; j--){
			//turn off
			cout<<max(0,j);
			}
		cout<<"on: ";
		for (int j=i; j<=i+beamReach; j++){
			//turn off
			cout<<min(j,nSegs);
			}
		cout<< endl;
	}
} */
//leds[led].fadeToBlackBy(+inc);
//leds[led] = CRGB::Red;
//leds[led].fadeToBlackBy(-inc);


int a = 5;
int b =2;
int sz = sizeof(seg2ledsLookup)/sizeof(vector<int>*);
int main()
{
	//bouncingBeam(4);
	//bouncingBeam();
	//fadingBeam();
	for(int i=0;i<100;i++){
		cout<<getDelay(i)<< " " ;
	}
	//cout << min( 0,-1)<< max(-1,5)<<endl;
	/*
	//learning about c++ addition
	cout <<"5/2"<<a/b<<"ee"<< max(0, 20-10)<<endl;
	int breite = 5;
	int beamReach = floor(breite/2);
	cout << "ballreadius"<<floor(256/(floor(breite/2) +1))<< endl;
	cout << "beamReach"<<beamReach<< endl;
	cout << "Nsegs"<<sz<< endl;
	//cout << "ahhhhhhhhhhhh"<< endl;
	fillSegLookUp();
	//cout << "bhhhhhhhhhhhh"<< nSegs<<endl;

	vector<int>* segleds;
	for ( int i=0; i <= nSegs; i++)
	{
		//cout << "bbb" << endl;
		segleds = mapSeg(i);
		//cout << "seg"<< i<< "holds"<<segleds->size();
		//cout << "elements and its LEDS-indeces are:";
		for (int i : *segleds)
			cout << i<<',';
			//leds[ i ] = CRGB::Red;
		//cout <<"ende segment"<< endl;
	}
	//cout << "ende"<<endl;
	//
	*/
	return 1;
}




