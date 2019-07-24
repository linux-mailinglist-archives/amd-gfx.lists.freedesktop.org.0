Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CA8472902
	for <lists+amd-gfx@lfdr.de>; Wed, 24 Jul 2019 09:29:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3EDC6E46D;
	Wed, 24 Jul 2019 07:29:14 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from netline-mail3.netline.ch (mail.netline.ch [148.251.143.178])
 by gabe.freedesktop.org (Postfix) with ESMTP id DEA2E6E479
 for <amd-gfx@lists.freedesktop.org>; Wed, 24 Jul 2019 07:29:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by netline-mail3.netline.ch (Postfix) with ESMTP id 8B5602A6042;
 Wed, 24 Jul 2019 09:29:12 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at netline-mail3.netline.ch
Received: from netline-mail3.netline.ch ([127.0.0.1])
 by localhost (netline-mail3.netline.ch [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id G1nV4WXgVPjk; Wed, 24 Jul 2019 09:29:12 +0200 (CEST)
Received: from thor (116.245.63.188.dynamic.wline.res.cust.swisscom.ch
 [188.63.245.116])
 by netline-mail3.netline.ch (Postfix) with ESMTPSA id D65EA2A6016;
 Wed, 24 Jul 2019 09:29:11 +0200 (CEST)
Received: from localhost ([::1]) by thor with esmtp (Exim 4.92)
 (envelope-from <michel@daenzer.net>)
 id 1hqBi1-0006YW-Ok; Wed, 24 Jul 2019 09:29:09 +0200
Subject: Re: [PATCH v2 2/2] drm/amd: enable S/G for RAVEN chip
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
References: <1563906335-12949-1-git-send-email-andrey.grodzovsky@amd.com>
 <1563906335-12949-3-git-send-email-andrey.grodzovsky@amd.com>
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
Message-ID: <abfebdd2-865c-d4fb-4ce1-6f92424cb12a@daenzer.net>
Date: Wed, 24 Jul 2019 09:29:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1563906335-12949-3-git-send-email-andrey.grodzovsky@amd.com>
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

T24gMjAxOS0wNy0yMyA4OjI1IHAubS4sIEFuZHJleSBHcm9kem92c2t5IHdyb3RlOgo+IEZyb206
IFNoaXJpc2ggUyA8c2hpcmlzaC5zQGFtZC5jb20+Cj4gCj4gZW5hYmxlcyBncHVfdm1fc3VwcG9y
dCBpbiBkbSBhbmQgYWRkcwo+IEFNREdQVV9HRU1fRE9NQUlOX0dUVCBhcyBzdXBwb3J0ZWQgZG9t
YWluCj4gCj4gdjI6Cj4gTW92ZSBCTyBwbGFjZW1lbnQgbG9naWMgaW50byBhbWRncHVfZGlzcGxh
eV9zdXBwb3J0ZWRfZG9tYWlucwo+IAo+IENoYW5nZS1JZDogSWYzNDMwMGJlYWE2MGJlMmQzNjE3
MGI3YjViMDk2ZWM2NDQ1MDJiMjAKPiBTaWduZWQtb2ZmLWJ5OiBTaGlyaXNoIFMgPHNoaXJpc2gu
c0BhbWQuY29tPgo+IFNpZ25lZC1vZmYtYnk6IEFuZHJleSBHcm9kem92c2t5IDxhbmRyZXkuZ3Jv
ZHpvdnNreUBhbWQuY29tPgo+IC0tLQo+ICBbLi4uXQo+IAo+IEBAIC00OTgsOCArNDk5LDE2IEBA
IHVpbnQzMl90IGFtZGdwdV9kaXNwbGF5X3N1cHBvcnRlZF9kb21haW5zKHN0cnVjdCBhbWRncHVf
ZGV2aWNlICphZGV2KQo+ICAJdWludDMyX3QgZG9tYWluID0gQU1ER1BVX0dFTV9ET01BSU5fVlJB
TTsKPiAgCj4gICNpZiBkZWZpbmVkKENPTkZJR19EUk1fQU1EX0RDKQo+IC0JaWYgKGFkZXYtPmFz
aWNfdHlwZSA+PSBDSElQX0NBUlJJWk8gJiYgYWRldi0+YXNpY190eXBlIDwgQ0hJUF9SQVZFTiAm
Jgo+IC0JICAgIGFkZXYtPmZsYWdzICYgQU1EX0lTX0FQVSAmJgo+ICsJLyoKPiArCSAqIGlmIGRy
bV9hcmNoX2Nhbl93Y19tZW1vcnkgcmV0dXJucyBmYWxzZSBpbiBhbWRncHVfYm9fZG9fY3JlYXRl
Cj4gKwkgKiBBTURHUFVfR0VNX0NSRUFURV9DUFVfR1RUX1VTV0MgZmxhZyB3YXMgdW5zZXQgbWVh
bmluZyB0aGF0IFVTV0MgbWFwcGluZ3MKPiArCSAqIGlzIG5vdCBzdXBwb3J0ZWQgZm9yIHRoaXMg
Ym9hcmQuIEJ1dCB0aGlzIG1hcHBpbmcgaXMgcmVxdWlyZWQKPiArCSAqIHRvIGF2b2lkIGhhbmcg
Y2F1c2VkIGJ5IHBsYWNlbWVudCBvZiBzY2Fub3V0IEJPIGluIEdUVCBvbiBjZXJ0YWluCj4gKwkg
KiBBUFVzLiBTbyBmb3JjZSB0aGUgQk8gcGxhY2VtZW50IHRvIFZSQU0gaW4gY2FzZSB0aGlzIGFy
Y2hpdGVjdHVyZQo+ICsJICogd2lsbCBub3QgYWxsb3cgVVNXQyBtYXBwaW5ncy4KPiArCSAqLwo+
ICsJaWYgKGFkZXYtPmFzaWNfdHlwZSA+PSBDSElQX0NBUlJJWk8gJiYgYWRldi0+YXNpY190eXBl
IDw9IENISVBfUkFWRU4gJiYKPiArCSAgICBhZGV2LT5mbGFncyAmIEFNRF9JU19BUFUgJiYgZHJt
X2FyY2hfY2FuX3djX21lbW9yeSgpICYmCj4gIAkgICAgYW1kZ3B1X2RldmljZV9hc2ljX2hhc19k
Y19zdXBwb3J0KGFkZXYtPmFzaWNfdHlwZSkpCj4gIAkJZG9tYWluIHw9IEFNREdQVV9HRU1fRE9N
QUlOX0dUVDsKPiAgI2VuZGlmCgpkcm1fYXJjaF9jYW5fd2NfbWVtb3J5KCkgbmV2ZXIgcmV0dXJu
cyBmYWxzZSBmb3IgYW4gQVBVLiBIb3dldmVyLCBpdApyZXR1cm5pbmcgZmFsc2UgaXNuJ3QgdGhl
IG9ubHkgY2FzZSB3aGVyZSBBTURHUFVfR0VNX0NSRUFURV9DUFVfR1RUX1VTV0MKY2FuIGJlIGNs
ZWFyZWQsIHNlZSBhbWRncHVfYm9fZG9fY3JlYXRlKCkuIEkgc3VnZ2VzdCBtb3ZpbmcgdGhhdCBs
b2dpYwppbnRvIGEgc2VwYXJhdGUgaGVscGVyIGZ1bmN0aW9uIHdoaWNoIGNhbiBiZSB1c2VkIGhl
cmUgYXMgd2VsbC4KCgotLSAKRWFydGhsaW5nIE1pY2hlbCBEw6RuemVyICAgICAgICAgICAgICAg
fCAgICAgICAgICAgICAgaHR0cHM6Ly93d3cuYW1kLmNvbQpMaWJyZSBzb2Z0d2FyZSBlbnRodXNp
YXN0ICAgICAgICAgICAgIHwgICAgICAgICAgICAgTWVzYSBhbmQgWCBkZXZlbG9wZXIKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5n
IGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
