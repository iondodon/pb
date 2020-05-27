#include <stdio.h>
#include <stdbool.h>
int n, solution;
int length_pos_in_binary;
bool binary[10];

void readNumber(){
    FILE *fin = fopen("b210.in", "r");
    fscanf(fin, "%d", &n);
    fclose(fin);
}

void writeSolution(){
    FILE *fout = fopen("b210.out", "w");
    fprintf(fout, "%d", solution);
    fclose(fout);
}

int twoToPower(int exponent){
    int result = 1;

    for(;exponent > 0; exponent--){
        result *= 2;
    }

    return result;
}

void convertToBinary(){
    int i;
    solution = n;

    for(i = 0; n > 0; i++) {
        binary[i] = (n % 2 == 0) ? false : true;
        n /= 2;
    }
    length_pos_in_binary = i-1;
}

int convertToDecimal(int initial_position){
    int decimal_value = 0;

    for(int i = initial_position, iterations = length_pos_in_binary; iterations; iterations--, i--){
        i = (i < 0) ? length_pos_in_binary : i;
        if(binary[i]){
            decimal_value += twoToPower(iterations);
        }
    }

    return decimal_value;
}

void findMaxNumber(){
    int temporary_value;

    for(int i = 0; i <= length_pos_in_binary; i++){
        temporary_value = convertToDecimal(/*initial position*/i);
        if(temporary_value > solution)
            solution = temporary_value;
    }
}

int main() {
    readNumber();
    convertToBinary();
    findMaxNumber();
    writeSolution();
    return 0;
}