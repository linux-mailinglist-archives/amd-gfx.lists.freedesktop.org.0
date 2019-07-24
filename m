Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BFC97318B
	for <lists+amd-gfx@lfdr.de>; Wed, 24 Jul 2019 16:24:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29DAA6E5B0;
	Wed, 24 Jul 2019 14:24:09 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from netline-mail3.netline.ch (mail.netline.ch [148.251.143.178])
 by gabe.freedesktop.org (Postfix) with ESMTP id 6E0F26E5B0
 for <amd-gfx@lists.freedesktop.org>; Wed, 24 Jul 2019 14:24:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by netline-mail3.netline.ch (Postfix) with ESMTP id 6A40F2A6042;
 Wed, 24 Jul 2019 16:24:06 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at netline-mail3.netline.ch
Received: from netline-mail3.netline.ch ([127.0.0.1])
 by localhost (netline-mail3.netline.ch [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id F8144NQYas4d; Wed, 24 Jul 2019 16:24:06 +0200 (CEST)
Received: from thor (116.245.63.188.dynamic.wline.res.cust.swisscom.ch
 [188.63.245.116])
 by netline-mail3.netline.ch (Postfix) with ESMTPSA id A467D2A6016;
 Wed, 24 Jul 2019 16:24:05 +0200 (CEST)
Received: from localhost ([::1]) by thor with esmtp (Exim 4.92)
 (envelope-from <michel@daenzer.net>)
 id 1hqIBY-0000Zd-9C; Wed, 24 Jul 2019 16:24:04 +0200
Subject: Re: [PATCH v3 2/3] drm/amdgpu: Create helper to clear
 AMDGPU_GEM_CREATE_CPU_GTT_USWC
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
References: <1563977442-4809-1-git-send-email-andrey.grodzovsky@amd.com>
 <1563977442-4809-3-git-send-email-andrey.grodzovsky@amd.com>
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
Message-ID: <e70a00d3-bcd3-c72e-8de8-eb6ae10abee6@daenzer.net>
Date: Wed, 24 Jul 2019 16:24:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1563977442-4809-3-git-send-email-andrey.grodzovsky@amd.com>
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

T24gMjAxOS0wNy0yNCA0OjEwIHAubS4sIEFuZHJleSBHcm9kem92c2t5IHdyb3RlOgo+IE1vdmUg
dGhlIGxvZ2ljIHRvIGNsZWFyIEFNREdQVV9HRU1fQ1JFQVRFX0NQVV9HVFRfVVNXQyBpbgo+IGFt
ZGdwdV9ib19kb19jcmVhdGUgaW50byBzdGFuZGFsb25lIGhlbHBlciBzbyBpdCBjYW4gYmUgcmV1
c2VkCj4gaW4gb3RoZXIgZnVuY3Rpb25zLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEFuZHJleSBHcm9k
em92c2t5IDxhbmRyZXkuZ3JvZHpvdnNreUBhbWQuY29tPgo+IC0tLQo+ICBbLi4uXQo+IAo+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfb2JqZWN0LmMgYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfb2JqZWN0LmMKPiBpbmRleCA5ODliN2I1
Li42NGM0NWJjIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV9vYmplY3QuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9vYmpl
Y3QuYwo+IEBAIC00MTMsNiArNDEzLDQxIEBAIHN0YXRpYyBib29sIGFtZGdwdV9ib192YWxpZGF0
ZV9zaXplKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LAo+ICAJcmV0dXJuIGZhbHNlOwo+ICB9
Cj4gIAo+ICt2b2lkIGFtZGdwdV9ib192YWxpZGF0ZV91c3djKHU2NCAqYm9fZmxhZ3MpCgpUaGlz
IEFQSSBpcyBhIGJpdCB3ZWlyZC4gOikgSSdkIHN1Z2dlc3Qgc29tZXRoaW5nIGxpa2UKCmJvb2wg
YW1kZ3B1X3Vzd2Nfc3VwcG9ydGVkKHZvaWQpCnsKCWlmIChbdmFyaW91cyBjb25kaXRpb25zXSkK
CQlyZXR1cm4gZmFsc2U7CgoJcmV0dXJuIHRydWU7Cn0KCj4gQEAgLTQ2NiwzMyArNTAxLDcgQEAg
c3RhdGljIGludCBhbWRncHVfYm9fZG9fY3JlYXRlKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2
LAo+IFsuLi5dCj4gKwlhbWRncHVfYm9fdmFsaWRhdGVfdXN3YygmYm8tPmZsYWdzKTsKCkFuZCB0
aGVuCgoJaWYgKCFhbWRncHVfdXN3Y19zdXBwb3J0ZWQoKSkKCQliby0+ZmxhZ3MgJj0gfkFNREdQ
VV9HRU1fQ1JFQVRFX0NQVV9HVFRfVVNXQzsKCmhlcmUuCgoKLS0gCkVhcnRobGluZyBNaWNoZWwg
RMOkbnplciAgICAgICAgICAgICAgIHwgICAgICAgICAgICAgIGh0dHBzOi8vd3d3LmFtZC5jb20K
TGlicmUgc29mdHdhcmUgZW50aHVzaWFzdCAgICAgICAgICAgICB8ICAgICAgICAgICAgIE1lc2Eg
YW5kIFggZGV2ZWxvcGVyCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
