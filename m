Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 884C420275
	for <lists+amd-gfx@lfdr.de>; Thu, 16 May 2019 11:24:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32AA68932E;
	Thu, 16 May 2019 09:24:37 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from netline-mail3.netline.ch (mail.netline.ch [148.251.143.178])
 by gabe.freedesktop.org (Postfix) with ESMTP id 897B889337
 for <amd-gfx@lists.freedesktop.org>; Thu, 16 May 2019 09:24:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by netline-mail3.netline.ch (Postfix) with ESMTP id BEA192A6048
 for <amd-gfx@lists.freedesktop.org>; Thu, 16 May 2019 11:24:34 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at netline-mail3.netline.ch
Received: from netline-mail3.netline.ch ([127.0.0.1])
 by localhost (netline-mail3.netline.ch [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id jE9F2iK2SP4w for <amd-gfx@lists.freedesktop.org>;
 Thu, 16 May 2019 11:24:34 +0200 (CEST)
Received: from thor (116.245.63.188.dynamic.wline.res.cust.swisscom.ch
 [188.63.245.116])
 by netline-mail3.netline.ch (Postfix) with ESMTPSA id 7A3C22A6016
 for <amd-gfx@lists.freedesktop.org>; Thu, 16 May 2019 11:24:34 +0200 (CEST)
Received: from localhost ([::1]) by thor with esmtp (Exim 4.92)
 (envelope-from <michel@daenzer.net>) id 1hRCcl-0004BX-JU
 for amd-gfx@lists.freedesktop.org; Thu, 16 May 2019 11:24:27 +0200
Subject: Re: Compiler warnings with current amd-staging-drm-next
From: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>
To: amd-gfx@lists.freedesktop.org
References: <5f2e79b5-4acb-127e-fe88-7b23ed3345c7@daenzer.net>
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
Message-ID: <8cae7bac-51cb-4c45-a7a9-c25785ae0035@daenzer.net>
Date: Thu, 16 May 2019 11:24:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <5f2e79b5-4acb-127e-fe88-7b23ed3345c7@daenzer.net>
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gMjAxOS0wNS0xMCAxOjE3IHAubS4sIE1pY2hlbCBEw6RuemVyIHdyb3RlOgo+IAo+IGRyaXZl
cnMvZ3B1L2RybS8vYW1kL2FtZGdwdS9kZl92M182LmM6IEluIGZ1bmN0aW9uIOKAmGRmX3YzXzZf
cG1jX3N0YXJ04oCZOgo+IGRyaXZlcnMvZ3B1L2RybS8vYW1kL2FtZGdwdS9kZl92M182LmM6NDgy
Ojk6IHdhcm5pbmc6IOKAmHJldOKAmSBtYXkgYmUgdXNlZCB1bmluaXRpYWxpemVkIGluIHRoaXMg
ZnVuY3Rpb24gWy1XbWF5YmUtdW5pbml0aWFsaXplZF0KPiAgIHJldHVybiByZXQ7Cj4gICAgICAg
ICAgXn5+CgpUaGlzIHdhcm5pbmcgaXMgc3RpbGwgdGhlcmU7IHRoZSBvdGhlcnMgaGF2ZSBiZWVu
IGZpeGVkLgoKCk90aGVyIHdhcm5pbmdzIGhhdmUgYmVlbiBpbnRyb2R1Y2VkIHRob3VnaDoKCmRy
aXZlcnMvZ3B1L2RybS8vYW1kL2FtZGdwdS8uLi9wb3dlcnBsYXkvdmVnYTIwX3BwdC5jOiBJbiBm
dW5jdGlvbiDigJh2ZWdhMjBfZ2V0X3BwZmVhdHVyZV9zdGF0dXPigJk6CmRyaXZlcnMvZ3B1L2Ry
bS8vYW1kL2FtZGdwdS8uLi9wb3dlcnBsYXkvdmVnYTIwX3BwdC5jOjIzODc6MTAzOiB3YXJuaW5n
OiDigJhmZWF0dXJlX21hc2vigJkgbWF5IGJlIHVzZWQgdW5pbml0aWFsaXplZCBpbiB0aGlzIGZ1
bmN0aW9uIFstV21heWJlLXVuaW5pdGlhbGl6ZWRdCiAgKmZlYXR1cmVzX2VuYWJsZWQgPSAoKCgo
dWludDY0X3QpZmVhdHVyZV9tYXNrWzBdIDw8IFNNVV9GRUFUVVJFU19MT1dfU0hJRlQpICYgU01V
X0ZFQVRVUkVTX0xPV19NQVNLKSB8CiAgICAgICAgICAgICAgICAgICAgICB+fn5+fn5+fn5+fn5+
fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+
fn5+fn5+fn5+fn5eCiAgICAoKCh1aW50NjRfdClmZWF0dXJlX21hc2tbMV0gPDwgU01VX0ZFQVRV
UkVTX0hJR0hfU0hJRlQpICYgU01VX0ZFQVRVUkVTX0hJR0hfTUFTSykpOwogICAgfn5+fn5+fn5+
fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+
fn5+fn5+fn5+fn5+fn5+fiAgICAgICAgICAgICAgICAgIApkcml2ZXJzL2dwdS9kcm0vL2FtZC9h
bWRncHUvLi4vcG93ZXJwbGF5L3ZlZ2EyMF9wcHQuYzogSW4gZnVuY3Rpb24g4oCYdmVnYTIwX3Nl
dF9wcGZlYXR1cmVfc3RhdHVz4oCZOgpkcml2ZXJzL2dwdS9kcm0vL2FtZC9hbWRncHUvLi4vcG93
ZXJwbGF5L3ZlZ2EyMF9wcHQuYzoyMzg3OjEwMzogd2FybmluZzog4oCYZmVhdHVyZV9tYXNr4oCZ
IG1heSBiZSB1c2VkIHVuaW5pdGlhbGl6ZWQgaW4gdGhpcyBmdW5jdGlvbiBbLVdtYXliZS11bmlu
aXRpYWxpemVkXQogICpmZWF0dXJlc19lbmFibGVkID0gKCgoKHVpbnQ2NF90KWZlYXR1cmVfbWFz
a1swXSA8PCBTTVVfRkVBVFVSRVNfTE9XX1NISUZUKSAmIFNNVV9GRUFUVVJFU19MT1dfTUFTSykg
fAogICAgICAgICAgICAgICAgICAgICAgfn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+
fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+XgogICAgKCgo
dWludDY0X3QpZmVhdHVyZV9tYXNrWzFdIDw8IFNNVV9GRUFUVVJFU19ISUdIX1NISUZUKSAmIFNN
VV9GRUFUVVJFU19ISUdIX01BU0spKTsKICAgIH5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+
fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn4gICAg
ICAgICAgICAgICAgICAKCgotLSAKRWFydGhsaW5nIE1pY2hlbCBEw6RuemVyICAgICAgICAgICAg
ICAgfCAgICAgICAgICAgICAgaHR0cHM6Ly93d3cuYW1kLmNvbQpMaWJyZSBzb2Z0d2FyZSBlbnRo
dXNpYXN0ICAgICAgICAgICAgIHwgICAgICAgICAgICAgTWVzYSBhbmQgWCBkZXZlbG9wZXIKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWls
aW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
