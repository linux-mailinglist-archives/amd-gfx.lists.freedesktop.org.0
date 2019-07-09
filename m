Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA2A063463
	for <lists+amd-gfx@lfdr.de>; Tue,  9 Jul 2019 12:35:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6501789E41;
	Tue,  9 Jul 2019 10:34:59 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from netline-mail3.netline.ch (mail.netline.ch [148.251.143.178])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0A70489E41
 for <amd-gfx@lists.freedesktop.org>; Tue,  9 Jul 2019 10:34:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by netline-mail3.netline.ch (Postfix) with ESMTP id 0A7472B2010;
 Tue,  9 Jul 2019 12:34:57 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at netline-mail3.netline.ch
Received: from netline-mail3.netline.ch ([127.0.0.1])
 by localhost (netline-mail3.netline.ch [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id gW_G-8q052Nq; Tue,  9 Jul 2019 12:34:56 +0200 (CEST)
Received: from thor (116.245.63.188.dynamic.wline.res.cust.swisscom.ch
 [188.63.245.116])
 by netline-mail3.netline.ch (Postfix) with ESMTPSA id 616F22B200F;
 Tue,  9 Jul 2019 12:34:56 +0200 (CEST)
Received: from localhost ([::1]) by thor with esmtp (Exim 4.92)
 (envelope-from <michel@daenzer.net>)
 id 1hknSa-000875-3A; Tue, 09 Jul 2019 12:34:56 +0200
Subject: Re: [PATCH 1/3] drm/amdgpu: Add flag for allocating memory for
 sensitive data
To: "Kuehling, Felix" <Felix.Kuehling@amd.com>
References: <20190709053222.22588-1-Felix.Kuehling@amd.com>
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
Message-ID: <b1a0638a-4be3-0a7b-7d29-309942f24263@daenzer.net>
Date: Tue, 9 Jul 2019 12:34:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190709053222.22588-1-Felix.Kuehling@amd.com>
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

T24gMjAxOS0wNy0wOSA3OjMyIGEubS4sIEt1ZWhsaW5nLCBGZWxpeCB3cm90ZToKPiBUaGlzIG1l
bW9yeSBhbGxvY2F0aW9uIGZsYWcgd2lsbCBiZSB1c2VkIHRvIGluZGljYXRlIEJPcyBjb250YWlu
aW5nCj4gc2Vuc2l0aXZlIGRhdGEgdGhhdCBzaG91bGQgbm90IGJlIGxlYWtlZCB0byBvdGhlciBw
cm9jZXNzZXMuCj4gCj4gU2lnbmVkLW9mZi1ieTogRmVsaXggS3VlaGxpbmcgPEZlbGl4Lkt1ZWhs
aW5nQGFtZC5jb20+Cj4gLS0tCj4gIGluY2x1ZGUvdWFwaS9kcm0vYW1kZ3B1X2RybS5oIHwgNCAr
KysrCj4gIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEv
aW5jbHVkZS91YXBpL2RybS9hbWRncHVfZHJtLmggYi9pbmNsdWRlL3VhcGkvZHJtL2FtZGdwdV9k
cm0uaAo+IGluZGV4IDYxODcwNDc4YmM5Yy4uNTg2NTljMjhjMjZlIDEwMDY0NAo+IC0tLSBhL2lu
Y2x1ZGUvdWFwaS9kcm0vYW1kZ3B1X2RybS5oCj4gKysrIGIvaW5jbHVkZS91YXBpL2RybS9hbWRn
cHVfZHJtLmgKPiBAQCAtMTMxLDYgKzEzMSwxMCBAQCBleHRlcm4gIkMiIHsKPiAgICogZm9yIHRo
ZSBzZWNvbmQgcGFnZSBvbndhcmQgc2hvdWxkIGJlIHNldCB0byBOQy4KPiAgICovCj4gICNkZWZp
bmUgQU1ER1BVX0dFTV9DUkVBVEVfTVFEX0dGWDkJCSgxIDw8IDgpCj4gKy8qIEZsYWcgdGhhdCBC
TyBtYXkgY29udGFpbiBzZW5zaXRpdmUgZGF0YSB0aGF0IG11c3QgYmUgY2xlYXJlZCBiZWZvcmUK
PiArICogcmVsZWFzaW5nIHRoZSBtZW1vcnkKPiArICovCj4gKyNkZWZpbmUgQU1ER1BVX0dFTV9D
UkVBVEVfVlJBTV9TRU5TSVRJVkUJKDEgPDwgOSkKPiAgCj4gIHN0cnVjdCBkcm1fYW1kZ3B1X2dl
bV9jcmVhdGVfaW4gIHsKPiAgCS8qKiB0aGUgcmVxdWVzdGVkIG1lbW9yeSBzaXplICovCj4gCgpU
aGlzIGZsYWcgZXNzZW50aWFsbHkgbWVhbnMgIlBsZWFzZSBkb24ndCBsZWFrIG15IEJPIGNvbnRl
bnRzIi4KU2ltaWxhcmx5LCBBTURHUFVfR0VNX0NSRUFURV9WUkFNX0NMRUFSRUQgZXNzZW50aWFs
bHkgbWVhbnMgIlBsZWFzZQpkb24ndCBsZXQgbWUgc2VlIHByZXZpb3VzIG1lbW9yeSBjb250ZW50
cyIuCgpJJ2QgYXJndWUgdGhhdCBuZWl0aGVyIGZsYWcgc2hvdWxkIHJlYWxseSBiZSBuZWVkZWQ7
IEJPIGNvbnRlbnRzCnNob3VsZG4ndCBiZSBsZWFrZWQgYnkgZGVmYXVsdC4KCgotLSAKRWFydGhs
aW5nIE1pY2hlbCBEw6RuemVyICAgICAgICAgICAgICAgfCAgICAgICAgICAgICAgaHR0cHM6Ly93
d3cuYW1kLmNvbQpMaWJyZSBzb2Z0d2FyZSBlbnRodXNpYXN0ICAgICAgICAgICAgIHwgICAgICAg
ICAgICAgTWVzYSBhbmQgWCBkZXZlbG9wZXIKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9hbWQtZ2Z4
