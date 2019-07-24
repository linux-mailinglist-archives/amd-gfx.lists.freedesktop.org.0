Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 86BC97326D
	for <lists+amd-gfx@lfdr.de>; Wed, 24 Jul 2019 17:03:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C49F86E5CA;
	Wed, 24 Jul 2019 15:03:54 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from netline-mail3.netline.ch (mail.netline.ch [148.251.143.178])
 by gabe.freedesktop.org (Postfix) with ESMTP id 76A356E5CA
 for <amd-gfx@lists.freedesktop.org>; Wed, 24 Jul 2019 15:03:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by netline-mail3.netline.ch (Postfix) with ESMTP id B41D52A6042;
 Wed, 24 Jul 2019 17:03:52 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at netline-mail3.netline.ch
Received: from netline-mail3.netline.ch ([127.0.0.1])
 by localhost (netline-mail3.netline.ch [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id PtRnaxgfLC3v; Wed, 24 Jul 2019 17:03:52 +0200 (CEST)
Received: from thor (116.245.63.188.dynamic.wline.res.cust.swisscom.ch
 [188.63.245.116])
 by netline-mail3.netline.ch (Postfix) with ESMTPSA id 12BEB2A6016;
 Wed, 24 Jul 2019 17:03:52 +0200 (CEST)
Received: from localhost ([::1]) by thor with esmtp (Exim 4.92)
 (envelope-from <michel@daenzer.net>)
 id 1hqIo3-0000yX-Nd; Wed, 24 Jul 2019 17:03:51 +0200
Subject: Re: [PATCH v3 1/3] drm/amdgpu: Fix hard hang for S/G display BOs.
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
References: <1563977442-4809-1-git-send-email-andrey.grodzovsky@amd.com>
 <1563977442-4809-2-git-send-email-andrey.grodzovsky@amd.com>
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
Message-ID: <ed12491c-0dd9-859e-5a20-00c408977937@daenzer.net>
Date: Wed, 24 Jul 2019 17:03:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1563977442-4809-2-git-send-email-andrey.grodzovsky@amd.com>
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

Ckp1c3Qgc29tZSBjb3NtZXRpYyBub3RlcyBvbiB0aGlzIG9uZToKCk9uIDIwMTktMDctMjQgNDox
MCBwLm0uLCBBbmRyZXkgR3JvZHpvdnNreSB3cm90ZToKPiBIVyByZXF1aXJlcyBmb3IgY2FjaGlu
ZyB0byBiZSB1bnNldCBmb3Igc2Nhbm91dCBCTwo+IG1hcHBpbmdzIHdoZW4gdGhlIEJPIHBsYWNl
bWVudCBpcyBpbiBHVFQgbWVtb3J5Lgo+IFVzdWFsbHkgdGhlIGZsYWcgdG8gdW5zZXQgaXMgcGFz
c2VkIGZyb20gdXNlciBtb2RlCj4gYnV0IGZvciBGQiBtb2RlIHRoaXMgd2FzIG1pc3NpbmcuCj4g
Cj4gdjI6Cj4gTW92ZSBhbGwgQk8gcGxhY2VtbnQgbG9naWMgdG8gYW1kZ3B1X2Rpc3BsYXlfc3Vw
cG9ydGVkX2RvbWFpbnMKClNwZWxsaW5nOiAicGxhY2VtbnQiID0+ICJwbGFjZW1lbnQiCgpUaGlz
IG5vdGUgaXMgYSBiaXQgY29uZnVzaW5nLCBzaW5jZSB0aGlzIHBhdGNoIGRvZXNuJ3QgbW92ZSBh
bnl0aGluZwppbnRvIGFtZGdwdV9kaXNwbGF5X3N1cHBvcnRlZF9kb21haW5zLiBIb3cgYWJvdXQg
ZS5nLiAiS2VlcCBhbGwgQk8KcGxhY2VtZW50IGxvZ2ljIGluIGFtZGdwdV9kaXNwbGF5X3N1cHBv
cnRlZF9kb21haW5zIj8KCgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfZmIuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9mYi5jCj4g
aW5kZXggZTQ3NjA5Mi4uYmYwYzYxYiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHVfZmIuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV9mYi5jCj4gQEAgLTEzNywxNCArMTM3LDE0IEBAIHN0YXRpYyBpbnQgYW1kZ3B1ZmJfY3Jl
YXRlX3Bpbm5lZF9vYmplY3Qoc3RydWN0IGFtZGdwdV9mYmRldiAqcmZiZGV2LAo+ICAJbW9kZV9j
bWQtPnBpdGNoZXNbMF0gPSBhbWRncHVfYWxpZ25fcGl0Y2goYWRldiwgbW9kZV9jbWQtPndpZHRo
LCBjcHAsCj4gIAkJCQkJCSAgZmJfdGlsZWQpOwo+ICAJZG9tYWluID0gYW1kZ3B1X2Rpc3BsYXlf
c3VwcG9ydGVkX2RvbWFpbnMoYWRldik7Cj4gLQo+ICAJaGVpZ2h0ID0gQUxJR04obW9kZV9jbWQt
PmhlaWdodCwgOCk7Cj4gIAlbLi4uXQo+IEBAIC0xNjYsNyArMTY2LDYgQEAgc3RhdGljIGludCBh
bWRncHVmYl9jcmVhdGVfcGlubmVkX29iamVjdChzdHJ1Y3QgYW1kZ3B1X2ZiZGV2ICpyZmJkZXYs
Cj4gIAkJCWRldl9lcnIoYWRldi0+ZGV2LCAiRkIgZmFpbGVkIHRvIHNldCB0aWxpbmcgZmxhZ3Nc
biIpOwo+ICAJfQo+ICAKPiAtCj4gIAlyZXQgPSBhbWRncHVfYm9fcGluKGFibywgZG9tYWluKTsK
PiAgCWlmIChyZXQpIHsKPiAgCQlhbWRncHVfYm9fdW5yZXNlcnZlKGFibyk7CgpQbGVhc2UgZHJv
cCB0aGUgcmVtb3ZhbCBvZiB0aGVzZSBlbXB0eSBsaW5lcyBmcm9tIHRoaXMgcGF0Y2guCgoKLS0g
CkVhcnRobGluZyBNaWNoZWwgRMOkbnplciAgICAgICAgICAgICAgIHwgICAgICAgICAgICAgIGh0
dHBzOi8vd3d3LmFtZC5jb20KTGlicmUgc29mdHdhcmUgZW50aHVzaWFzdCAgICAgICAgICAgICB8
ICAgICAgICAgICAgIE1lc2EgYW5kIFggZGV2ZWxvcGVyCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vYW1kLWdmeA==
