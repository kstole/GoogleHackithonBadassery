#include <stdio.h>

typedef struct apiNames{
	char name[];
};

typedef struct apiArray{		
	int capacity; //need to have actual size
	struct apiNames name[];
};


void setapiArray(struct* apiArray, int cap){
	apiArray->capacity = cap;
	apiArray->nameList = (apiArray)malloc(sizeof(apiArray) * apiArray->capacity);
	
	int i;
	for(i = 0;i < api->capacity;i++){
		//the size of the names in each char array goes here.
	}
}

int searchArray(char* userInput, struct apiArray list){
	
	int i;
	int j;
	int possition = 0;
	int check = 0;
	
	int possitions[list->capacity];
	
	//Check each array 
	//Then each space in each array.
	for(i = 0; i < list->capacity-1; i++){
		for(j = 0; j < (sizeof(userInput) /sizeof(userInput[0])){
			userInput[j] = toLower(userInput[j]);
			
			//if it's not the same we stop
			if(userInput[j] != list->nameList[i]->name[j]){
				check = 0;
				break;
			}
			
			else{
				check = 1;
			}
			
		if(check == 1){
			possitions[possition];
			possition = possition + 1;
		}
	}
	return possitions;
}
	
int main(){
	
	char userInput[] = "name";
	
	struct apiArray list
	
	setapiArray(list)
	
	searchArray(userInput, list);
}