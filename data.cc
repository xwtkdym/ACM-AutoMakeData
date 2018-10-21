#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <iostream>
using namespace std;
typedef long long ll;
ll my_rand(ll l, ll r)
{
	if (l == r) return l;
	return rand()%(r - l + 1) + l;
}
int main()
{
	srand((unsigned int)time(NULL));
}
