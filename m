Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CBE172928
	for <lists+amd-gfx@lfdr.de>; Wed, 24 Jul 2019 09:43:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A96C26E488;
	Wed, 24 Jul 2019 07:43:40 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from netline-mail3.netline.ch (mail.netline.ch [148.251.143.178])
 by gabe.freedesktop.org (Postfix) with ESMTP id 7E7C76E488
 for <amd-gfx@lists.freedesktop.org>; Wed, 24 Jul 2019 07:43:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by netline-mail3.netline.ch (Postfix) with ESMTP id CE18A2A6042;
 Wed, 24 Jul 2019 09:43:38 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at netline-mail3.netline.ch
Received: from netline-mail3.netline.ch ([127.0.0.1])
 by localhost (netline-mail3.netline.ch [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id 3JO7VR0mFnUj; Wed, 24 Jul 2019 09:43:38 +0200 (CEST)
Received: from thor (116.245.63.188.dynamic.wline.res.cust.swisscom.ch
 [188.63.245.116])
 by netline-mail3.netline.ch (Postfix) with ESMTPSA id 1F98A2A6016;
 Wed, 24 Jul 2019 09:43:38 +0200 (CEST)
Received: from localhost ([::1]) by thor with esmtp (Exim 4.92)
 (envelope-from <michel@daenzer.net>)
 id 1hqBvw-0006g2-Nr; Wed, 24 Jul 2019 09:43:32 +0200
Subject: Re: [PATCH 1/3] drm/amdgpu: Fix hard hang for S/G display BOs.
To: "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>
References: <1563897851-11501-1-git-send-email-andrey.grodzovsky@amd.com>
 <1563897851-11501-2-git-send-email-andrey.grodzovsky@amd.com>
 <d4c126b7-4fa5-19ff-6687-9a260927dc67@daenzer.net>
 <ced516f5-546d-cd49-6e0e-87d2528bde41@amd.com>
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
Message-ID: <8e1b34f3-46b3-b252-3fa5-9a489ec8c35c@daenzer.net>
Date: Wed, 24 Jul 2019 09:43:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <ced516f5-546d-cd49-6e0e-87d2528bde41@amd.com>
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

T24gMjAxOS0wNy0yMyA3OjMxIHAubS4sIEdyb2R6b3Zza3ksIEFuZHJleSB3cm90ZToKPiBPbiA3
LzIzLzE5IDEyOjE4IFBNLCBNaWNoZWwgRMOkbnplciB3cm90ZToKPj4KPj4gQW55d2F5LCB0aGlz
IHNob3VsZCBiZSBoYW5kbGVkIGluIGFtZGdwdV9kaXNwbGF5X3N1cHBvcnRlZF9kb21haW5zCj4+
IGluc3RlYWQgKGUuZy4gYnkgbm90IGFsbG93aW5nIEdUVCBpZiBDT05GSUdfWDg2XzMyIGlzIGRl
ZmluZWQpLAo+IAo+IAo+IFdlIGhhdmUgZHJtX2FyY2hfY2FuX3djX21lbW9yeSBmdW5jdGlvbiB0
byBjb3ZlciBhbGwgdGhlIGNhc2VzIHdoZW4gVVNXQyAKPiBtYXBwaW5nIGlzIG5vdCBhbGxvd2Vk
LCB3aHkgdGhlIENPTkZJR19YODZfMzIgaGVyZSA/CgpJdCdzIG9uZSBjYXNlIHdoZXJlIGFtZGdw
dV9ib19kb19jcmVhdGUoKSBjbGVhcnMgdGhlCkFNREdQVV9HRU1fQ1JFQVRFX0NQVV9HVFRfVVNX
QyBmbGFnLgoKCj4+IG90aGVyd2lzZSB0aGUgQk8gY291bGQgc3RpbGwgYmUgcGlubmVkIHRvIEdU
VCBsYXRlci4KPiAKPiBUaGUgb25seSBvdGhlciBsYXRlciBwbGFjZSBJIGtub3cgaXMgZG1fcGxh
bmVfaGVscGVyX3ByZXBhcmVfZmIgb2Ygd2hpY2ggCj4gSSB0YWtlIGNhcmUgaW4gcGF0Y2ggMy4g
V2hhdCBvdGhlciBwbGFjZXMgeW91IGhhdmUgaW4gbWluZCA/CgphbWRncHVfZG1hX2J1Zl9iZWdp
bl9jcHVfYWNjZXNzICYgYW1kZ3B1X21vZGVfZHVtYl9jcmVhdGUuIChXaGlsZSBub3QKaGFuZGxp
bmcgaXQgdGhlcmUgcHJvYmFibHkgd29uJ3QgY2F1c2UgaGFuZ3MsIGl0J2QgbGlrZWx5IHJlc3Vs
dCBpbgpzdXBlcmZsdW91cyBCTyBtaWdyYXRpb25zKQoKQnV0IGV2ZW4gaWYgdGhlcmUgd2VyZSBu
byBvdGhlciBwbGFjZXMgcmlnaHQgbm93LCBoYW5kbGluZyBpdCBzZXBhcmF0ZWx5CndvdWxkIGJl
IGZyYWdpbGUgV1JUIGZ1dHVyZSBhbWRncHVfZGlzcGxheV9zdXBwb3J0ZWRfZG9tYWlucyBjYWxs
ZXJzCmdldHRpbmcgaXQgd3JvbmcuCgpBbnl3YXksIHlvdSdyZSBhdHRlbXB0aW5nIHRvIGhhbmRs
ZSBpdCBpbgphbWRncHVfZGlzcGxheV9zdXBwb3J0ZWRfZG9tYWlucyBpbiB0aGUgdjIgc2VyaWVz
LCB0aGFua3MuCgoKLS0gCkVhcnRobGluZyBNaWNoZWwgRMOkbnplciAgICAgICAgICAgICAgIHwg
ICAgICAgICAgICAgIGh0dHBzOi8vd3d3LmFtZC5jb20KTGlicmUgc29mdHdhcmUgZW50aHVzaWFz
dCAgICAgICAgICAgICB8ICAgICAgICAgICAgIE1lc2EgYW5kIFggZGV2ZWxvcGVyCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBs
aXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
