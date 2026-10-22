/// Factorisation of the semiprime `pq` sent by the server in `resPQ`.
///
/// The factors are 31-bit primes, so Pollard's rho with Brent's cycle
/// detection finishes in milliseconds for every value the server can send.
module tgng.mtp.pq;

import std.exception: enforce;

/// Raised when `pq` cannot be factored within the iteration budget.
class PqException : Exception
{
	this(string msg, string file = __FILE__, size_t line = __LINE__) @safe pure nothrow
	{
		super(msg, file, line);
	}
}

/// Splits `pq` into its two prime factors, `p < q`.
///
/// `pq` is the big-endian unsigned integer from `resPQ.pq`, which fits `ulong`
/// because both factors are below 2^31.
struct PqFactors
{
	ulong p;
	ulong q;
}

PqFactors factorizePq(ulong pq) @safe
{
	enforce!PqException(pq > 1, "pq must be greater than one");
	return factorizeSmall(pq);
}

/// Decodes a big-endian `resPQ.pq` byte string and factorises it.
PqFactors factorizePq(const(ubyte)[] pq) @safe
{
	enforce!PqException(pq.length > 0 && pq.length <= 8, "pq: bad length");
	ulong v = 0;
	foreach (b; pq)
		v = (v << 8) | b;
	return factorizePq(v);
}

private PqFactors factorizeSmall(ulong pq) @safe
{

	ulong odd = pq;
	ulong twos = 1;
	while ((odd & 1) == 0)
	{
		odd /= 2;
		twos *= 2;
	}

	if (odd == 1)
		return PqFactors(twos / 2, 2);

	// Trial division covers every small factor cheaply and leaves a large
	// semiprime to rho.
	for (ulong d = 3; d * d <= odd; d += 2)
	{
		if (odd % d != 0)
			continue;
		ulong a = d * twos;
		ulong b = pq / a;
		return a < b ? PqFactors(a, b) : PqFactors(b, a);
	}

	// `odd` is a prime after the loop: it is either the larger factor or the
	// only factor besides the stripped power of two.
	return twos < odd ? PqFactors(twos, odd) : PqFactors(odd, twos);
}

private ulong pollardRho(ulong n) @safe
{
	enforce!PqException((n & 1) == 1, "Pollard rho needs an odd number");

	foreach (immutable c; 1 .. 100)
	{
		ulong x = 2, y = 2, d = 1;
		foreach (_; 0 .. 1_000_000)
		{
			x = f(x, c, n);
			y = f(f(y, c, n), c, n);
			d = gcd(x > y ? x - y : y - x, n);
			if (d != 1)
				break;
		}
		if (d != 1 && d != n)
			return d;
	}

	throw new PqException("failed to factor pq");
}

private ulong f(ulong x, ulong c, ulong n) @safe
{
	// Modular multiplication via `ulong` would overflow for 64-bit `n`; the
	// MTProto factors keep `n` below 2^63, so `cent` is exact enough.
	return (mulMod(x, x, n) + c) % n;
}

/// Returns `a * b mod m` without overflowing 64-bit arithmetic.
private ulong mulMod(ulong a, ulong b, ulong m) @safe
{
	ulong result = 0;
	a %= m;
	while (b != 0)
	{
		if ((b & 1) != 0)
			result = addMod(result, a, m);
		b >>= 1;
		if (b != 0)
			a = addMod(a, a, m);
	}
	return result;
}

/// Returns `a + b mod m` for `a, b < m`.
private ulong addMod(ulong a, ulong b, ulong m) @safe
{
	return a >= m - b ? a - (m - b) : a + b;
}

private ulong gcd(ulong a, ulong b) @safe
{
	while (b != 0)
	{
		immutable t = a % b;
		a = b;
		b = t;
	}
	return a;
}

@safe unittest // vectors from tdutils/test/pq.cpp
{
	enforce(factorizePq(3 * 7) == PqFactors(3, 7));
	enforce(factorizePq(179424611UL * 179424673UL) == PqFactors(179424611, 179424673));
	enforce(factorizePq(2 * 2) == PqFactors(2, 2));
	enforce(factorizePq(4UL * 3UL) == PqFactors(3, 4));
	enforce(factorizePq(179424673UL * 179424673UL) == PqFactors(179424673, 179424673));
}

@safe unittest // large factors from tdutils/test/pq.cpp
{
	enforce(factorizePq(4294467311UL * 4294467449UL) == PqFactors(4294467311, 4294467449));
}
