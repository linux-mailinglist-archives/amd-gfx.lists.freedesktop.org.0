Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7EC0732F2
	for <lists+amd-gfx@lfdr.de>; Wed, 24 Jul 2019 17:41:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D5B56E5D5;
	Wed, 24 Jul 2019 15:41:12 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from netline-mail3.netline.ch (mail.netline.ch [148.251.143.178])
 by gabe.freedesktop.org (Postfix) with ESMTP id D1D996E5D5
 for <amd-gfx@lists.freedesktop.org>; Wed, 24 Jul 2019 15:41:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by netline-mail3.netline.ch (Postfix) with ESMTP id 0BD6F2A6042;
 Wed, 24 Jul 2019 17:41:10 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at netline-mail3.netline.ch
Received: from netline-mail3.netline.ch ([127.0.0.1])
 by localhost (netline-mail3.netline.ch [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id 92wEFh-wT0g0; Wed, 24 Jul 2019 17:41:09 +0200 (CEST)
Received: from thor (116.245.63.188.dynamic.wline.res.cust.swisscom.ch
 [188.63.245.116])
 by netline-mail3.netline.ch (Postfix) with ESMTPSA id 60CFC2A6016;
 Wed, 24 Jul 2019 17:41:09 +0200 (CEST)
Received: from localhost ([::1]) by thor with esmtp (Exim 4.92)
 (envelope-from <michel@daenzer.net>)
 id 1hqJNn-0001D5-OG; Wed, 24 Jul 2019 17:40:47 +0200
Subject: Re: [PATCH v4 2/4] drm/amdgpu: Create helper to clear
 AMDGPU_GEM_CREATE_CPU_GTT_USWC
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
References: <1563982066-21793-1-git-send-email-andrey.grodzovsky@amd.com>
 <1563982066-21793-3-git-send-email-andrey.grodzovsky@amd.com>
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
Message-ID: <8de768fe-5089-f7a9-da25-31c96926953a@daenzer.net>
Date: Wed, 24 Jul 2019 17:40:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1563982066-21793-3-git-send-email-andrey.grodzovsky@amd.com>
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
Cc: Alexander.Deucher@amd.com, hersenxs.wu@amd.com, Christian.Koenig@amd.com,
 amd-gfx@lists.freedesktop.org, shirish.s@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gMjAxOS0wNy0yNCA1OjI3IHAubS4sIEFuZHJleSBHcm9kem92c2t5IHdyb3RlOgo+IE1vdmUg
dGhlIGxvZ2ljIHRvIGNsZWFyIEFNREdQVV9HRU1fQ1JFQVRFX0NQVV9HVFRfVVNXQyBpbgo+IGFt
ZGdwdV9ib19kb19jcmVhdGUgaW50byBzdGFuZGFsb25lIGhlbHBlciBzbyBpdCBjYW4gYmUgcmV1
c2VkCj4gaW4gb3RoZXIgZnVuY3Rpb25zLgo+IAo+IHY0Ogo+IFN3aXRjaCB0byByZXR1cm4gYm9v
bC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXkgR3JvZHpvdnNreSA8YW5kcmV5Lmdyb2R6b3Zz
a3lAYW1kLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X29i
amVjdC5jIHwgNjEgKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tCj4gIGRyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9vYmplY3QuaCB8ICAyICsKPiAgMiBmaWxlcyBjaGFuZ2Vk
LCAzNyBpbnNlcnRpb25zKCspLCAyNiBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X29iamVjdC5jIGIvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYW1kZ3B1X29iamVjdC5jCj4gaW5kZXggOTg5YjdiNS4uZGFmZGI2OCAxMDA2
NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfb2JqZWN0LmMKPiAr
KysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfb2JqZWN0LmMKPiBAQCAtNDEz
LDYgKzQxMyw0MCBAQCBzdGF0aWMgYm9vbCBhbWRncHVfYm9fdmFsaWRhdGVfc2l6ZShzdHJ1Y3Qg
YW1kZ3B1X2RldmljZSAqYWRldiwKPiAgCXJldHVybiBmYWxzZTsKPiAgfQo+ICAKPiArYm9vbCBh
bWRncHVfYm9fc3VwcG9ydF91c3djKHU2NCBib19mbGFncykKPiArewo+ICsKPiArI2lmZGVmIENP
TkZJR19YODZfMzIKPiArCS8qIFhYWDogV3JpdGUtY29tYmluZWQgQ1BVIG1hcHBpbmdzIG9mIEdU
VCBzZWVtIGJyb2tlbiBvbiAzMi1iaXQKPiArCSAqIFNlZSBodHRwczovL2J1Z3MuZnJlZWRlc2t0
b3Aub3JnL3Nob3dfYnVnLmNnaT9pZD04NDYyNwo+ICsJICovCj4gKwlyZXR1cm4gZmFsc2UKCk1p
c3Npbmcgc2VtaWNvbG9uLgoKCj4gKyNlbGlmIGRlZmluZWQoQ09ORklHX1g4NikgJiYgIWRlZmlu
ZWQoQ09ORklHX1g4Nl9QQVQpCj4gKwkvKiBEb24ndCB0cnkgdG8gZW5hYmxlIHdyaXRlLWNvbWJp
bmluZyB3aGVuIGl0IGNhbid0IHdvcmssIG9yIHRoaW5ncwo+ICsJICogbWF5IGJlIHNsb3cKPiAr
CSAqIFNlZSBodHRwczovL2J1Z3MuZnJlZWRlc2t0b3Aub3JnL3Nob3dfYnVnLmNnaT9pZD04ODc1
OAo+ICsJICovCj4gKwo+ICsjaWZuZGVmIENPTkZJR19DT01QSUxFX1RFU1QKPiArI3dhcm5pbmcg
UGxlYXNlIGVuYWJsZSBDT05GSUdfTVRSUiBhbmQgQ09ORklHX1g4Nl9QQVQgZm9yIGJldHRlciBw
ZXJmb3JtYW5jZSBcCj4gKwkgdGhhbmtzIHRvIHdyaXRlLWNvbWJpbmluZwo+ICsjZW5kaWYKPiAr
Cj4gKwlpZiAoYm9fZmxhZ3MgJiBBTURHUFVfR0VNX0NSRUFURV9DUFVfR1RUX1VTV0MpCj4gKwkJ
RFJNX0lORk9fT05DRSgiUGxlYXNlIGVuYWJsZSBDT05GSUdfTVRSUiBhbmQgQ09ORklHX1g4Nl9Q
QVQgZm9yICIKPiArCQkJICAgICAgImJldHRlciBwZXJmb3JtYW5jZSB0aGFua3MgdG8gd3JpdGUt
Y29tYmluaW5nXG4iKTsKClRoZSBBTURHUFVfR0VNX0NSRUFURV9DUFVfR1RUX1VTV0MgY2hlY2sg
d2lsbCBhbHdheXMgcGFzcyBhdCBzb21lIHBvaW50CmR1ZSB0byBwYXRjaCAxLCBzbyBwYXNzaW5n
IGluIHRoZSBmbGFncyBpcyBraW5kIG9mIHBvaW50bGVzcy4gSnVzdCBkbwp0aGUgRFJNX0lORk9f
T05DRSB1bmNvbmRpdGlvbmFsbHkgaGVyZS4KCgo+IEBAIC00NjYsMzMgKzUwMCw4IEBAIHN0YXRp
YyBpbnQgYW1kZ3B1X2JvX2RvX2NyZWF0ZShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwKPiAg
Cj4gWy4uLl0KPiAgCj4gKwlpZiAoYW1kZ3B1X2JvX3N1cHBvcnRfdXN3Yyhiby0+ZmxhZ3MpKQo+
ICAJCWJvLT5mbGFncyAmPSB+QU1ER1BVX0dFTV9DUkVBVEVfQ1BVX0dUVF9VU1dDOwoKTWlzc2lu
ZyAiISIuCgoKLS0gCkVhcnRobGluZyBNaWNoZWwgRMOkbnplciAgICAgICAgICAgICAgIHwgICAg
ICAgICAgICAgIGh0dHBzOi8vd3d3LmFtZC5jb20KTGlicmUgc29mdHdhcmUgZW50aHVzaWFzdCAg
ICAgICAgICAgICB8ICAgICAgICAgICAgIE1lc2EgYW5kIFggZGV2ZWxvcGVyCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0
CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
