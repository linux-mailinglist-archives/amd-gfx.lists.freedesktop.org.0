Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92A906D052
	for <lists+amd-gfx@lfdr.de>; Thu, 18 Jul 2019 16:50:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 144006E314;
	Thu, 18 Jul 2019 14:50:02 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from netline-mail3.netline.ch (mail.netline.ch [148.251.143.178])
 by gabe.freedesktop.org (Postfix) with ESMTP id 2B2F66E314
 for <amd-gfx@lists.freedesktop.org>; Thu, 18 Jul 2019 14:50:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by netline-mail3.netline.ch (Postfix) with ESMTP id 443872A6045;
 Thu, 18 Jul 2019 16:49:59 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at netline-mail3.netline.ch
Received: from netline-mail3.netline.ch ([127.0.0.1])
 by localhost (netline-mail3.netline.ch [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id XUQBnvxWNBry; Thu, 18 Jul 2019 16:49:58 +0200 (CEST)
Received: from thor (116.245.63.188.dynamic.wline.res.cust.swisscom.ch
 [188.63.245.116])
 by netline-mail3.netline.ch (Postfix) with ESMTPSA id 689CA2A6042;
 Thu, 18 Jul 2019 16:49:58 +0200 (CEST)
Received: from localhost ([::1]) by thor with esmtp (Exim 4.92)
 (envelope-from <michel@daenzer.net>)
 id 1ho7jI-0005FE-M6; Thu, 18 Jul 2019 16:49:56 +0200
Subject: Re: [PATCH 07/87] drm/amd/display: move bw calc code into helpers
To: sunpeng.li@amd.com
References: <20190715212049.4584-1-sunpeng.li@amd.com>
 <20190715212049.4584-8-sunpeng.li@amd.com>
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
Message-ID: <66c6c4d7-34b3-b73b-4e21-f745fff470cd@daenzer.net>
Date: Thu, 18 Jul 2019 16:49:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190715212049.4584-8-sunpeng.li@amd.com>
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
Cc: Fatemeh Darbehani <Fatemeh.Darbehani@amd.com>,
 Eric Yang <Eric.Yang2@amd.com>, amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gMjAxOS0wNy0xNSAxMToxOSBwLm0uLCBzdW5wZW5nLmxpQGFtZC5jb20gd3JvdGU6Cj4gRnJv
bTogRXJpYyBZYW5nIDxFcmljLllhbmcyQGFtZC5jb20+Cj4gCj4gW1doeV0KPiBGb3IgYmV0dGVy
IHJlYWRhYmlsaXR5IGFuZCByZXVzYWJpbGl0eQo+IAo+IFtIb3ddCj4gTW92ZSBzbmlwcGV0cyBv
ZiBCVyBjYWxjdWxhdGlvbiBjb2RlIGludG8gaGVscGVycy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBF
cmljIFlhbmcgPEVyaWMuWWFuZzJAYW1kLmNvbT4KPiBSZXZpZXdlZC1ieTogRmF0ZW1laCBEYXJi
ZWhhbmkgPEZhdGVtZWguRGFyYmVoYW5pQGFtZC5jb20+Cj4gQWNrZWQtYnk6IExlbyBMaSA8c3Vu
cGVuZy5saUBhbWQuY29tPgo+IC0tLQo+ICBbLi4uXQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHVfZGV2aWNlLmMKPiBpbmRleCAwODZkMmYzYjBkYjMuLmU5Y2NmNDFlMzFl
ZSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNl
LmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMKPiBA
QCAtMTI2LDYgKzEyNiw3IEBAIHN0YXRpYyBERVZJQ0VfQVRUUihwY2llX3JlcGxheV9jb3VudCwg
U19JUlVHTywKPiAgCQlhbWRncHVfZGV2aWNlX2dldF9wY2llX3JlcGxheV9jb3VudCwgTlVMTCk7
Cj4gIAo+ICBzdGF0aWMgdm9pZCBhbWRncHVfZGV2aWNlX2dldF9wY2llX2luZm8oc3RydWN0IGFt
ZGdwdV9kZXZpY2UgKmFkZXYpOwo+ICtzdGF0aWMgdm9pZCBhbWRncHVfZGV2aWNlX3BhcnNlX2Zh
a2VkX2RpZChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldik7CgpUaGlzIGZ1bmN0aW9uIGlzbid0
IGRlZmluZWQgYW55d2hlcmUsIHByb2R1Y2luZyBhIHdhcm5pbmc6Cgpkcml2ZXJzL2dwdS9kcm0v
L2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jOjEzMToxMzogd2FybmluZzog4oCYYW1kZ3B1X2Rl
dmljZV9wYXJzZV9mYWtlZF9kaWTigJkgZGVjbGFyZWQg4oCYc3RhdGlj4oCZIGJ1dCBuZXZlciBk
ZWZpbmVkIFstV3VudXNlZC1mdW5jdGlvbl0KIHN0YXRpYyB2b2lkIGFtZGdwdV9kZXZpY2VfcGFy
c2VfZmFrZWRfZGlkKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KTsKICAgICAgICAgICAgIF5+
fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+CgoKLS0gCkVhcnRobGluZyBNaWNoZWwgRMOkbnpl
ciAgICAgICAgICAgICAgIHwgICAgICAgICAgICAgIGh0dHBzOi8vd3d3LmFtZC5jb20KTGlicmUg
c29mdHdhcmUgZW50aHVzaWFzdCAgICAgICAgICAgICB8ICAgICAgICAgICAgIE1lc2EgYW5kIFgg
ZGV2ZWxvcGVyCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
