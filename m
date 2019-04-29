Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CD29E064
	for <lists+amd-gfx@lfdr.de>; Mon, 29 Apr 2019 12:17:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DC0D88EFF;
	Mon, 29 Apr 2019 10:17:23 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from netline-mail3.netline.ch (mail.netline.ch [148.251.143.178])
 by gabe.freedesktop.org (Postfix) with ESMTP id B1D6D88EFF
 for <amd-gfx@lists.freedesktop.org>; Mon, 29 Apr 2019 10:17:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by netline-mail3.netline.ch (Postfix) with ESMTP id 971B22A6048;
 Mon, 29 Apr 2019 12:17:21 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at netline-mail3.netline.ch
Received: from netline-mail3.netline.ch ([127.0.0.1])
 by localhost (netline-mail3.netline.ch [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id QR73llGNwEO3; Mon, 29 Apr 2019 12:17:21 +0200 (CEST)
Received: from thor (116.245.63.188.dynamic.wline.res.cust.swisscom.ch
 [188.63.245.116])
 by netline-mail3.netline.ch (Postfix) with ESMTPSA id D952B2A6045;
 Mon, 29 Apr 2019 12:17:20 +0200 (CEST)
Received: from [::1] by thor with esmtp (Exim 4.92)
 (envelope-from <michel@daenzer.net>)
 id 1hL3Lc-0005lU-3C; Mon, 29 Apr 2019 12:17:20 +0200
Subject: Re: [PATCH] drm/amdgpu: enable separate timeout setting for every
 ring type
To: Evan Quan <evan.quan@amd.com>
References: <20190429085748.15712-1-evan.quan@amd.com>
From: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>
Openpgp: preference=signencrypt
Autocrypt: addr=michel@daenzer.net; prefer-encrypt=mutual; keydata=
 mQGiBDsehS8RBACbsIQEX31aYSIuEKxEnEX82ezMR8z3LG8ktv1KjyNErUX9Pt7AUC7W3W0b
 LUhu8Le8S2va6hi7GfSAifl0ih3k6Bv1Itzgnd+7ZmSrvCN8yGJaHNQfAevAuEboIb+MaVHo
 9EMJj4ikOcRZCmQWw7evu/D9uQdtkCnRY9iJiAGxbwCguBHtpoGMxDOINCr5UU6qt+m4O+UD
 /355ohBBzzyh49lTj0kTFKr0Ozd20G2FbcqHgfFL1dc1MPyigej2gLga2osu2QY0ObvAGkOu
 WBi3LTY8Zs8uqFGDC4ZAwMPoFy3yzu3ne6T7d/68rJil0QcdQjzzHi6ekqHuhst4a+/+D23h
 Za8MJBEcdOhRhsaDVGAJSFEQB1qLBACOs0xN+XblejO35gsDSVVk8s+FUUw3TSWJBfZa3Imp
 V2U2tBO4qck+wqbHNfdnU/crrsHahjzBjvk8Up7VoY8oT+z03sal2vXEonS279xN2B92Tttr
 AgwosujguFO/7tvzymWC76rDEwue8TsADE11ErjwaBTs8ZXfnN/uAANgPLQjTWljaGVsIERh
 ZW56ZXIgPG1pY2hlbEBkYWVuemVyLm5ldD6IXgQTEQIAHgUCQFXxJgIbAwYLCQgHAwIDFQID
 AxYCAQIeAQIXgAAKCRBaga+OatuyAIrPAJ9ykonXI3oQcX83N2qzCEStLNW47gCeLWm/QiPY
 jqtGUnnSbyuTQfIySkK5AQ0EOx6FRRAEAJZkcvklPwJCgNiw37p0GShKmFGGqf/a3xZZEpjI
 qNxzshFRFneZze4f5LhzbX1/vIm5+ZXsEWympJfZzyCmYPw86QcFxyZflkAxHx9LeD+89Elx
 bw6wT0CcLvSv8ROfU1m8YhGbV6g2zWyLD0/naQGVb8e4FhVKGNY2EEbHgFBrAAMGA/0VktFO
 CxFBdzLQ17RCTwCJ3xpyP4qsLJH0yCoA26rH2zE2RzByhrTFTYZzbFEid3ddGiHOBEL+bO+2
 GNtfiYKmbTkj1tMZJ8L6huKONaVrASFzLvZa2dlc2zja9ZSksKmge5BOTKWgbyepEc5qxSju
 YsYrX5xfLgTZC5abhhztpYhGBBgRAgAGBQI7HoVFAAoJEFqBr45q27IAlscAn2Ufk2d6/3p4
 Cuyz/NX7KpL2dQ8WAJ9UD5JEakhfofed8PSqOM7jOO3LCA==
Message-ID: <74c1715e-cd43-7c16-6e8c-29a085d23317@daenzer.net>
Date: Mon, 29 Apr 2019 12:17:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190429085748.15712-1-evan.quan@amd.com>
Content-Language: en-CA
X-BeenThere: amd-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Discussion list for AMD gfx <amd-gfx.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/amd-gfx>
List-Post: <mailto:amd-gfx@lists.freedesktop.org>
List-Help: <mailto:amd-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=subscribe>
Cc: Alexander.Deucher@amd.com, Wentao.Lou@amd.com, Christian.Koenig@amd.com,
 amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gMjAxOS0wNC0yOSAxMDo1NyBhLm0uLCBFdmFuIFF1YW4gd3JvdGU6Cj4gRXZlcnkgcmluZyB0
eXBlIGNhbiBoYXZlIGl0cyBvd24gdGltZW91dCBzZXR0aW5nLgo+IAo+IENoYW5nZS1JZDogSTk5
MmYyMjRmMzZiYjMzYWNkNTYwMTYyYmZmZDJjM2U5ODc4NDBhN2UKPiBTaWduZWQtb2ZmLWJ5OiBF
dmFuIFF1YW4gPGV2YW4ucXVhbkBhbWQuY29tPgoKVGhpcyBpcyBnb2luZyBpbiBhIGdvb2QgZGly
ZWN0aW9uLCBidXQgdGhlcmUgYXJlIHN0aWxsIHNvbWUKbWlub3IvY29zbWV0aWMgaXNzdWVzLgoK
Cj4gQEAgLTk1OCwxMyArOTYwLDE2IEBAIHN0YXRpYyB2b2lkIGFtZGdwdV9kZXZpY2VfY2hlY2tf
YXJndW1lbnRzKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQo+ICAJCWFtZGdwdV92cmFtX3Bh
Z2Vfc3BsaXQgPSAxMDI0Owo+ICAJfQo+ICAKPiAtCWlmIChhbWRncHVfbG9ja3VwX3RpbWVvdXQg
PT0gMCkgewo+IC0JCWRldl93YXJuKGFkZXYtPmRldiwgImxvY2t1cF90aW1lb3V0IG1zdXQgYmUg
PiAwLCBhZGp1c3RpbmcgdG8gMTAwMDBcbiIpOwo+IC0JCWFtZGdwdV9sb2NrdXBfdGltZW91dCA9
IDEwMDAwOwo+ICsJcmV0ID0gYW1kZ3B1X2RldmljZV9nZXRfam9iX3RpbWVvdXQoYWRldik7Cj4g
KwlpZiAocmV0KSB7Cj4gKwkJZGV2X2VycihhZGV2LT5kZXYsICJpbnZhbGlkIGpvYiB0aW1lb3V0
IHNldHRpbmdcbiIpOwo+ICsJCXJldHVybiByZXQ7Cj4gIAl9CgpUaGUgZXJyb3IgbWVzc2FnZSBz
aG91bGQgc3RpbGwgZXhwbGljaXRseSBtZW50aW9uIGxvY2t1cF90aW1lb3V0LCBvciBpdAptYXkg
bm90IGJlIGNsZWFyIHRvIHRoZSB1c2VyIHdoYXQgaXQncyBhYm91dC4gRS5nLiAiSW52YWxpZAps
b2NrdXBfdGltZW91dCBwYXJhbWV0ZXIgc3ludGF4Ii4KCgo+IEBAIC0yMzIsMTIgKzIzNCwyMCBA
QCBNT0RVTEVfUEFSTV9ERVNDKG1zaSwgIk1TSSBzdXBwb3J0ICgxID0gZW5hYmxlLCAwID0gZGlz
YWJsZSwgLTEgPSBhdXRvKSIpOwo+ICBtb2R1bGVfcGFyYW1fbmFtZWQobXNpLCBhbWRncHVfbXNp
LCBpbnQsIDA0NDQpOwo+ICAKPiAgLyoqCj4gLSAqIERPQzogbG9ja3VwX3RpbWVvdXQgKGludCkK
PiAtICogU2V0IEdQVSBzY2hlZHVsZXIgdGltZW91dCB2YWx1ZSBpbiBtcy4gVmFsdWUgMCBpcyBp
bnZhbGlkYXRlZCwgd2lsbCBiZSBhZGp1c3RlZCB0byAxMDAwMC4KPiAtICogTmVnYXRpdmUgdmFs
dWVzIG1lYW4gJ2luZmluaXRlIHRpbWVvdXQnIChNQVhfSklGRllfT0ZGU0VUKS4gVGhlIGRlZmF1
bHQgaXMgMTAwMDAuCj4gKyAqIERPQzogbG9ja3VwX3RpbWVvdXQgKHN0cmluZykKPiArICogU2V0
IEdQVSBzY2hlZHVsZXIgdGltZW91dCB2YWx1ZSBpbiBtcy4KPiArICoKPiArICogVGhlIGZvcm1h
dCBpcyBub24tY29tcHV0ZVsuZ2Z4LnNkbWEudmlkZW9dWzpjb21wdXRlXS4KPiArICogV2l0aCBu
byAibm9uLWNvbXB1dGVbLmdmeC5zZG1hLnZpZGVvXSIgdGltZW91dCBzcGVjaWZpZWQsIHRoZSBk
ZWZhdWx0IHRpbWVvdXQgZm9yIG5vbi1jb21wdXRlX2pvYiBpcyAxMDAwMC4KPiArICogVGhlICJu
b24tY29tcHV0ZSIgdGltZW91dCBzZXR0aW5nIGFwcGx5cyB0byBhbGwgbm9uIGNvbXB1dGUgSVBz
KGdmeCwgc2RtYSBhbmQgdmlkZW8pLiBVbmxlc3MKPiArICogdGhlIHRpbWVvdXQgZm9yIHRoaXMg
SVAgaXMgc3BlY2lmaWVkIHNlcGFyYXRlbHkoYnkgIlsuZ2Z4LnNkbWEudmlkZW9dIikuCgpBIGRv
dCBpcyBhIGJpdCB3ZWlyZCBhcyBhIHNlcGFyYXRvciwgY29tbWEgKG9yIG1heWJlIHNlbWljb2xv
bikgd291bGQgYmUKYmV0dGVyLgoKQWxzbywgaW5zdGVhZCBvZiByZXF1aXJpbmcgYSBnZW5lcmFs
IG5vbi1jb21wdXRlIHZhbHVlICh3aGljaCBpcyB1bnVzZWQKaWYgYWxsIDMgZW5naW5lIHNwZWNp
ZmljIHZhbHVlcyBhcmUgc3BlY2lmaWVkKSBiZWZvcmUgdGhlIGVuZ2luZQpzcGVjaWZpYyBvbmVz
LCBob3cgYWJvdXQ6IElmIG9ubHkgb25lIG5vbi1jb21wdXRlIHZhbHVlIGlzIHNwZWNpZmllZCwg
aXQKYXBwbGllcyB0byBhbGwgbm9uLWNvbXB1dGUgZW5naW5lcy4gSWYgbXVsdGlwbGUgdmFsdWVz
IGFyZSBzcGVjaWZpZWQsCnRoZSBmaXJzdCBvbmUgaXMgZm9yIEdGWCwgc2Vjb25kIG9uZSBmb3Ig
U0RNQSwgdGhpcmQgb25lIGZvciB2aWRlby4KCgo+IEBAIC0xMzA3LDYgKzEzMTcsNjYgQEAgaW50
IGFtZGdwdV9maWxlX3RvX2Zwcml2KHN0cnVjdCBmaWxlICpmaWxwLCBzdHJ1Y3QgYW1kZ3B1X2Zw
cml2ICoqZnByaXYpCj4gIAlyZXR1cm4gMDsKPiAgfQo+ICAKPiAraW50IGFtZGdwdV9kZXZpY2Vf
Z2V0X2pvYl90aW1lb3V0KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQo+ICt7Cj4gKwljaGFy
ICppbnB1dCA9IGFtZGdwdV9sb2NrdXBfdGltZW91dDsKPiArCWNoYXIgKm5vbl9jb21wdXRlX3Nl
dHRpbmcgPSBOVUxMOwo+ICsJY2hhciAqdGltZW91dF9zZXR0aW5nID0gTlVMTDsKPiArCWludCBp
bmRleCA9IDA7Cj4gKwlpbnQgcmV0ID0gMDsKPiArCj4gKwkvKiBEZWZhdWx0IHRpbWVvdXQgZm9y
IG5vbiBjb21wdXRlIGpvYiBpcyAxMDAwMCAqLwo+ICsJYWRldi0+Z2Z4X3RpbWVvdXQgPQo+ICsJ
CWFkZXYtPnNkbWFfdGltZW91dCA9Cj4gKwkJCWFkZXYtPnZpZGVvX3RpbWVvdXQgPSAxMDAwMDsK
ClRoaXMgaXMgYSBiaXQgd2VpcmQgZm9ybWF0dGluZy4gOikgTWF5YmUgaXQgY2FuIGJlIG9uZSBv
ciB0d28gbGluZXMsCm90aGVyd2lzZSB0aGUgc2Vjb25kIGNvbnRpbnVhdGlvbiBsaW5lIHNob3Vs
ZCBoYXZlIHRoZSBzYW1lIGluZGVudGF0aW9uCmFzIHRoZSBmaXJzdCBvbmUuCgoKPiArCS8qIEVu
Zm9yY2Ugbm8gdGltZW91dCBvbiBjb21wdXRlIGpvYiBhdCBkZWZhdWx0ICovCgoiYnkgZGVmYXVs
dCIgKHNhbWUgaW4gYW1kZ3B1X2ZlbmNlX2RyaXZlcl9pbml0X3JpbmcpLgoKCi0tIApFYXJ0aGxp
bmcgTWljaGVsIETDpG56ZXIgICAgICAgICAgICAgICB8ICAgICAgICAgICAgICBodHRwczovL3d3
dy5hbWQuY29tCkxpYnJlIHNvZnR3YXJlIGVudGh1c2lhc3QgICAgICAgICAgICAgfCAgICAgICAg
ICAgICBNZXNhIGFuZCBYIGRldmVsb3BlcgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2FtZC1nZng=
