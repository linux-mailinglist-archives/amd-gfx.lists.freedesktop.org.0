Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 847C274948
	for <lists+amd-gfx@lfdr.de>; Thu, 25 Jul 2019 10:43:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B35B86E69D;
	Thu, 25 Jul 2019 08:43:39 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from netline-mail3.netline.ch (mail.netline.ch [148.251.143.178])
 by gabe.freedesktop.org (Postfix) with ESMTP id A53916E69D
 for <amd-gfx@lists.freedesktop.org>; Thu, 25 Jul 2019 08:43:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by netline-mail3.netline.ch (Postfix) with ESMTP id BF3162A6042;
 Thu, 25 Jul 2019 10:43:37 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at netline-mail3.netline.ch
Received: from netline-mail3.netline.ch ([127.0.0.1])
 by localhost (netline-mail3.netline.ch [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id E7H04uOAb55S; Thu, 25 Jul 2019 10:43:37 +0200 (CEST)
Received: from thor (116.245.63.188.dynamic.wline.res.cust.swisscom.ch
 [188.63.245.116])
 by netline-mail3.netline.ch (Postfix) with ESMTPSA id 3385B2A6016;
 Thu, 25 Jul 2019 10:43:37 +0200 (CEST)
Received: from localhost ([::1]) by thor with esmtp (Exim 4.92)
 (envelope-from <michel@daenzer.net>)
 id 1hqZLc-0006Lt-T8; Thu, 25 Jul 2019 10:43:36 +0200
Subject: Re: [PATCH v4 2/4] drm/amdgpu: Create helper to clear
 AMDGPU_GEM_CREATE_CPU_GTT_USWC
To: "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>
References: <1563982066-21793-1-git-send-email-andrey.grodzovsky@amd.com>
 <1563982066-21793-3-git-send-email-andrey.grodzovsky@amd.com>
 <8de768fe-5089-f7a9-da25-31c96926953a@daenzer.net>
 <fc62b097-c85c-4d87-92db-96167403d26c@amd.com>
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
Message-ID: <71e94e5b-c69e-ff25-e439-6a680ffe81da@daenzer.net>
Date: Thu, 25 Jul 2019 10:43:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <fc62b097-c85c-4d87-92db-96167403d26c@amd.com>
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Wu,
 Hersen" <hersenxs.wu@amd.com>, "Koenig, Christian" <Christian.Koenig@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "S,
 Shirish" <Shirish.S@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gMjAxOS0wNy0yNCA1OjQ4IHAubS4sIEdyb2R6b3Zza3ksIEFuZHJleSB3cm90ZToKPiBPbiA3
LzI0LzE5IDExOjQwIEFNLCBNaWNoZWwgRMOkbnplciB3cm90ZToKPj4gT24gMjAxOS0wNy0yNCA1
OjI3IHAubS4sIEFuZHJleSBHcm9kem92c2t5IHdyb3RlOgo+Pj4gTW92ZSB0aGUgbG9naWMgdG8g
Y2xlYXIgQU1ER1BVX0dFTV9DUkVBVEVfQ1BVX0dUVF9VU1dDIGluCj4+PiBhbWRncHVfYm9fZG9f
Y3JlYXRlIGludG8gc3RhbmRhbG9uZSBoZWxwZXIgc28gaXQgY2FuIGJlIHJldXNlZAo+Pj4gaW4g
b3RoZXIgZnVuY3Rpb25zLgo+Pj4KPj4+IHY0Ogo+Pj4gU3dpdGNoIHRvIHJldHVybiBib29sLgo+
Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IEFuZHJleSBHcm9kem92c2t5IDxhbmRyZXkuZ3JvZHpvdnNr
eUBhbWQuY29tPgo+Pj4gLS0tCj4+PiAgIFsuLi5dCj4+Pgo+Pj4gKyNlbGlmIGRlZmluZWQoQ09O
RklHX1g4NikgJiYgIWRlZmluZWQoQ09ORklHX1g4Nl9QQVQpCj4+PiArCS8qIERvbid0IHRyeSB0
byBlbmFibGUgd3JpdGUtY29tYmluaW5nIHdoZW4gaXQgY2FuJ3Qgd29yaywgb3IgdGhpbmdzCj4+
PiArCSAqIG1heSBiZSBzbG93Cj4+PiArCSAqIFNlZSBodHRwczovL2J1Z3MuZnJlZWRlc2t0b3Au
b3JnL3Nob3dfYnVnLmNnaT9pZD04ODc1OAo+Pj4gKwkgKi8KPj4+ICsKPj4+ICsjaWZuZGVmIENP
TkZJR19DT01QSUxFX1RFU1QKPj4+ICsjd2FybmluZyBQbGVhc2UgZW5hYmxlIENPTkZJR19NVFJS
IGFuZCBDT05GSUdfWDg2X1BBVCBmb3IgYmV0dGVyIHBlcmZvcm1hbmNlIFwKPj4+ICsJIHRoYW5r
cyB0byB3cml0ZS1jb21iaW5pbmcKPj4+ICsjZW5kaWYKPj4+ICsKPj4+ICsJaWYgKGJvX2ZsYWdz
ICYgQU1ER1BVX0dFTV9DUkVBVEVfQ1BVX0dUVF9VU1dDKQo+Pj4gKwkJRFJNX0lORk9fT05DRSgi
UGxlYXNlIGVuYWJsZSBDT05GSUdfTVRSUiBhbmQgQ09ORklHX1g4Nl9QQVQgZm9yICIKPj4+ICsJ
CQkgICAgICAiYmV0dGVyIHBlcmZvcm1hbmNlIHRoYW5rcyB0byB3cml0ZS1jb21iaW5pbmdcbiIp
Owo+PiBUaGUgQU1ER1BVX0dFTV9DUkVBVEVfQ1BVX0dUVF9VU1dDIGNoZWNrIHdpbGwgYWx3YXlz
IHBhc3MgYXQgc29tZSBwb2ludAo+PiBkdWUgdG8gcGF0Y2ggMSwgc28gcGFzc2luZyBpbiB0aGUg
ZmxhZ3MgaXMga2luZCBvZiBwb2ludGxlc3MuIEp1c3QgZG8KPj4gdGhlIERSTV9JTkZPX09OQ0Ug
dW5jb25kaXRpb25hbGx5IGhlcmUuCj4gCj4gQU1ER1BVX0dFTV9DUkVBVEVfQ1BVX0dUVF9VU1dD
IGlzIHNldCB1bmNvbmRpdGlvbmFsbHkgb25seSBmb3IgRkIgY29uc29sZSBCT3MgaW4gcGF0Y2gg
MSwgZm9yIHVzZXIgbW9kZSBCT3MgdGhpcwo+IGZsYWcgbWlnaHQgbm90IGJlIHNldCBpbiB1c2Vy
IG1vZGUgYW5kIHNvIHRoaXMgd2FybmluZyBzaG91bGRuJ3QgcG9wIGluIHRoaXMgY2FzZS4KCllv
dSdyZSByaWdodCBpbiB0aGVvcnksIGJ1dCBpbiBwcmFjdGljZSB0aGlzIGlzIHByZXR0eSB1bmxp
a2VseSBhdCB0aGlzCnBvaW50LCBvdGhlciB0aGFuIG1heWJlIGEgaGVhZGxlc3MgbWFjaGluZSB3
aGljaCBvbmx5IHJ1bnMgY29tcHV0ZQp3b3JrbG9hZHMgKGluIHdoaWNoIGNhc2UgUEFUIG1pZ2h0
IGJlIGRlc2lyYWJsZSBhbnl3YXkgZm9yIG90aGVyIHJlYXNvbnM/KS4KCkFueXdheSwgaXQncyBq
dXN0IG15IG9waW5pb24gdGhhdCBubyBmbGFncyBuZWVkIHRvIGJlIHBhc3NlZCBpbiwgbm90IGEK
YmxvY2tlci4KCgotLSAKRWFydGhsaW5nIE1pY2hlbCBEw6RuemVyICAgICAgICAgICAgICAgfCAg
ICAgICAgICAgICAgaHR0cHM6Ly93d3cuYW1kLmNvbQpMaWJyZSBzb2Z0d2FyZSBlbnRodXNpYXN0
ICAgICAgICAgICAgIHwgICAgICAgICAgICAgTWVzYSBhbmQgWCBkZXZlbG9wZXIKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxp
c3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
