#include "testlib.h"
#include <bits/stdc++.h>
using namespace std;

int main(int argc, char *argv[])
{
	registerGen(argc, argv, 1);
	int N = 0x3f3f3f3f;
	cout << rnd.next(-N,N) << " " << rnd.next(-N,N) << endl;
	return 0;
}
