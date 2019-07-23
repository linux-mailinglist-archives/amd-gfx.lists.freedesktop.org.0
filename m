Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82F5271CB4
	for <lists+amd-gfx@lfdr.de>; Tue, 23 Jul 2019 18:19:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB1326E30B;
	Tue, 23 Jul 2019 16:19:16 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from netline-mail3.netline.ch (mail.netline.ch [148.251.143.178])
 by gabe.freedesktop.org (Postfix) with ESMTP id E21386E30B
 for <amd-gfx@lists.freedesktop.org>; Tue, 23 Jul 2019 16:19:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by netline-mail3.netline.ch (Postfix) with ESMTP id 0DD732E2003;
 Tue, 23 Jul 2019 18:19:15 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at netline-mail3.netline.ch
Received: from netline-mail3.netline.ch ([127.0.0.1])
 by localhost (netline-mail3.netline.ch [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id AIvXN-NCnnHx; Tue, 23 Jul 2019 18:19:14 +0200 (CEST)
Received: from thor (116.245.63.188.dynamic.wline.res.cust.swisscom.ch
 [188.63.245.116])
 by netline-mail3.netline.ch (Postfix) with ESMTPSA id AAE912E2002;
 Tue, 23 Jul 2019 18:19:14 +0200 (CEST)
Received: from localhost ([::1]) by thor with esmtp (Exim 4.92)
 (envelope-from <michel@daenzer.net>)
 id 1hpxVI-00026Q-M0; Tue, 23 Jul 2019 18:19:04 +0200
Subject: Re: [PATCH 1/3] drm/amdgpu: Fix hard hang for S/G display BOs.
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
References: <1563897851-11501-1-git-send-email-andrey.grodzovsky@amd.com>
 <1563897851-11501-2-git-send-email-andrey.grodzovsky@amd.com>
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
Message-ID: <d4c126b7-4fa5-19ff-6687-9a260927dc67@daenzer.net>
Date: Tue, 23 Jul 2019 18:18:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1563897851-11501-2-git-send-email-andrey.grodzovsky@amd.com>
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

T24gMjAxOS0wNy0yMyA2OjA0IHAubS4sIEFuZHJleSBHcm9kem92c2t5IHdyb3RlOgo+IEhXIHJl
cXVpcmVzIGZvciBjYWNoaW5nIHRvIGJlIHVuc2V0IGZvciBzY2Fub3V0IEJPCj4gbWFwcGluZ3Mg
d2hlbiB0aGUgQk8gcGxhY2VtZW50IGlzIGluIEdUVCBtZW1vcnkuCj4gVXN1YWxseSB0aGUgZmxh
ZyB0byB1bnNldCBpcyBwYXNzZWQgZnJvbSB1c2VyIG1vZGUKPiBidXQgZm9yIEZCIG1vZGUgdGhp
cyB3YXMgbWlzc2luZy4KPiAKPiBTdWdnZXN0ZWQtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVy
LmRldWNoZXJAYW1kLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXkgR3JvZHpvdnNreSA8YW5k
cmV5Lmdyb2R6b3Zza3lAYW1kLmNvbT4KPiBSZXZpZXdlZC1ieTogQWxleCBEZXVjaGVyIDxhbGV4
YW5kZXIuZGV1Y2hlckBhbWQuY29tPgo+IFRlc3RlZC1ieTogU2hpcmlzaCBTIDxzaGlyaXNoLnNA
YW1kLmNvbT4KPiAtLS0KPiAgWy4uLl0KPiAKPiBAQCAtMTY2LDYgKzE2NiwxNCBAQCBzdGF0aWMg
aW50IGFtZGdwdWZiX2NyZWF0ZV9waW5uZWRfb2JqZWN0KHN0cnVjdCBhbWRncHVfZmJkZXYgKnJm
YmRldiwKPiAgCQkJZGV2X2VycihhZGV2LT5kZXYsICJGQiBmYWlsZWQgdG8gc2V0IHRpbGluZyBm
bGFnc1xuIik7Cj4gIAl9Cj4gIAo+ICsJLyoKPiArCSAqIElmIHRoZSBBTURHUFVfR0VNX0NSRUFU
RV9DUFVfR1RUX1VTV0MgZmxhZyB3YXMgcmVtb3ZlZCBkdXJpbmcgQk8KPiArCSAqIGNyZWF0aW9u
IGl0IG1lYW5zIHRoYXQgVVNXQyBpcyBub3Qgc3VwcG9ydGVkIGZvciB0aGlzIGJvYXJkIGFuZAo+
ICsJICogc28gdG8gYXZvaWQgaGFuZyBjYXVzZWQgYnkgcGxhY2VtZW50IG9mIHNjYW5vdXQgQk8g
aW4gR1RUIG9uIGNlcnRhaW4KPiArCSAqIEFQVXMgYW5kIHN0aWxsIGxpZ2h0IHVwLCBmb3JjZSB0
aGUgQk8gcGxhY2VtZW50IHRvIFZSQU0uCj4gKwkgKi8KPiArCWlmIChhYm8tPmZsYWdzICYgfkFN
REdQVV9HRU1fQ1JFQVRFX0NQVV9HVFRfVVNXQykKPiArCQlkb21haW4gID0gQU1ER1BVX0dFTV9E
T01BSU5fVlJBTTsKClRoZSBjb21tZW50IHNvdW5kcyBsaWtlIHlvdSBtZWFudAoKCWlmICghKGFi
by0+ZmxhZ3MgJiBBTURHUFVfR0VNX0NSRUFURV9DUFVfR1RUX1VTV0MpKQoJCWRvbWFpbiAgPSBB
TURHUFVfR0VNX0RPTUFJTl9WUkFNOwoKPwoKQW55d2F5LCB0aGlzIHNob3VsZCBiZSBoYW5kbGVk
IGluIGFtZGdwdV9kaXNwbGF5X3N1cHBvcnRlZF9kb21haW5zCmluc3RlYWQgKGUuZy4gYnkgbm90
IGFsbG93aW5nIEdUVCBpZiBDT05GSUdfWDg2XzMyIGlzIGRlZmluZWQpLApvdGhlcndpc2UgdGhl
IEJPIGNvdWxkIHN0aWxsIGJlIHBpbm5lZCB0byBHVFQgbGF0ZXIuCgoKPiBAQCAtNzYxLDYgKzc2
Miw3IEBAIGludCBhbWRncHVfbW9kZV9kdW1iX2NyZWF0ZShzdHJ1Y3QgZHJtX2ZpbGUgKmZpbGVf
cHJpdiwKPiAgCWFyZ3MtPnNpemUgPSBBTElHTihhcmdzLT5zaXplLCBQQUdFX1NJWkUpOwo+ICAJ
ZG9tYWluID0gYW1kZ3B1X2JvX2dldF9wcmVmZXJyZWRfcGluX2RvbWFpbihhZGV2LAo+ICAJCQkJ
YW1kZ3B1X2Rpc3BsYXlfc3VwcG9ydGVkX2RvbWFpbnMoYWRldikpOwo+ICsKPiAgCXIgPSBhbWRn
cHVfZ2VtX29iamVjdF9jcmVhdGUoYWRldiwgYXJncy0+c2l6ZSwgMCwgZG9tYWluLCBmbGFncywK
PiAgCQkJCSAgICAgdHRtX2JvX3R5cGVfZGV2aWNlLCBOVUxMLCAmZ29iaik7Cj4gIAlpZiAocikK
PiAKCkRyb3AgdGhpcyBodW5rIHdpdGggb25seSB3aGl0ZXNwYWNlIGNoYW5nZXMuCgoKLS0gCkVh
cnRobGluZyBNaWNoZWwgRMOkbnplciAgICAgICAgICAgICAgIHwgICAgICAgICAgICAgIGh0dHBz
Oi8vd3d3LmFtZC5jb20KTGlicmUgc29mdHdhcmUgZW50aHVzaWFzdCAgICAgICAgICAgICB8ICAg
ICAgICAgICAgIE1lc2EgYW5kIFggZGV2ZWxvcGVyCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vYW1kLWdmeA==
