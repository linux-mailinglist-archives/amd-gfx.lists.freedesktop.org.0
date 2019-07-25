Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C8247516A
	for <lists+amd-gfx@lfdr.de>; Thu, 25 Jul 2019 16:39:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C99B66E764;
	Thu, 25 Jul 2019 14:39:43 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from netline-mail3.netline.ch (mail.netline.ch [148.251.143.178])
 by gabe.freedesktop.org (Postfix) with ESMTP id 240736E742
 for <amd-gfx@lists.freedesktop.org>; Thu, 25 Jul 2019 14:39:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by netline-mail3.netline.ch (Postfix) with ESMTP id 01B4C2A6042;
 Thu, 25 Jul 2019 16:39:40 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at netline-mail3.netline.ch
Received: from netline-mail3.netline.ch ([127.0.0.1])
 by localhost (netline-mail3.netline.ch [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id YXI0R0JDVK77; Thu, 25 Jul 2019 16:39:40 +0200 (CEST)
Received: from thor (116.245.63.188.dynamic.wline.res.cust.swisscom.ch
 [188.63.245.116])
 by netline-mail3.netline.ch (Postfix) with ESMTPSA id 6D34A2A6016;
 Thu, 25 Jul 2019 16:39:40 +0200 (CEST)
Received: from localhost ([::1]) by thor with esmtp (Exim 4.92)
 (envelope-from <michel@daenzer.net>)
 id 1hqeuA-0008Ck-7g; Thu, 25 Jul 2019 16:39:38 +0200
Subject: Re: [PATCH v5 0/4] Enable S/G for Picasso
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
References: <1564064683-31796-1-git-send-email-andrey.grodzovsky@amd.com>
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
Message-ID: <f4a6b05c-af48-fd8b-3569-51c359081be2@daenzer.net>
Date: Thu, 25 Jul 2019 16:39:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1564064683-31796-1-git-send-email-andrey.grodzovsky@amd.com>
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

T24gMjAxOS0wNy0yNSA0OjI0IHAubS4sIEFuZHJleSBHcm9kem92c2t5IHdyb3RlOgo+IEZpcnN0
IHBhdGNoZXMgZml4ZXMgYSBoYXJkIGhhbmcgaW50cm9kdWNlZCBieSBwbGFjaW5nIHRoZSBkaXNw
bGF5IEJPIGluIAo+IEdUVCBtZW1vcnkgYmVjYXVzZSBvZiBIVyBpc3N1ZXMgd2l0aCBjYWNoZWQg
bWFwcGluZ3MuIFNlY29uZCBwYXRjaCBkb2VzCj4gc29tZSBtaW5vciByZWFmYWN0b3JpbmcgdG8g
cmVzdWUgY29kZSBpbiB0aHJpZCBwYXRjaC4gVGhpcmQgcGF0Y2ggYWRkcwo+IGNoZWNrIGZvciBV
U1dDIHN1cHBvcnQgYXMgY29uZGl0aW9uIHRvIHBsYWNpbmcgQVBVcyBzY2Fub3V0IEJPIGluIEdU
VC4KPiBMYXN0IHBhdGNoIGVuYWJsZXMgUy9HLgo+IAo+IEFuZHJleSBHcm9kem92c2t5ICgzKToK
PiAgIGRybS9hbWRncHU6IEZpeCBoYXJkIGhhbmcgZm9yIFMvRyBkaXNwbGF5IEJPcy4KPiAgIGRy
bS9hbWRncHU6IENyZWF0ZSBoZWxwZXIgdG8gY2xlYXIgQU1ER1BVX0dFTV9DUkVBVEVfQ1BVX0dU
VF9VU1dDCj4gICBkcm0vYW1kZ3B1OiBBZGQgY2hlY2sgZm9yIFVTV0Mgc3VwcG9ydCBmb3IKPiAg
ICAgYW1kZ3B1X2Rpc3BsYXlfc3VwcG9ydGVkX2RvbWFpbnMKPiAKPiBTaGlyaXNoIFMgKDEpOgo+
ICAgZHJtL2FtZC9kaXNwbGF5OiBlbmFibGUgUy9HIGZvciBSQVZFTiBjaGlwCgpQYXRjaGVzIDIg
JiAzIGFyZQoKQWNrZWQtYnk6IE1pY2hlbCBEw6RuemVyIDxtaWNoZWwuZGFlbnplckBhbWQuY29t
PgoKCi0tIApFYXJ0aGxpbmcgTWljaGVsIETDpG56ZXIgICAgICAgICAgICAgICB8ICAgICAgICAg
ICAgICBodHRwczovL3d3dy5hbWQuY29tCkxpYnJlIHNvZnR3YXJlIGVudGh1c2lhc3QgICAgICAg
ICAgICAgfCAgICAgICAgICAgICBNZXNhIGFuZCBYIGRldmVsb3BlcgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQt
Z2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
