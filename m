Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EBF4865348
	for <lists+amd-gfx@lfdr.de>; Thu, 11 Jul 2019 10:44:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8D8A88F0D;
	Thu, 11 Jul 2019 08:44:19 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from netline-mail3.netline.ch (mail.netline.ch [148.251.143.178])
 by gabe.freedesktop.org (Postfix) with ESMTP id B84766E161
 for <amd-gfx@lists.freedesktop.org>; Thu, 11 Jul 2019 08:44:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by netline-mail3.netline.ch (Postfix) with ESMTP id C900A2B200F;
 Thu, 11 Jul 2019 10:44:17 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at netline-mail3.netline.ch
Received: from netline-mail3.netline.ch ([127.0.0.1])
 by localhost (netline-mail3.netline.ch [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id YOCxTFFf1r2n; Thu, 11 Jul 2019 10:44:17 +0200 (CEST)
Received: from thor (116.245.63.188.dynamic.wline.res.cust.swisscom.ch
 [188.63.245.116])
 by netline-mail3.netline.ch (Postfix) with ESMTPSA id 37F252AA047;
 Thu, 11 Jul 2019 10:44:17 +0200 (CEST)
Received: from localhost ([::1]) by thor with esmtp (Exim 4.92)
 (envelope-from <michel@daenzer.net>)
 id 1hlUgU-0006LM-LD; Thu, 11 Jul 2019 10:44:10 +0200
Subject: Re: [PATCH 1/3] drm/amdgpu: Add flag for allocating memory for
 sensitive data
To: "Kuehling, Felix" <Felix.Kuehling@amd.com>
References: <20190709053222.22588-1-Felix.Kuehling@amd.com>
 <b1a0638a-4be3-0a7b-7d29-309942f24263@daenzer.net>
 <da90e4c0-067b-2ffe-01df-f59c2b7ec556@amd.com>
 <519e26e8-c363-2b4c-756c-d87fbe2543d9@daenzer.net>
 <11769749-a0de-e121-e0f6-eeba7bae58e2@amd.com>
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
Message-ID: <3e85390b-1512-d504-26da-780afd84c8a8@daenzer.net>
Date: Thu, 11 Jul 2019 10:44:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <11769749-a0de-e121-e0f6-eeba7bae58e2@amd.com>
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
Cc: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gMjAxOS0wNy0xMCA4OjU4IHAubS4sIEt1ZWhsaW5nLCBGZWxpeCB3cm90ZToKPiBPbiAyMDE5
LTA3LTEwIDM6MjIgYS5tLiwgTWljaGVsIETDpG56ZXIgd3JvdGU6Cj4+IE9uIDIwMTktMDctMDkg
OTowMCBwLm0uLCBLdWVobGluZywgRmVsaXggd3JvdGU6Cj4+PiBPbiAyMDE5LTA3LTA5IDY6MzQg
YS5tLiwgTWljaGVsIETDpG56ZXIgd3JvdGU6Cj4+Pj4gT24gMjAxOS0wNy0wOSA3OjMyIGEubS4s
IEt1ZWhsaW5nLCBGZWxpeCB3cm90ZToKPj4+Pj4gVGhpcyBtZW1vcnkgYWxsb2NhdGlvbiBmbGFn
IHdpbGwgYmUgdXNlZCB0byBpbmRpY2F0ZSBCT3MgY29udGFpbmluZwo+Pj4+PiBzZW5zaXRpdmUg
ZGF0YSB0aGF0IHNob3VsZCBub3QgYmUgbGVha2VkIHRvIG90aGVyIHByb2Nlc3Nlcy4KPj4+Pj4K
Pj4+Pj4gU2lnbmVkLW9mZi1ieTogRmVsaXggS3VlaGxpbmcgPEZlbGl4Lkt1ZWhsaW5nQGFtZC5j
b20+Cj4+Pj4+IC0tLQo+Pj4+PiAgICBpbmNsdWRlL3VhcGkvZHJtL2FtZGdwdV9kcm0uaCB8IDQg
KysrKwo+Pj4+PiAgICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspCj4+Pj4+Cj4+Pj4+
IGRpZmYgLS1naXQgYS9pbmNsdWRlL3VhcGkvZHJtL2FtZGdwdV9kcm0uaCBiL2luY2x1ZGUvdWFw
aS9kcm0vYW1kZ3B1X2RybS5oCj4+Pj4+IGluZGV4IDYxODcwNDc4YmM5Yy4uNTg2NTljMjhjMjZl
IDEwMDY0NAo+Pj4+PiAtLS0gYS9pbmNsdWRlL3VhcGkvZHJtL2FtZGdwdV9kcm0uaAo+Pj4+PiAr
KysgYi9pbmNsdWRlL3VhcGkvZHJtL2FtZGdwdV9kcm0uaAo+Pj4+PiBAQCAtMTMxLDYgKzEzMSwx
MCBAQCBleHRlcm4gIkMiIHsKPj4+Pj4gICAgICogZm9yIHRoZSBzZWNvbmQgcGFnZSBvbndhcmQg
c2hvdWxkIGJlIHNldCB0byBOQy4KPj4+Pj4gICAgICovCj4+Pj4+ICAgICNkZWZpbmUgQU1ER1BV
X0dFTV9DUkVBVEVfTVFEX0dGWDkJCSgxIDw8IDgpCj4+Pj4+ICsvKiBGbGFnIHRoYXQgQk8gbWF5
IGNvbnRhaW4gc2Vuc2l0aXZlIGRhdGEgdGhhdCBtdXN0IGJlIGNsZWFyZWQgYmVmb3JlCj4+Pj4+
ICsgKiByZWxlYXNpbmcgdGhlIG1lbW9yeQo+Pj4+PiArICovCj4+Pj4+ICsjZGVmaW5lIEFNREdQ
VV9HRU1fQ1JFQVRFX1ZSQU1fU0VOU0lUSVZFCSgxIDw8IDkpCj4+Pj4+ICAgIAo+Pj4+PiAgICBz
dHJ1Y3QgZHJtX2FtZGdwdV9nZW1fY3JlYXRlX2luICB7Cj4+Pj4+ICAgIAkvKiogdGhlIHJlcXVl
c3RlZCBtZW1vcnkgc2l6ZSAqLwo+Pj4+Pgo+Pj4+IFRoaXMgZmxhZyBlc3NlbnRpYWxseSBtZWFu
cyAiUGxlYXNlIGRvbid0IGxlYWsgbXkgQk8gY29udGVudHMiLgo+Pj4+IFNpbWlsYXJseSwgQU1E
R1BVX0dFTV9DUkVBVEVfVlJBTV9DTEVBUkVEIGVzc2VudGlhbGx5IG1lYW5zICJQbGVhc2UKPj4+
PiBkb24ndCBsZXQgbWUgc2VlIHByZXZpb3VzIG1lbW9yeSBjb250ZW50cyIuCj4+Pj4KPj4+PiBJ
J2QgYXJndWUgdGhhdCBuZWl0aGVyIGZsYWcgc2hvdWxkIHJlYWxseSBiZSBuZWVkZWQ7IEJPIGNv
bnRlbnRzCj4+Pj4gc2hvdWxkbid0IGJlIGxlYWtlZCBieSBkZWZhdWx0Lgo+Pj4gTXkgY29uY2x1
c2lvbiBmcm9tIHByZXZpb3VzIGRpc2N1c3Npb25zIHdhcyB0aGF0IENSRUFURV9WUkFNX0NMRUFS
RUQgaGFzCj4+PiBubyBzZWN1cml0eSBpbXBsaWNhdGlvbnMuIEl0J3MgYmFzaWNhbGx5IGNvbXBs
ZXRlbHkgaW5lZmZlY3RpdmUgYXMgYQo+Pj4gc2VjdXJpdHkgbWVhc3VyZS4KPj4gQWJzb2x1dGVs
eSwgd2hpY2ggaXMgd2h5IEkgYXJndWVkIGFnYWluc3QgaXQgd2hlbiBpdCB3YXMgcHJvcG9zZWQu
Cj4+Cj4+PiBJdCdzIG1vcmUgYSBjb252ZW5pZW5jZSBmZWF0dXJlLiBUaGVyZWZvcmUgSSB0aGlu
ayBpdCBzdGlsbCBoYXMgYSBwbGFjZQo+Pj4gYXMgdGhhdC4KPj4gSXQnZCBiZSBhIG5vLW9wIGlm
IG1lbW9yeSB3YXMgYWx3YXlzIGNsZWFyZWQuIDopCj4+Cj4+Cj4+PiBJJ2QgYWdyZWUgb24gcHJp
bmNpcGxlIHRoYXQgZGF0YSBzaG91bGRuJ3QgYmUgbGVha2VkIGJ5IGRlZmF1bHQsIGJ1dCBpdAo+
Pj4gaGFzIGJlZW4gdGhlIGRlZmF1bHQgZm9yIGEgbG9uZyB0aW1lLiBNeSBpbXByZXNzaW9uIHdh
cyB0aGF0IGdyYXBoaWNzCj4+PiBndXlzIGNhcmVkIG1vcmUgYWJvdXQgcGVyZm9ybWFuY2UgdGhh
biBzZWN1cml0eS4gU28gY2hhbmdpbmcgdGhlIGRlZmF1bHQKPj4+IG1heSBiZSBhIGhhcmQgc2Vs
bC4gT24gdGhlIGNvbXB1dGUgc2lkZSB3ZSBhbHJlYWR5IHRvb2sgYSBiaWcKPj4+IHBlcmZvcm1h
bmNlIGhpdCBieSBjbGVhcmluZyBhbGwgb3VyIFZSQU0sIHNvIHRoaXMgY2hhbmdlIHdvdWxkIGJl
IGFuCj4+PiBpbXByb3ZlbWVudCBmb3IgdXMuIFRoZXJlZm9yZSBJIHRoaW5rIGl0IHN0aWxsIG1h
a2VzIHNlbnNlIHRvIGxldCB0aGUKPj4+IGFwcGxpY2F0aW9uIGNob29zZS4KPj4gV2hhdCBleGFj
dGx5IGNvdWxkIHVzZXJzcGFjZSBiZSBhbGxvd2VkIHRvIGNob29zZSB0aG91Z2g/IEkgY2FuIG9u
bHkKPj4gdGhpbmsgb2YgZGlzYWJsaW5nIHRoZSBjbGVhcmluZyBvZiBtZW1vcnkgaXQgYWxsb2Nh
dGVzICgiUGxlYXNlIGxlYWsgbXkKPj4gQk8gY29udGVudHMiKSwgd2hpY2ggc2VlbXMgb2YgcmF0
aGVyIGR1YmlvdXMgdmFsdWUuCj4gCj4gSSdtIG5vdCBpbnNpc3RpbmcgdG8gbGVhdmUgaXQgdG8g
dXNlciBtb2RlLiBCdXQgSSB0aGluayBpdCBtYWtlcyBzZW5zZSAKPiB0byBoYXZlIHRoZSBjaG9p
Y2UgcGVyIEJPLiBUaGUgR0VNIGlvY3RsIGNvdWxkIHNldCB0aGUgZmxhZyBieSBkZWZhdWx0IAo+
IGZvciBhbGwgdXNlciBtb2RlIGFsbG9jYXRpb25zLiBCdXQgc29tZSBrZXJuZWwgbW9kZSBCT3Mg
bWF5IG5vdCBuZWVkIGl0LiAKPiBFLmcuIGZpcm13YXJlLCBwYWdlIHRhYmxlcywgZXRjLgoKTGVh
a2luZyBwYWdlIHRhYmxlIGNvbnRlbnRzIHNvdW5kcyByaXNreSB0byBtZS4gVGhlcmUgbWF5IGJl
IG90aGVyIGNhc2VzCndoZXJlIGl0J3MgcmVhbGx5IG5vdCBuZWVkZWQsIGJ1dCBpdCB0ZW5kcyB0
byBiZSBoYXJkIHRvIHByZWRpY3QgaG93CmxlYWtlZCBkYXRhIGNvdWxkIGJlIGV4cGxvaXRlZC4K
Cgo+IFRoZXJlIGFyZSBvdGhlciBBTURHUFVfR0VNX0NSRUFURV8gZmxhZ3MgdGhhdCBkb24ndCBt
YWtlIHNlbnNlIGZvciB1c2VyIAo+IG1vZGUgdG8gY2hvb3NlLiBUaGlzIGp1c3QgYWRkcyBvbmUg
bW9yZS4KCkFzIGEgZ2VuZXJhbCBub3RlIG5vdCBzcGVjaWZpYyB0byB0aGlzIHBhdGNoLCBpdCB3
b3VsZCBiZSBiZXR0ZXIgaWYgc3VjaApmbGFncyB3ZXJlbid0IGluIHRoZSBVQVBJIGhlYWRlciAo
YW5kIG1heWJlIG5vdCBuYW1lZCBBTURHUFVfR0VNXyopLgoKCi0tIApFYXJ0aGxpbmcgTWljaGVs
IETDpG56ZXIgICAgICAgICAgICAgICB8ICAgICAgICAgICAgICBodHRwczovL3d3dy5hbWQuY29t
CkxpYnJlIHNvZnR3YXJlIGVudGh1c2lhc3QgICAgICAgICAgICAgfCAgICAgICAgICAgICBNZXNh
IGFuZCBYIGRldmVsb3BlcgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
