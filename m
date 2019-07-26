Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB10376C1D
	for <lists+amd-gfx@lfdr.de>; Fri, 26 Jul 2019 16:54:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEF2E6ED94;
	Fri, 26 Jul 2019 14:54:13 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from netline-mail3.netline.ch (mail.netline.ch [148.251.143.178])
 by gabe.freedesktop.org (Postfix) with ESMTP id DE0A76ED94
 for <amd-gfx@lists.freedesktop.org>; Fri, 26 Jul 2019 14:54:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by netline-mail3.netline.ch (Postfix) with ESMTP id AD9792A6042;
 Fri, 26 Jul 2019 16:54:11 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at netline-mail3.netline.ch
Received: from netline-mail3.netline.ch ([127.0.0.1])
 by localhost (netline-mail3.netline.ch [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id woYJjVXQV3BC; Fri, 26 Jul 2019 16:54:11 +0200 (CEST)
Received: from thor (116.245.63.188.dynamic.wline.res.cust.swisscom.ch
 [188.63.245.116])
 by netline-mail3.netline.ch (Postfix) with ESMTPSA id 0951E2A6016;
 Fri, 26 Jul 2019 16:54:11 +0200 (CEST)
Received: from localhost ([::1]) by thor with esmtp (Exim 4.92)
 (envelope-from <michel@daenzer.net>)
 id 1hr1bb-0007Gi-IV; Fri, 26 Jul 2019 16:53:59 +0200
Subject: Re: [PATCH v5 2/4] drm/amdgpu: Create helper to clear
 AMDGPU_GEM_CREATE_CPU_GTT_USWC
To: christian.koenig@amd.com, Andrey Grodzovsky <andrey.grodzovsky@amd.com>
References: <1564064683-31796-1-git-send-email-andrey.grodzovsky@amd.com>
 <1564064683-31796-3-git-send-email-andrey.grodzovsky@amd.com>
 <1723b531-097f-2687-6dc9-9de6e3e378a1@gmail.com>
 <fdf2600a-b0ef-bdca-f22b-51427bef9531@daenzer.net>
 <881edbab-df57-a1d7-bcf3-987fdbb384db@gmail.com>
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
Message-ID: <7c62edf1-0e3b-d57e-fd33-f98198b6c23a@daenzer.net>
Date: Fri, 26 Jul 2019 16:53:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <881edbab-df57-a1d7-bcf3-987fdbb384db@gmail.com>
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
Cc: Alexander.Deucher@amd.com, hersenxs.wu@amd.com,
 amd-gfx@lists.freedesktop.org, shirish.s@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gMjAxOS0wNy0yNiAxOjU1IHAubS4sIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6Cj4gQW0gMjYu
MDcuMTkgdW0gMTA6NTQgc2NocmllYiBNaWNoZWwgRMOkbnplcjoKPj4gT24gMjAxOS0wNy0yNiA5
OjExIGEubS4sIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6Cj4+PiBBbSAyNS4wNy4xOSB1bSAxNjoy
NCBzY2hyaWViIEFuZHJleSBHcm9kem92c2t5Ogo+Pj4+IE1vdmUgdGhlIGxvZ2ljIHRvIGNsZWFy
IEFNREdQVV9HRU1fQ1JFQVRFX0NQVV9HVFRfVVNXQyBpbgo+Pj4+IGFtZGdwdV9ib19kb19jcmVh
dGUgaW50byBzdGFuZGFsb25lIGhlbHBlciBzbyBpdCBjYW4gYmUgcmV1c2VkCj4+Pj4gaW4gb3Ro
ZXIgZnVuY3Rpb25zLgo+Pj4+Cj4+Pj4gdjQ6Cj4+Pj4gU3dpdGNoIHRvIHJldHVybiBib29sLgo+
Pj4+Cj4+Pj4gdjU6IEZpeCB0eXBvcy4KPj4+Pgo+Pj4+IFNpZ25lZC1vZmYtYnk6IEFuZHJleSBH
cm9kem92c2t5IDxhbmRyZXkuZ3JvZHpvdnNreUBhbWQuY29tPgo+Pj4+IC0tLQo+Pj4+IMKgwqAg
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X29iamVjdC5jIHwgNjEKPj4+PiArKysr
KysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0KPj4+PiDCoMKgIGRyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV9vYmplY3QuaCB8wqAgMiArCj4+Pj4gwqDCoCAyIGZpbGVzIGNoYW5nZWQs
IDM3IGluc2VydGlvbnMoKyksIDI2IGRlbGV0aW9ucygtKQo+Pj4+Cj4+Pj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9vYmplY3QuYwo+Pj4+IGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X29iamVjdC5jCj4+Pj4gaW5kZXggOTg5YjdiNS4u
ODcwMjA2MiAxMDA2NDQKPj4+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfb2JqZWN0LmMKPj4+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
b2JqZWN0LmMKPj4+PiBAQCAtNDEzLDYgKzQxMyw0MCBAQCBzdGF0aWMgYm9vbCBhbWRncHVfYm9f
dmFsaWRhdGVfc2l6ZShzdHJ1Y3QKPj4+PiBhbWRncHVfZGV2aWNlICphZGV2LAo+Pj4+IMKgwqDC
oMKgwqDCoCByZXR1cm4gZmFsc2U7Cj4+Pj4gwqDCoCB9Cj4+Pj4gwqDCoCArYm9vbCBhbWRncHVf
Ym9fc3VwcG9ydF91c3djKHU2NCBib19mbGFncykKPj4+PiArewo+Pj4+ICsKPj4+PiArI2lmZGVm
IENPTkZJR19YODZfMzIKPj4+PiArwqDCoMKgIC8qIFhYWDogV3JpdGUtY29tYmluZWQgQ1BVIG1h
cHBpbmdzIG9mIEdUVCBzZWVtIGJyb2tlbiBvbiAzMi1iaXQKPj4+PiArwqDCoMKgwqAgKiBTZWUg
aHR0cHM6Ly9idWdzLmZyZWVkZXNrdG9wLm9yZy9zaG93X2J1Zy5jZ2k/aWQ9ODQ2MjcKPj4+PiAr
wqDCoMKgwqAgKi8KPj4+PiArwqDCoMKgIHJldHVybiBmYWxzZTsKPj4+PiArI2VsaWYgZGVmaW5l
ZChDT05GSUdfWDg2KSAmJiAhZGVmaW5lZChDT05GSUdfWDg2X1BBVCkKPj4+PiArwqDCoMKgIC8q
IERvbid0IHRyeSB0byBlbmFibGUgd3JpdGUtY29tYmluaW5nIHdoZW4gaXQgY2FuJ3Qgd29yaywg
b3IKPj4+PiB0aGluZ3MKPj4+PiArwqDCoMKgwqAgKiBtYXkgYmUgc2xvdwo+Pj4+ICvCoMKgwqDC
oCAqIFNlZSBodHRwczovL2J1Z3MuZnJlZWRlc2t0b3Aub3JnL3Nob3dfYnVnLmNnaT9pZD04ODc1
OAo+Pj4+ICvCoMKgwqDCoCAqLwo+Pj4+ICsKPj4+PiArI2lmbmRlZiBDT05GSUdfQ09NUElMRV9U
RVNUCj4+Pj4gKyN3YXJuaW5nIFBsZWFzZSBlbmFibGUgQ09ORklHX01UUlIgYW5kIENPTkZJR19Y
ODZfUEFUIGZvciBiZXR0ZXIKPj4+PiBwZXJmb3JtYW5jZSBcCj4+Pj4gK8KgwqDCoMKgIHRoYW5r
cyB0byB3cml0ZS1jb21iaW5pbmcKPj4+PiArI2VuZGlmCj4+Pj4gKwo+Pj4+ICvCoMKgwqAgaWYg
KGJvX2ZsYWdzICYgQU1ER1BVX0dFTV9DUkVBVEVfQ1BVX0dUVF9VU1dDKQo+Pj4+ICvCoMKgwqDC
oMKgwqDCoCBEUk1fSU5GT19PTkNFKCJQbGVhc2UgZW5hYmxlIENPTkZJR19NVFJSIGFuZCBDT05G
SUdfWDg2X1BBVAo+Pj4+IGZvciAiCj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgImJldHRlciBwZXJmb3JtYW5jZSB0aGFua3MgdG8gd3JpdGUtY29tYmluaW5nXG4iKTsK
Pj4+IEkgZG9uJ3QgdGhpbmsgdGhpcyBtZXNzYWdlIGJlbG9uZ3MgaGVyZS4KPj4+Cj4+PiBbLi4u
XQo+Pj4+IEBAIC00NjYsMzMgKzUwMCw4IEBAIHN0YXRpYyBpbnQgYW1kZ3B1X2JvX2RvX2NyZWF0
ZShzdHJ1Y3QKPj4+PiBbLi4uXQo+Pj4+ICvCoMKgwqAgaWYgKCFhbWRncHVfYm9fc3VwcG9ydF91
c3djKGJvLT5mbGFncykpCj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqAgYm8tPmZsYWdzICY9IH5B
TURHUFVfR0VNX0NSRUFURV9DUFVfR1RUX1VTV0M7Cj4+PiBSYXRoZXIgaGVyZSB3ZSBzaG91bGQg
ZG8gImlmIChib19mbGFncyAmIEFNREdQVV9HRU1fQ1JFQVRFX0NQVV9HVFRfVVNXQwo+Pj4gJiYg
IWFtZGdwdV9ib19zdXBwb3J0X3Vzd2MoKSkiIGFuZCB0aGVuIGNsZWFyIHRoZSBmbGFnIGFuZCBh
bHNvIHByaW50Cj4+PiB0aGUgd2FybmluZy4KPj4gVGhhdCB3b3VsZCByZXF1aXJlIGR1cGxpY2F0
aW5nIHRoZSBDT05GSUdfWDg2X1BBVCByZWxhdGVkIGxvZ2ljIGhlcmUgYXMKPj4gd2VsbCwgd2hp
Y2ggaXMgYSBiaXQgdWdseS4KPiAKPiBBY3R1YWxseSBJIHdvdWxkIHNheSB3ZSBzaG91bGQgZHJv
cCB0aGlzIGV4dHJhIGNoZWNrIGFuZCBhbHdheXMgZW1pdCBhCj4gbWVzc2FnZSB0aGF0IFVTV0Mg
aXMgZGlzYWJsZWQgZm9yIHRoaXMgcGxhdGZvcm0uCj4gCj4gV2Ugbm93IG5lZWQgaXQgZm9yIG1v
cmUgdGhhbiBqdXN0IGJldHRlciBwZXJmb3JtYW5jZSBhbmQgaXQgc2hvdWxkIGJlCj4gZXhwbGlj
aXRseSBub3RlZCB0aGF0IHRoaXMgaXMgbm90IGF2YWlsYWJsZSBpbiB0aGUgbG9ncy4KCkEgbG9n
IG1lc3NhZ2Ugd2hpY2ggZG9lc24ndCBleHBsYWluIHdoeSBpdCdzIGRpc2FibGVkIC8gaG93IHRv
IGVuYWJsZSBpdAp3b3VsZCBwcm9iYWJseSBjYXVzZSB1cyB1c2VyIHN1cHBvcnQgcGFpbi4KCgot
LSAKRWFydGhsaW5nIE1pY2hlbCBEw6RuemVyICAgICAgICAgICAgICAgfCAgICAgICAgICAgICAg
aHR0cHM6Ly93d3cuYW1kLmNvbQpMaWJyZSBzb2Z0d2FyZSBlbnRodXNpYXN0ICAgICAgICAgICAg
IHwgICAgICAgICAgICAgTWVzYSBhbmQgWCBkZXZlbG9wZXIKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9hbWQtZ2Z4
