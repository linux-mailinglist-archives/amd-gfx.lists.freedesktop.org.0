Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ED6AEAF651
	for <lists+amd-gfx@lfdr.de>; Wed, 11 Sep 2019 09:01:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F8976EA2C;
	Wed, 11 Sep 2019 07:01:34 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from netline-mail3.netline.ch (mail.netline.ch [148.251.143.178])
 by gabe.freedesktop.org (Postfix) with ESMTP id B70246EA22
 for <amd-gfx@lists.freedesktop.org>; Wed, 11 Sep 2019 07:01:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by netline-mail3.netline.ch (Postfix) with ESMTP id B52F52AA14F
 for <amd-gfx@lists.freedesktop.org>; Wed, 11 Sep 2019 09:01:17 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at netline-mail3.netline.ch
Received: from netline-mail3.netline.ch ([127.0.0.1])
 by localhost (netline-mail3.netline.ch [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id 8SKvp42ysxya for <amd-gfx@lists.freedesktop.org>;
 Wed, 11 Sep 2019 09:01:15 +0200 (CEST)
Received: from thor (116.245.63.188.dynamic.wline.res.cust.swisscom.ch
 [188.63.245.116])
 by netline-mail3.netline.ch (Postfix) with ESMTPSA id 2C1982AA0B0
 for <amd-gfx@lists.freedesktop.org>; Wed, 11 Sep 2019 09:01:15 +0200 (CEST)
Received: from localhost ([::1]) by thor with esmtp (Exim 4.92.2)
 (envelope-from <michel@daenzer.net>)
 id 1i7wcX-0000AW-UW; Wed, 11 Sep 2019 09:00:53 +0200
Subject: Re: [PATCH] Fix Xorg abort on exit in RHEL 7.7+
To: "Grigorev, Slava" <Slava.Grigorev@amd.com>
References: <20190910194637.29819-1-slava.grigorev@amd.com>
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
Message-ID: <6d853214-c414-5c20-353e-1df1e29add83@daenzer.net>
Date: Wed, 11 Sep 2019 09:00:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190910194637.29819-1-slava.grigorev@amd.com>
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

CkhpIFNsYXZhLAoKCnhmODYtdmlkZW8tYW1kZ3B1IHBhdGNoZXMgYXJlIHN1Ym1pdHRlZCAmIHJl
dmlld2VkIGFzIEdpdExhYiBtZXJnZQpyZXF1ZXN0cyBub3cuIFBsZWFzZSBsb2cgaW50byB5b3Vy
IEdpdExhYiBhY2NvdW50LCBjbGljayB0aGUgIkZvcmsiCmJ1dHRvbiBvbiBodHRwczovL2dpdGxh
Yi5mcmVlZGVza3RvcC5vcmcveG9yZy9kcml2ZXIveGY4Ni12aWRlby1hbWRncHUgLApwdXNoIHRo
ZSBjaGFuZ2UgdG8gYSBuZXcgYnJhbmNoIG9mIHlvdXIgcmVzdWx0aW5nIHBlcnNvbmFsIEdpdExh
Ygpwcm9qZWN0LCBhbmQgY2xpY2sgb24gdGhlIFVSTCBpbiAiZ2l0IHB1c2giJ3Mgb3V0cHV0IHRv
IGNyZWF0ZSBhbiBNUi4KCgpUaGFua3MsCgoKT24gMjAxOS0wOS0xMCA5OjQ3IHAubS4sIEdyaWdv
cmV2LCBTbGF2YSB3cm90ZToKPiBSSEVMIGFkZHMgYW4gZXh0cmEgTGVhdmVWVCBjYWxscyB0byB4
Zjg2Q3J0Y0Nsb3NlU2NyZWVuIHdoZW4gdGhleSBidWlsZCBYIHNlcnZlcgo+IGZvciB0aGUgcHVy
cG9zZSB0byBkcm9wIGRybSBtYXN0ZXIuCj4gCj4gU2lnbmVkLW9mZi1ieTogU2xhdmEgR3JpZ29y
ZXYgPHNsYXZhLmdyaWdvcmV2QGFtZC5jb20+Cj4gLS0tCj4gIHNyYy9hbWRncHVfa21zLmMgfCA0
ICsrKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+
IAo+IGRpZmYgLS1naXQgYS9zcmMvYW1kZ3B1X2ttcy5jIGIvc3JjL2FtZGdwdV9rbXMuYwo+IGlu
ZGV4IDMyODA5NzIuLjllZmM0ODIgMTAwNjQ0Cj4gLS0tIGEvc3JjL2FtZGdwdV9rbXMuYwo+ICsr
KyBiL3NyYy9hbWRncHVfa21zLmMKPiBAQCAtMjI4NSw3ICsyMjg1LDkgQEAgdm9pZCBBTURHUFVM
ZWF2ZVZUX0tNUyhTY3JuSW5mb1B0ciBwU2NybikKPiAgCQkJCXN0cnVjdCBkcm1tb2RlX2ZiICpi
bGFja19mYiA9Cj4gIAkJCQkJYW1kZ3B1X3BpeG1hcF9nZXRfZmIoYmxhY2tfc2Nhbm91dC5waXht
YXApOwo+ICAKPiAtCQkJCWFtZGdwdV9waXhtYXBfY2xlYXIoYmxhY2tfc2Nhbm91dC5waXhtYXAp
Owo+ICsJCQkJaWYgKCFkaXhQcml2YXRlS2V5UmVnaXN0ZXJlZChyclByaXZLZXkpKQo+ICsJCQkJ
CWFtZGdwdV9waXhtYXBfY2xlYXIoYmxhY2tfc2Nhbm91dC5waXhtYXApOwo+ICsKPiAgCQkJCWFt
ZGdwdV9nbGFtb3JfZmluaXNoKHBTY3JuKTsKPiAgCj4gIAkJCQlmb3IgKGkgPSAwOyBpIDwgeGY4
Nl9jb25maWctPm51bV9jcnRjOyBpKyspIHsKPiAKCgotLSAKRWFydGhsaW5nIE1pY2hlbCBEw6Ru
emVyICAgICAgICAgICAgICAgfCAgICAgICAgICAgICAgIGh0dHBzOi8vcmVkaGF0LmNvbQpMaWJy
ZSBzb2Z0d2FyZSBlbnRodXNpYXN0ICAgICAgICAgICAgIHwgICAgICAgICAgICAgTWVzYSBhbmQg
WCBkZXZlbG9wZXIKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
