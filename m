Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E8B561C34
	for <lists+amd-gfx@lfdr.de>; Mon,  8 Jul 2019 11:15:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85955899BE;
	Mon,  8 Jul 2019 09:15:19 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from netline-mail3.netline.ch (mail.netline.ch [148.251.143.178])
 by gabe.freedesktop.org (Postfix) with ESMTP id B499A89993
 for <amd-gfx@lists.freedesktop.org>; Mon,  8 Jul 2019 09:15:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by netline-mail3.netline.ch (Postfix) with ESMTP id A77852AA0A3;
 Mon,  8 Jul 2019 11:15:16 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at netline-mail3.netline.ch
Received: from netline-mail3.netline.ch ([127.0.0.1])
 by localhost (netline-mail3.netline.ch [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id tO8niwZHLtf5; Mon,  8 Jul 2019 11:15:16 +0200 (CEST)
Received: from thor (116.245.63.188.dynamic.wline.res.cust.swisscom.ch
 [188.63.245.116])
 by netline-mail3.netline.ch (Postfix) with ESMTPSA id 348142A6048;
 Mon,  8 Jul 2019 11:15:16 +0200 (CEST)
Received: from localhost ([::1]) by thor with esmtp (Exim 4.92)
 (envelope-from <michel@daenzer.net>)
 id 1hkPjv-0005lU-6L; Mon, 08 Jul 2019 11:15:15 +0200
Subject: Re: [PATCH] drm/amdgpu: properly guard DC support in navi code
To: Alex Deucher <alexdeucher@gmail.com>
References: <20190705204142.10231-1-alexander.deucher@amd.com>
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
Message-ID: <c62c35e2-a920-081b-6dfc-7fdab8a8b1ba@daenzer.net>
Date: Mon, 8 Jul 2019 11:15:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190705204142.10231-1-alexander.deucher@amd.com>
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
Cc: Alex Deucher <alexander.deucher@amd.com>, amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gMjAxOS0wNy0wNSAxMDo0MSBwLm0uLCBBbGV4IERldWNoZXIgd3JvdGU6Cj4gTmVlZCB0byBh
ZGQgYXBwcm9wcmlhdGUgaWZkZWYuCj4gCj4gU2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxh
bGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9udi5jIHwgNCArKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykKPiAK
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvbnYuYyBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L252LmMKPiBpbmRleCBhMDkwZTNmZGM3NjIuLmVlMzljYjc0MGQ0
MSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9udi5jCj4gKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvbnYuYwo+IEBAIC0zNTIsOCArMzUyLDEyIEBAIGlu
dCBudl9zZXRfaXBfYmxvY2tzKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQo+ICAJCQlhbWRn
cHVfZGV2aWNlX2lwX2Jsb2NrX2FkZChhZGV2LCAmc211X3YxMV8wX2lwX2Jsb2NrKTsKPiAgCQlp
ZiAoYWRldi0+ZW5hYmxlX3ZpcnR1YWxfZGlzcGxheSB8fCBhbWRncHVfc3Jpb3ZfdmYoYWRldikp
Cj4gIAkJCWFtZGdwdV9kZXZpY2VfaXBfYmxvY2tfYWRkKGFkZXYsICZkY2VfdmlydHVhbF9pcF9i
bG9jayk7Cj4gKyNpZiBkZWZpbmVkKENPTkZJR19EUk1fQU1EX0RDKQo+ICAJCWVsc2UgaWYgKGFt
ZGdwdV9kZXZpY2VfaGFzX2RjX3N1cHBvcnQoYWRldikpCj4gIAkJCWFtZGdwdV9kZXZpY2VfaXBf
YmxvY2tfYWRkKGFkZXYsICZkbV9pcF9ibG9jayk7Cj4gKyNlbHNlCj4gKyMJd2FybmluZyAiRW5h
YmxlIENPTkZJR19EUk1fQU1EX0RDIGZvciBkaXNwbGF5IHN1cHBvcnQgb24gbmF2aS4iCj4gKyNl
bmRpZgo+ICAJCWFtZGdwdV9kZXZpY2VfaXBfYmxvY2tfYWRkKGFkZXYsICZnZnhfdjEwXzBfaXBf
YmxvY2spOwo+ICAJCWFtZGdwdV9kZXZpY2VfaXBfYmxvY2tfYWRkKGFkZXYsICZzZG1hX3Y1XzBf
aXBfYmxvY2spOwo+ICAJCWlmIChhZGV2LT5maXJtd2FyZS5sb2FkX3R5cGUgPT0gQU1ER1BVX0ZX
X0xPQURfRElSRUNUICYmCj4gCgpJcyBDT05GSUdfRFJNX0FNRF9EQyBzdGlsbCBuZWVkZWQ/IFdo
YXQgZm9yPyAoT3RoZXIgdGhhbiBhY2NpZGVudGFsbHkKZGlzYWJsaW5nIGRpc3BsYXkgd2l0aCBj
dXJyZW50IGhhcmR3YXJlIDspCgoKLS0gCkVhcnRobGluZyBNaWNoZWwgRMOkbnplciAgICAgICAg
ICAgICAgIHwgICAgICAgICAgICAgIGh0dHBzOi8vd3d3LmFtZC5jb20KTGlicmUgc29mdHdhcmUg
ZW50aHVzaWFzdCAgICAgICAgICAgICB8ICAgICAgICAgICAgIE1lc2EgYW5kIFggZGV2ZWxvcGVy
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZngg
bWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
