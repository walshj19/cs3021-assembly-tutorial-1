#include <iostream>
#include "segment.hpp"
using namespace std;

bool test_p(){
    int i,j;
    int expected;

    i = 8;
    j = 8;
    expected = ((i+j)<<2)-1;
    return expected == p(i,j);
}

bool test_q(){
    int g;
    int i;
    int expected;

    i = 8;
    g = 256;
    expected = ((g-i)<<2)-1;
    return expected == q(i);
}

bool test_f(){
    int x;
    int expected;

    expected = 4;
    for(x = expected-1; x > 0; --x){
        //cout << expected << endl;
        expected *= x;
    }
    return expected == f(4);
}

int main(){
    string result;

    result = test_p()?"pass":"fail";
    cout << "p test : " << result << "\n";

    result = test_q()?"pass":"fail";
    cout << "q test : " << result << "\n";

    result = test_f()?"pass":"fail";
    cout << "f test : " << result << "\n";

    return 0;
}
