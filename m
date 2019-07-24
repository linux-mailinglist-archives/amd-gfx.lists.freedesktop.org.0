Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F4DE7322B
	for <lists+amd-gfx@lfdr.de>; Wed, 24 Jul 2019 16:50:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88A586E5BE;
	Wed, 24 Jul 2019 14:50:12 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from netline-mail3.netline.ch (mail.netline.ch [148.251.143.178])
 by gabe.freedesktop.org (Postfix) with ESMTP id 5AB116E5BE
 for <amd-gfx@lists.freedesktop.org>; Wed, 24 Jul 2019 14:50:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by netline-mail3.netline.ch (Postfix) with ESMTP id A701A2A6042;
 Wed, 24 Jul 2019 16:50:10 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at netline-mail3.netline.ch
Received: from netline-mail3.netline.ch ([127.0.0.1])
 by localhost (netline-mail3.netline.ch [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id GC9IM3xpV4Xq; Wed, 24 Jul 2019 16:50:10 +0200 (CEST)
Received: from thor (116.245.63.188.dynamic.wline.res.cust.swisscom.ch
 [188.63.245.116])
 by netline-mail3.netline.ch (Postfix) with ESMTPSA id 430C62A6016;
 Wed, 24 Jul 2019 16:50:10 +0200 (CEST)
Received: from localhost ([::1]) by thor with esmtp (Exim 4.92)
 (envelope-from <michel@daenzer.net>)
 id 1hqIan-0000rz-TD; Wed, 24 Jul 2019 16:50:09 +0200
Subject: Re: [PATCH v3 3/3] drm/amd: enable S/G for RAVEN chip
To: "Koenig, Christian" <Christian.Koenig@amd.com>,
 "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
References: <1563977442-4809-1-git-send-email-andrey.grodzovsky@amd.com>
 <1563977442-4809-4-git-send-email-andrey.grodzovsky@amd.com>
 <492b52b5-36e0-f957-88e1-c2479f8c56c4@amd.com>
 <e8a4de40-e60c-152a-ba4b-9ef7b1b553c1@amd.com>
 <fc3eb460-934a-afed-b654-b33021d32aa0@amd.com>
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
Message-ID: <3d0c5357-52b9-80fb-61ff-363e13086aa8@daenzer.net>
Date: Wed, 24 Jul 2019 16:50:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <fc3eb460-934a-afed-b654-b33021d32aa0@amd.com>
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
 Hersen" <hersenxs.wu@amd.com>, "S, Shirish" <Shirish.S@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gMjAxOS0wNy0yNCA0OjQxIHAubS4sIEtvZW5pZywgQ2hyaXN0aWFuIHdyb3RlOgo+IEFtIDI0
LjA3LjE5IHVtIDE2OjMyIHNjaHJpZWIgR3JvZHpvdnNreSwgQW5kcmV5Ogo+PiBPbiA3LzI0LzE5
IDEwOjI1IEFNLCBLb2VuaWcsIENocmlzdGlhbiB3cm90ZToKPj4+IEFtIDI0LjA3LjE5IHVtIDE2
OjEwIHNjaHJpZWIgQW5kcmV5IEdyb2R6b3Zza3k6Cj4+Pj4gRnJvbTogU2hpcmlzaCBTIDxzaGly
aXNoLnNAYW1kLmNvbT4KPj4+Pgo+Pj4+IGVuYWJsZXMgZ3B1X3ZtX3N1cHBvcnQgaW4gZG0gYW5k
IGFkZHMKPj4+PiBBTURHUFVfR0VNX0RPTUFJTl9HVFQgYXMgc3VwcG9ydGVkIGRvbWFpbgo+Pj4+
Cj4+Pj4gdjI6Cj4+Pj4gTW92ZSBCTyBwbGFjZW1lbnQgbG9naWMgaW50byBhbWRncHVfZGlzcGxh
eV9zdXBwb3J0ZWRfZG9tYWlucwo+Pj4+Cj4+Pj4gdjM6Cj4+Pj4gVXNlIGFtZGdwdV9ib192YWxp
ZGF0ZV91c3djIGluIGFtZGdwdV9kaXNwbGF5X3N1cHBvcnRlZF9kb21haW5zLgo+Pj4+Cj4+Pj4g
Q2hhbmdlLUlkOiBJZjM0MzAwYmVhYTYwYmUyZDM2MTcwYjdiNWIwOTZlYzY0NDUwMmIyMAo+Pj4+
IFNpZ25lZC1vZmYtYnk6IFNoaXJpc2ggUyA8c2hpcmlzaC5zQGFtZC5jb20+Cj4+Pj4gU2lnbmVk
LW9mZi1ieTogQW5kcmV5IEdyb2R6b3Zza3kgPGFuZHJleS5ncm9kem92c2t5QGFtZC5jb20+Cj4+
PiBBY3R1YWxseSB0aGF0IGRvZXNuJ3QgbG9vayBsaWtlIGEgZ29vZCBpZGVhIHRvIG1lLgo+Pj4K
Pj4+IEl0IGlzIHN0aWxsIHBlcmZlY3RseSBwb3NzaWJsZSAoYW5kIHdhbnRlZCEpIHRoYXQgdGhl
IFVTV0MgZmxhZyB3YXMgbm90Cj4+PiBzZXQgaW4gdGhlIGZpcnN0IHBsYWNlIGJ5IHVzZXJzcGFj
ZS4KPj4+Cj4+PiBJcyB0aGF0IHN0aWxsIGNoZWNrZWQgc29tZXdoZXJlPwo+Pj4KPj4+IFJlZ2Fy
ZHMsCj4+PiBDaHJpc3RpYW4uCj4+Cj4+IE5vdCBzdXJlIEkgdW5kZXJzdGFuZCBoZXJlLCBjYW4g
eW91IGVsYWJvcmF0ZSA/Cj4gCj4gSXQncyBzdGlsbCBwb3NzaWJsZSB0aGF0IHVzZXJzcGFjZSBk
b2Vzbid0IHNldCB0aGUgVVNXQyBmbGFnIGFuZCB0aGVyZSAKPiBhY3R1YWxseSBtaWdodCBiZSBn
b29kIHJlYXNvbnMgZm9yIHRoYXQuCj4gCj4gRG8gd2Ugc3RpbGwgaGF2ZSBhIGNoZWNrIGZvciB0
aGlzIGNhc2Ugc29tZXdoZXJlPwoKSXQgc291bmRzIGxpa2UgeW91J3JlIG1pc3VuZGVyc3RhbmRp
bmcgd2hhdCB0aGlzIHBhdGNoIGRvZXMsIHByb2JhYmx5CmR1ZSB0byB0aGUgd2VpcmQgYW1kZ3B1
X2JvX3ZhbGlkYXRlX3Vzd2MgQVBJLgphbWRncHVfZGlzcGxheV9zdXBwb3J0ZWRfZG9tYWlucyBk
b2Vzbid0IHNldCB0aGUgZmxhZyBmb3IgdGhlIEJPIGl0c2VsZi4KQ2hhbmdpbmcgdGhlIGhlbHBl
ciBBUEkgdG8gd2hhdCB3ZSBzdWdnZXN0ZWQgc2hvdWxkIGNsZWFyIHRoaXMgdXAuCgooTWF5YmUg
dGhlIG5ldyBoZWxwZXIgZnVuY3Rpb24gc2hvdWxkIGJlIHVzZWQgaW4KYW1kZ3B1X2Rpc3BsYXlf
c3VwcG9ydGVkX2RvbWFpbnMgaW4gcGF0Y2ggMiBhbHJlYWR5LCBvciBpbiB5ZXQgYW5vdGhlcgpz
ZXBhcmF0ZSBwYXRjaD8pCgoKLS0gCkVhcnRobGluZyBNaWNoZWwgRMOkbnplciAgICAgICAgICAg
ICAgIHwgICAgICAgICAgICAgIGh0dHBzOi8vd3d3LmFtZC5jb20KTGlicmUgc29mdHdhcmUgZW50
aHVzaWFzdCAgICAgICAgICAgICB8ICAgICAgICAgICAgIE1lc2EgYW5kIFggZGV2ZWxvcGVyCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFp
bGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
