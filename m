Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8F1976159
	for <lists+amd-gfx@lfdr.de>; Fri, 26 Jul 2019 10:54:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEB446E8B9;
	Fri, 26 Jul 2019 08:54:05 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from netline-mail3.netline.ch (mail.netline.ch [148.251.143.178])
 by gabe.freedesktop.org (Postfix) with ESMTP id 860FA6E8B9
 for <amd-gfx@lists.freedesktop.org>; Fri, 26 Jul 2019 08:54:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by netline-mail3.netline.ch (Postfix) with ESMTP id A4E8F2A6042;
 Fri, 26 Jul 2019 10:54:03 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at netline-mail3.netline.ch
Received: from netline-mail3.netline.ch ([127.0.0.1])
 by localhost (netline-mail3.netline.ch [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id eA7gmSQHVy5B; Fri, 26 Jul 2019 10:54:03 +0200 (CEST)
Received: from thor (116.245.63.188.dynamic.wline.res.cust.swisscom.ch
 [188.63.245.116])
 by netline-mail3.netline.ch (Postfix) with ESMTPSA id D801C2A6016;
 Fri, 26 Jul 2019 10:54:02 +0200 (CEST)
Received: from localhost ([::1]) by thor with esmtp (Exim 4.92)
 (envelope-from <michel@daenzer.net>)
 id 1hqvzG-0005QH-Ht; Fri, 26 Jul 2019 10:54:02 +0200
Subject: Re: [PATCH v5 2/4] drm/amdgpu: Create helper to clear
 AMDGPU_GEM_CREATE_CPU_GTT_USWC
To: christian.koenig@amd.com, Andrey Grodzovsky <andrey.grodzovsky@amd.com>
References: <1564064683-31796-1-git-send-email-andrey.grodzovsky@amd.com>
 <1564064683-31796-3-git-send-email-andrey.grodzovsky@amd.com>
 <1723b531-097f-2687-6dc9-9de6e3e378a1@gmail.com>
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
Message-ID: <fdf2600a-b0ef-bdca-f22b-51427bef9531@daenzer.net>
Date: Fri, 26 Jul 2019 10:54:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1723b531-097f-2687-6dc9-9de6e3e378a1@gmail.com>
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

T24gMjAxOS0wNy0yNiA5OjExIGEubS4sIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6Cj4gQW0gMjUu
MDcuMTkgdW0gMTY6MjQgc2NocmllYiBBbmRyZXkgR3JvZHpvdnNreToKPj4gTW92ZSB0aGUgbG9n
aWMgdG8gY2xlYXIgQU1ER1BVX0dFTV9DUkVBVEVfQ1BVX0dUVF9VU1dDIGluCj4+IGFtZGdwdV9i
b19kb19jcmVhdGUgaW50byBzdGFuZGFsb25lIGhlbHBlciBzbyBpdCBjYW4gYmUgcmV1c2VkCj4+
IGluIG90aGVyIGZ1bmN0aW9ucy4KPj4KPj4gdjQ6Cj4+IFN3aXRjaCB0byByZXR1cm4gYm9vbC4K
Pj4KPj4gdjU6IEZpeCB0eXBvcy4KPj4KPj4gU2lnbmVkLW9mZi1ieTogQW5kcmV5IEdyb2R6b3Zz
a3kgPGFuZHJleS5ncm9kem92c2t5QGFtZC5jb20+Cj4+IC0tLQo+PiDCoCBkcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfb2JqZWN0LmMgfCA2MQo+PiArKysrKysrKysrKysrKysrKy0t
LS0tLS0tLS0tLS0KPj4gwqAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X29iamVj
dC5oIHzCoCAyICsKPj4gwqAgMiBmaWxlcyBjaGFuZ2VkLCAzNyBpbnNlcnRpb25zKCspLCAyNiBk
ZWxldGlvbnMoLSkKPj4KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2FtZGdwdV9vYmplY3QuYwo+PiBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9v
YmplY3QuYwo+PiBpbmRleCA5ODliN2I1Li44NzAyMDYyIDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfb2JqZWN0LmMKPj4gKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1X29iamVjdC5jCj4+IEBAIC00MTMsNiArNDEzLDQwIEBAIHN0
YXRpYyBib29sIGFtZGdwdV9ib192YWxpZGF0ZV9zaXplKHN0cnVjdAo+PiBhbWRncHVfZGV2aWNl
ICphZGV2LAo+PiDCoMKgwqDCoMKgIHJldHVybiBmYWxzZTsKPj4gwqAgfQo+PiDCoCArYm9vbCBh
bWRncHVfYm9fc3VwcG9ydF91c3djKHU2NCBib19mbGFncykKPj4gK3sKPj4gKwo+PiArI2lmZGVm
IENPTkZJR19YODZfMzIKPj4gK8KgwqDCoCAvKiBYWFg6IFdyaXRlLWNvbWJpbmVkIENQVSBtYXBw
aW5ncyBvZiBHVFQgc2VlbSBicm9rZW4gb24gMzItYml0Cj4+ICvCoMKgwqDCoCAqIFNlZSBodHRw
czovL2J1Z3MuZnJlZWRlc2t0b3Aub3JnL3Nob3dfYnVnLmNnaT9pZD04NDYyNwo+PiArwqDCoMKg
wqAgKi8KPj4gK8KgwqDCoCByZXR1cm4gZmFsc2U7Cj4+ICsjZWxpZiBkZWZpbmVkKENPTkZJR19Y
ODYpICYmICFkZWZpbmVkKENPTkZJR19YODZfUEFUKQo+PiArwqDCoMKgIC8qIERvbid0IHRyeSB0
byBlbmFibGUgd3JpdGUtY29tYmluaW5nIHdoZW4gaXQgY2FuJ3Qgd29yaywgb3IgdGhpbmdzCj4+
ICvCoMKgwqDCoCAqIG1heSBiZSBzbG93Cj4+ICvCoMKgwqDCoCAqIFNlZSBodHRwczovL2J1Z3Mu
ZnJlZWRlc2t0b3Aub3JnL3Nob3dfYnVnLmNnaT9pZD04ODc1OAo+PiArwqDCoMKgwqAgKi8KPj4g
Kwo+PiArI2lmbmRlZiBDT05GSUdfQ09NUElMRV9URVNUCj4+ICsjd2FybmluZyBQbGVhc2UgZW5h
YmxlIENPTkZJR19NVFJSIGFuZCBDT05GSUdfWDg2X1BBVCBmb3IgYmV0dGVyCj4+IHBlcmZvcm1h
bmNlIFwKPj4gK8KgwqDCoMKgIHRoYW5rcyB0byB3cml0ZS1jb21iaW5pbmcKPj4gKyNlbmRpZgo+
PiArCj4+ICvCoMKgwqAgaWYgKGJvX2ZsYWdzICYgQU1ER1BVX0dFTV9DUkVBVEVfQ1BVX0dUVF9V
U1dDKQo+PiArwqDCoMKgwqDCoMKgwqAgRFJNX0lORk9fT05DRSgiUGxlYXNlIGVuYWJsZSBDT05G
SUdfTVRSUiBhbmQgQ09ORklHX1g4Nl9QQVQKPj4gZm9yICIKPj4gK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgImJldHRlciBwZXJmb3JtYW5jZSB0aGFua3MgdG8gd3JpdGUtY29t
YmluaW5nXG4iKTsKPiAKPiBJIGRvbid0IHRoaW5rIHRoaXMgbWVzc2FnZSBiZWxvbmdzIGhlcmUu
Cj4gCj4gWy4uLl0KPj4gQEAgLTQ2NiwzMyArNTAwLDggQEAgc3RhdGljIGludCBhbWRncHVfYm9f
ZG9fY3JlYXRlKHN0cnVjdAo+PiBbLi4uXQo+PiArwqDCoMKgIGlmICghYW1kZ3B1X2JvX3N1cHBv
cnRfdXN3Yyhiby0+ZmxhZ3MpKQo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgYm8tPmZsYWdzICY9IH5B
TURHUFVfR0VNX0NSRUFURV9DUFVfR1RUX1VTV0M7Cj4gCj4gUmF0aGVyIGhlcmUgd2Ugc2hvdWxk
IGRvICJpZiAoYm9fZmxhZ3MgJiBBTURHUFVfR0VNX0NSRUFURV9DUFVfR1RUX1VTV0MKPiAmJiAh
YW1kZ3B1X2JvX3N1cHBvcnRfdXN3YygpKSIgYW5kIHRoZW4gY2xlYXIgdGhlIGZsYWcgYW5kIGFs
c28gcHJpbnQKPiB0aGUgd2FybmluZy4KClRoYXQgd291bGQgcmVxdWlyZSBkdXBsaWNhdGluZyB0
aGUgQ09ORklHX1g4Nl9QQVQgcmVsYXRlZCBsb2dpYyBoZXJlIGFzCndlbGwsIHdoaWNoIGlzIGEg
Yml0IHVnbHkuCgoKLS0gCkVhcnRobGluZyBNaWNoZWwgRMOkbnplciAgICAgICAgICAgICAgIHwg
ICAgICAgICAgICAgIGh0dHBzOi8vd3d3LmFtZC5jb20KTGlicmUgc29mdHdhcmUgZW50aHVzaWFz
dCAgICAgICAgICAgICB8ICAgICAgICAgICAgIE1lc2EgYW5kIFggZGV2ZWxvcGVyCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBs
aXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
