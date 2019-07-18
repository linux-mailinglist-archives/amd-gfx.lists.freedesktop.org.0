Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DFB26D1EE
	for <lists+amd-gfx@lfdr.de>; Thu, 18 Jul 2019 18:21:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E70AF6E434;
	Thu, 18 Jul 2019 16:21:13 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from netline-mail3.netline.ch (mail.netline.ch [148.251.143.178])
 by gabe.freedesktop.org (Postfix) with ESMTP id 197996E434
 for <amd-gfx@lists.freedesktop.org>; Thu, 18 Jul 2019 16:21:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by netline-mail3.netline.ch (Postfix) with ESMTP id 6C35D2B2015;
 Thu, 18 Jul 2019 18:21:11 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at netline-mail3.netline.ch
Received: from netline-mail3.netline.ch ([127.0.0.1])
 by localhost (netline-mail3.netline.ch [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id JmXZDprXbq6i; Thu, 18 Jul 2019 18:21:11 +0200 (CEST)
Received: from thor (116.245.63.188.dynamic.wline.res.cust.swisscom.ch
 [188.63.245.116])
 by netline-mail3.netline.ch (Postfix) with ESMTPSA id 2E33C2B200C;
 Thu, 18 Jul 2019 18:21:11 +0200 (CEST)
Received: from localhost ([::1]) by thor with esmtp (Exim 4.92)
 (envelope-from <michel@daenzer.net>)
 id 1ho99a-0005ir-9H; Thu, 18 Jul 2019 18:21:10 +0200
Subject: Re: [PATCH] drm/amdgpu: Remove undefined amdgpu_device_parse_faked_did
To: sunpeng.li@amd.com
References: <20190718161756.22875-1-sunpeng.li@amd.com>
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
Message-ID: <e744c092-9a24-bf98-a34b-d9b38fe9a62a@daenzer.net>
Date: Thu, 18 Jul 2019 18:21:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190718161756.22875-1-sunpeng.li@amd.com>
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
Cc: amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gMjAxOS0wNy0xOCA2OjE3IHAubS4sIHN1bnBlbmcubGlAYW1kLmNvbSB3cm90ZToKPiBGcm9t
OiBMZW8gTGkgPHN1bnBlbmcubGlAYW1kLmNvbT4KPiAKPiBUaGlzIGZvcndhcmQgZGVjbGFyZSB3
YXMgYWRkZWQgZm9yIG5vIGFwcGFyZW50IHJlYXNvbi4gUmVtb3ZlIGl0IHRvCj4gcmVzb2x2ZSB0
aGlzIHdhcm5pbmc6Cj4gCj4gZHJpdmVycy9ncHUvZHJtLy9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZp
Y2UuYzoxMzE6MTM6IHdhcm5pbmc6IOKAmGFtZGdwdV9kZXZpY2VfcGFyc2VfZmFrZWRfZGlk4oCZ
IGRlY2xhcmVkIOKAmHN0YXRpY+KAmSBidXQgbmV2ZXIgZGVmaW5lZCBbLVd1bnVzZWQtZnVuY3Rp
b25dCj4gIHN0YXRpYyB2b2lkIGFtZGdwdV9kZXZpY2VfcGFyc2VfZmFrZWRfZGlkKHN0cnVjdCBh
bWRncHVfZGV2aWNlICphZGV2KTsKPiAKPiBDYzogTWljaGVsIETDpG56ZXIgPG1pY2hlbEBkYWVu
emVyLm5ldD4KPiBTaWduZWQtb2ZmLWJ5OiBMZW8gTGkgPHN1bnBlbmcubGlAYW1kLmNvbT4KPiAt
LS0KPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jIHwgMSAtCj4g
IDEgZmlsZSBjaGFuZ2VkLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2UuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV9kZXZpY2UuYwo+IGluZGV4IDc2MTA2YWQ4YWM4NC4uNDQyNWZmMDZlY2M0
IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2Uu
Ywo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2UuYwo+IEBA
IC0xMjgsNyArMTI4LDYgQEAgc3RhdGljIERFVklDRV9BVFRSKHBjaWVfcmVwbGF5X2NvdW50LCBT
X0lSVUdPLAo+ICAJCWFtZGdwdV9kZXZpY2VfZ2V0X3BjaWVfcmVwbGF5X2NvdW50LCBOVUxMKTsK
PiAgCj4gIHN0YXRpYyB2b2lkIGFtZGdwdV9kZXZpY2VfZ2V0X3BjaWVfaW5mbyhzdHJ1Y3QgYW1k
Z3B1X2RldmljZSAqYWRldik7Cj4gLXN0YXRpYyB2b2lkIGFtZGdwdV9kZXZpY2VfcGFyc2VfZmFr
ZWRfZGlkKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KTsKPiAgCj4gIC8qKgo+ICAgKiBhbWRn
cHVfZGV2aWNlX2lzX3B4IC0gSXMgdGhlIGRldmljZSBpcyBhIGRHUFUgd2l0aCBIRy9QWCBwb3dl
ciBjb250cm9sCj4gCgpUaGFua3MgTGVvLgoKUmV2aWV3ZWQtYnk6IE1pY2hlbCBEw6RuemVyIDxt
aWNoZWwuZGFlbnplckBhbWQuY29tPgoKCi0tIApFYXJ0aGxpbmcgTWljaGVsIETDpG56ZXIgICAg
ICAgICAgICAgICB8ICAgICAgICAgICAgICBodHRwczovL3d3dy5hbWQuY29tCkxpYnJlIHNvZnR3
YXJlIGVudGh1c2lhc3QgICAgICAgICAgICAgfCAgICAgICAgICAgICBNZXNhIGFuZCBYIGRldmVs
b3BlcgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQt
Z2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
