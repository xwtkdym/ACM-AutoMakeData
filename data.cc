#include <bits/stdc++.h>
using namespace std;
typedef long long ll;
mt19937 gen(1314);
ll my_rand(ll l, ll r)
{
	if (l == r) return l;
	return (1LL*gen()*gen())%(r - l + 1) + l;
}
int main()
{
	int t = 100;
	while (t--) {
		printf("%lld %lld\n", my_rand(1, 1000), my_rand(1, 1000));
	}
	return 0;
}
