Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B250A76E9F
	for <lists+amd-gfx@lfdr.de>; Fri, 26 Jul 2019 18:09:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C40C6EDBD;
	Fri, 26 Jul 2019 16:09:46 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from netline-mail3.netline.ch (mail.netline.ch [148.251.143.178])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1311B6EDBD
 for <amd-gfx@lists.freedesktop.org>; Fri, 26 Jul 2019 16:09:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by netline-mail3.netline.ch (Postfix) with ESMTP id 221542A6042;
 Fri, 26 Jul 2019 18:09:43 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at netline-mail3.netline.ch
Received: from netline-mail3.netline.ch ([127.0.0.1])
 by localhost (netline-mail3.netline.ch [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id msTrsGEwyXTe; Fri, 26 Jul 2019 18:09:42 +0200 (CEST)
Received: from thor (116.245.63.188.dynamic.wline.res.cust.swisscom.ch
 [188.63.245.116])
 by netline-mail3.netline.ch (Postfix) with ESMTPSA id 9A0132A6016;
 Fri, 26 Jul 2019 18:09:42 +0200 (CEST)
Received: from localhost ([::1]) by thor with esmtp (Exim 4.92)
 (envelope-from <michel@daenzer.net>)
 id 1hr2mm-0007mU-Db; Fri, 26 Jul 2019 18:09:36 +0200
Subject: Re: [PATCH v5 2/4] drm/amdgpu: Create helper to clear
 AMDGPU_GEM_CREATE_CPU_GTT_USWC
To: christian.koenig@amd.com, Andrey Grodzovsky <andrey.grodzovsky@amd.com>
References: <1564064683-31796-1-git-send-email-andrey.grodzovsky@amd.com>
 <1564064683-31796-3-git-send-email-andrey.grodzovsky@amd.com>
 <1723b531-097f-2687-6dc9-9de6e3e378a1@gmail.com>
 <fdf2600a-b0ef-bdca-f22b-51427bef9531@daenzer.net>
 <881edbab-df57-a1d7-bcf3-987fdbb384db@gmail.com>
 <7c62edf1-0e3b-d57e-fd33-f98198b6c23a@daenzer.net>
 <973beeaf-735c-777d-c493-cdfdde2dd2f1@gmail.com>
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
Message-ID: <ed295b9a-5d38-aabc-d47a-9b681d790894@daenzer.net>
Date: Fri, 26 Jul 2019 18:09:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <973beeaf-735c-777d-c493-cdfdde2dd2f1@gmail.com>
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

T24gMjAxOS0wNy0yNiA2OjAyIHAubS4sIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6Cj4gQW0gMjYu
MDcuMTkgdW0gMTY6NTMgc2NocmllYiBNaWNoZWwgRMOkbnplcjoKPj4gT24gMjAxOS0wNy0yNiAx
OjU1IHAubS4sIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6Cj4+PiBBbSAyNi4wNy4xOSB1bSAxMDo1
NCBzY2hyaWViIE1pY2hlbCBEw6RuemVyOgo+Pj4+IE9uIDIwMTktMDctMjYgOToxMSBhLm0uLCBD
aHJpc3RpYW4gS8O2bmlnIHdyb3RlOgo+Pj4+PiBBbSAyNS4wNy4xOSB1bSAxNjoyNCBzY2hyaWVi
IEFuZHJleSBHcm9kem92c2t5Ogo+Pj4+Pj4gTW92ZSB0aGUgbG9naWMgdG8gY2xlYXIgQU1ER1BV
X0dFTV9DUkVBVEVfQ1BVX0dUVF9VU1dDIGluCj4+Pj4+PiBhbWRncHVfYm9fZG9fY3JlYXRlIGlu
dG8gc3RhbmRhbG9uZSBoZWxwZXIgc28gaXQgY2FuIGJlIHJldXNlZAo+Pj4+Pj4gaW4gb3RoZXIg
ZnVuY3Rpb25zLgo+Pj4+Pj4KPj4+Pj4+IHY0Ogo+Pj4+Pj4gU3dpdGNoIHRvIHJldHVybiBib29s
Lgo+Pj4+Pj4KPj4+Pj4+IHY1OiBGaXggdHlwb3MuCj4+Pj4+Pgo+Pj4+Pj4gU2lnbmVkLW9mZi1i
eTogQW5kcmV5IEdyb2R6b3Zza3kgPGFuZHJleS5ncm9kem92c2t5QGFtZC5jb20+Cj4+Pj4+PiAt
LS0KPj4+Pj4+IMKgwqDCoCBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfb2JqZWN0
LmMgfCA2MQo+Pj4+Pj4gKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tCj4+Pj4+PiDCoMKg
wqAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X29iamVjdC5oIHzCoCAyICsKPj4+
Pj4+IMKgwqDCoCAyIGZpbGVzIGNoYW5nZWQsIDM3IGluc2VydGlvbnMoKyksIDI2IGRlbGV0aW9u
cygtKQo+Pj4+Pj4KPj4+Pj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfb2JqZWN0LmMKPj4+Pj4+IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1X29iamVjdC5jCj4+Pj4+PiBpbmRleCA5ODliN2I1Li44NzAyMDYyIDEwMDY0NAo+Pj4+Pj4g
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X29iamVjdC5jCj4+Pj4+PiAr
KysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfb2JqZWN0LmMKPj4+Pj4+IEBA
IC00MTMsNiArNDEzLDQwIEBAIHN0YXRpYyBib29sIGFtZGdwdV9ib192YWxpZGF0ZV9zaXplKHN0
cnVjdAo+Pj4+Pj4gYW1kZ3B1X2RldmljZSAqYWRldiwKPj4+Pj4+IMKgwqDCoMKgwqDCoMKgIHJl
dHVybiBmYWxzZTsKPj4+Pj4+IMKgwqDCoCB9Cj4+Pj4+PiDCoMKgwqAgK2Jvb2wgYW1kZ3B1X2Jv
X3N1cHBvcnRfdXN3Yyh1NjQgYm9fZmxhZ3MpCj4+Pj4+PiArewo+Pj4+Pj4gKwo+Pj4+Pj4gKyNp
ZmRlZiBDT05GSUdfWDg2XzMyCj4+Pj4+PiArwqDCoMKgIC8qIFhYWDogV3JpdGUtY29tYmluZWQg
Q1BVIG1hcHBpbmdzIG9mIEdUVCBzZWVtIGJyb2tlbiBvbiAzMi1iaXQKPj4+Pj4+ICvCoMKgwqDC
oCAqIFNlZSBodHRwczovL2J1Z3MuZnJlZWRlc2t0b3Aub3JnL3Nob3dfYnVnLmNnaT9pZD04NDYy
Nwo+Pj4+Pj4gK8KgwqDCoMKgICovCj4+Pj4+PiArwqDCoMKgIHJldHVybiBmYWxzZTsKPj4+Pj4+
ICsjZWxpZiBkZWZpbmVkKENPTkZJR19YODYpICYmICFkZWZpbmVkKENPTkZJR19YODZfUEFUKQo+
Pj4+Pj4gK8KgwqDCoCAvKiBEb24ndCB0cnkgdG8gZW5hYmxlIHdyaXRlLWNvbWJpbmluZyB3aGVu
IGl0IGNhbid0IHdvcmssIG9yCj4+Pj4+PiB0aGluZ3MKPj4+Pj4+ICvCoMKgwqDCoCAqIG1heSBi
ZSBzbG93Cj4+Pj4+PiArwqDCoMKgwqAgKiBTZWUgaHR0cHM6Ly9idWdzLmZyZWVkZXNrdG9wLm9y
Zy9zaG93X2J1Zy5jZ2k/aWQ9ODg3NTgKPj4+Pj4+ICvCoMKgwqDCoCAqLwo+Pj4+Pj4gKwo+Pj4+
Pj4gKyNpZm5kZWYgQ09ORklHX0NPTVBJTEVfVEVTVAo+Pj4+Pj4gKyN3YXJuaW5nIFBsZWFzZSBl
bmFibGUgQ09ORklHX01UUlIgYW5kIENPTkZJR19YODZfUEFUIGZvciBiZXR0ZXIKPj4+Pj4+IHBl
cmZvcm1hbmNlIFwKPj4+Pj4+ICvCoMKgwqDCoCB0aGFua3MgdG8gd3JpdGUtY29tYmluaW5nCj4+
Pj4+PiArI2VuZGlmCj4+Pj4+PiArCj4+Pj4+PiArwqDCoMKgIGlmIChib19mbGFncyAmIEFNREdQ
VV9HRU1fQ1JFQVRFX0NQVV9HVFRfVVNXQykKPj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCBEUk1fSU5G
T19PTkNFKCJQbGVhc2UgZW5hYmxlIENPTkZJR19NVFJSIGFuZCBDT05GSUdfWDg2X1BBVAo+Pj4+
Pj4gZm9yICIKPj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICJiZXR0
ZXIgcGVyZm9ybWFuY2UgdGhhbmtzIHRvIHdyaXRlLWNvbWJpbmluZ1xuIik7Cj4+Pj4+IEkgZG9u
J3QgdGhpbmsgdGhpcyBtZXNzYWdlIGJlbG9uZ3MgaGVyZS4KPj4+Pj4KPj4+Pj4gWy4uLl0KPj4+
Pj4+IEBAIC00NjYsMzMgKzUwMCw4IEBAIHN0YXRpYyBpbnQgYW1kZ3B1X2JvX2RvX2NyZWF0ZShz
dHJ1Y3QKPj4+Pj4+IFsuLi5dCj4+Pj4+PiArwqDCoMKgIGlmICghYW1kZ3B1X2JvX3N1cHBvcnRf
dXN3Yyhiby0+ZmxhZ3MpKQo+Pj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBiby0+ZmxhZ3Mg
Jj0gfkFNREdQVV9HRU1fQ1JFQVRFX0NQVV9HVFRfVVNXQzsKPj4+Pj4gUmF0aGVyIGhlcmUgd2Ug
c2hvdWxkIGRvICJpZiAoYm9fZmxhZ3MgJgo+Pj4+PiBBTURHUFVfR0VNX0NSRUFURV9DUFVfR1RU
X1VTV0MKPj4+Pj4gJiYgIWFtZGdwdV9ib19zdXBwb3J0X3Vzd2MoKSkiIGFuZCB0aGVuIGNsZWFy
IHRoZSBmbGFnIGFuZCBhbHNvIHByaW50Cj4+Pj4+IHRoZSB3YXJuaW5nLgo+Pj4+IFRoYXQgd291
bGQgcmVxdWlyZSBkdXBsaWNhdGluZyB0aGUgQ09ORklHX1g4Nl9QQVQgcmVsYXRlZCBsb2dpYyBo
ZXJlIGFzCj4+Pj4gd2VsbCwgd2hpY2ggaXMgYSBiaXQgdWdseS4KPj4+IEFjdHVhbGx5IEkgd291
bGQgc2F5IHdlIHNob3VsZCBkcm9wIHRoaXMgZXh0cmEgY2hlY2sgYW5kIGFsd2F5cyBlbWl0IGEK
Pj4+IG1lc3NhZ2UgdGhhdCBVU1dDIGlzIGRpc2FibGVkIGZvciB0aGlzIHBsYXRmb3JtLgo+Pj4K
Pj4+IFdlIG5vdyBuZWVkIGl0IGZvciBtb3JlIHRoYW4ganVzdCBiZXR0ZXIgcGVyZm9ybWFuY2Ug
YW5kIGl0IHNob3VsZCBiZQo+Pj4gZXhwbGljaXRseSBub3RlZCB0aGF0IHRoaXMgaXMgbm90IGF2
YWlsYWJsZSBpbiB0aGUgbG9ncy4KPj4gQSBsb2cgbWVzc2FnZSB3aGljaCBkb2Vzbid0IGV4cGxh
aW4gd2h5IGl0J3MgZGlzYWJsZWQgLyBob3cgdG8gZW5hYmxlIGl0Cj4+IHdvdWxkIHByb2JhYmx5
IGNhdXNlIHVzIHVzZXIgc3VwcG9ydCBwYWluLgo+IAo+IE1obSwgc291bmRzIGxpa2UgeW91IGRp
ZG4ndCBnb3Qgd2hhdCBJIHdhbnRlZCB0byBzYXkuCj4gCj4gTm8gbG9nIG1lc3NhZ2Ugd2FzIGZp
bmUgYXMgbG9uZyBhcyBVU1dDIHdhcyBvbmx5IGEgcGVyZm9ybWFuY2UKPiBvcHRpbWl6YXRpb24s
IGJ1dCBub3cgaXQgYmVjb21lcyBtYW5kYXRvcnkgZm9yIGNvcnJlY3Qgb3BlcmF0aW9uIGluIHNv
bWUKPiBzZXR0aW5ncy4KPiAKPiBJbiBvdGhlciB3b3JkcyBpbiB2ZXJ5IGxvdyBWUkFNIGNvbmZp
Z3VyYXRpb25zIGl0IGNhbiBiZSB0aGF0IHdlIGNhbid0Cj4gZW5hYmxlIGhpZ2hlciByZXNvbHV0
aW9uIGJlY2F1c2UgdGhlIGtlcm5lbCBpcyBub3QgY29tcGlsZWQgd2l0aCB0aGUKPiBuZWNlc3Nh
cnkgZmxhZ3MgZm9yIFVTV0Mgc3VwcG9ydC4KCldpdGggYW4gQVBVIHdoaWNoIHN1cHBvcnRzIHNj
YXR0ZXIvZ2F0aGVyIHNjYW5vdXQsIHN1cmUuCgo+IFByaW50aW5nIHRoYXQgd2hlbiB0aGUgZHJp
dmVyIGxvYWRzIHNvdW5kcyBsaWtlIHRoZSBiZXN0IHBsYWNlIHRvIG1lLgoKV29ya3MgZm9yIG1l
LCBidXQgaXQgc3RpbGwgbmVlZHMgdG8gZXhwbGFpbiB3aHkgaXQncyBkaXNhYmxlZCAvIGhvdyB0
bwplbmFibGUgaXQuLi4gU29tZXRoaW5nIGxpa2UgImVuYWJsZSBQQVQiIG9yICJ1c2UgYSA2NC1i
aXQga2VybmVsIi4KCgotLSAKRWFydGhsaW5nIE1pY2hlbCBEw6RuemVyICAgICAgICAgICAgICAg
fCAgICAgICAgICAgICAgaHR0cHM6Ly93d3cuYW1kLmNvbQpMaWJyZSBzb2Z0d2FyZSBlbnRodXNp
YXN0ICAgICAgICAgICAgIHwgICAgICAgICAgICAgTWVzYSBhbmQgWCBkZXZlbG9wZXIKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5n
IGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
