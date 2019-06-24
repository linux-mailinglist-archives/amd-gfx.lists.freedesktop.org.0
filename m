Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A4CA502DB
	for <lists+amd-gfx@lfdr.de>; Mon, 24 Jun 2019 09:15:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA41C89A86;
	Mon, 24 Jun 2019 07:15:51 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from smtprelay.hostedemail.com (smtprelay0088.hostedemail.com
 [216.40.44.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF9BA898BF
 for <amd-gfx@lists.freedesktop.org>; Mon, 24 Jun 2019 03:47:00 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay03.hostedemail.com (Postfix) with ESMTP id E5BE8837F24C;
 Mon, 24 Jun 2019 03:46:58 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2, 0, 0, , d41d8cd98f00b204, joe@perches.com,
 :::::::::::::::::::::::,
 RULES_HIT:41:152:355:379:599:988:989:1260:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1541:1593:1594:1711:1730:1747:1777:1792:2198:2199:2393:2559:2562:3138:3139:3140:3141:3142:3353:3622:3865:3866:3867:3868:3870:3871:3872:3873:3874:4321:4605:4823:5007:6119:7903:8784:10004:10400:10848:11026:11232:11233:11473:11657:11658:11914:12043:12048:12296:12297:12438:12740:12895:13069:13311:13357:13894:14096:14097:14659:14721:14777:21063:21080:21451:21627:30012:30026:30054:30070:30091,
 0,
 RBL:23.242.70.174:@perches.com:.lbl8.mailshell.net-62.8.0.180 64.201.201.201,
 CacheIP:none, Bayesian:0.5, 0.5, 0.5, Netcheck:none, DomainCache:0,
 MSF:not bulk, SPF:fn, MSBL:0, DNSBL:neutral, Custom_rules:0:0:0, LFtime:28,
 LUA_SUMMARY:none
X-HE-Tag: dust72_279b0f5cc505
X-Filterd-Recvd-Size: 3038
Received: from XPS-9350 (cpe-23-242-70-174.socal.res.rr.com [23.242.70.174])
 (Authenticated sender: joe@perches.com)
 by omf19.hostedemail.com (Postfix) with ESMTPA;
 Mon, 24 Jun 2019 03:46:56 +0000 (UTC)
Message-ID: <f7af76e8237f490f75d9f2624127e01c55476d2f.camel@perches.com>
Subject: Re: [PATCH -next v2] drm/amdgpu: return 'ret' in amdgpu_pmu_init
From: Joe Perches <joe@perches.com>
To: maowenan <maowenan@huawei.com>, airlied@linux.ie, daniel@ffwll.ch, 
 alexander.deucher@amd.com, christian.koenig@amd.com, David1.Zhou@amd.com, 
 dan.carpenter@oracle.com, julia.lawall@lip6.fr
Date: Sun, 23 Jun 2019 20:46:55 -0700
In-Reply-To: <b468d765-bef7-70a8-9a14-bad0e6ed14df@huawei.com>
References: <20190622104318.GT28859@kadam>
 <20190622130527.182022-1-maowenan@huawei.com>
 <0ab82cdb0bec30e7e431f106f8e0e9d141491555.camel@perches.com>
 <b468d765-bef7-70a8-9a14-bad0e6ed14df@huawei.com>
User-Agent: Evolution 3.30.5-0ubuntu0.18.10.1 
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 24 Jun 2019 07:15:51 +0000
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
Cc: Jonathan Kim <jonathan.kim@amd.com>, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gTW9uLCAyMDE5LTA2LTI0IGF0IDExOjQxICswODAwLCBtYW93ZW5hbiB3cm90ZToKPiAKPiBP
biAyMDE5LzYvMjMgMjoxMywgSm9lIFBlcmNoZXMgd3JvdGU6Cj4gPiBPbiBTYXQsIDIwMTktMDYt
MjIgYXQgMjE6MDUgKzA4MDAsIE1hbyBXZW5hbiB3cm90ZToKPiA+ID4gVGhlcmUgaXMgb25lIHdh
cm5pbmc6Cj4gPiA+IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9wbXUuYzogSW4g
ZnVuY3Rpb24g4oCYYW1kZ3B1X3BtdV9pbml04oCZOgo+ID4gPiBkcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHVfcG11LmM6MjQ5OjY6IHdhcm5pbmc6IHZhcmlhYmxlIOKAmHJldOKAmSBz
ZXQgYnV0IG5vdCB1c2VkIFstV3VudXNlZC1idXQtc2V0LXZhcmlhYmxlXQo+ID4gPiAgIGludCBy
ZXQgPSAwOwo+ID4gW10KPiA+ID4gIHYxLT52MjogY2hhbmdlIHRoZSBzdWJqZWN0IGZvciB0aGlz
IHBhdGNoOyBjaGFuZ2UgdGhlIGluZGVudGluZyB3aGVuIGl0IGNhbGxzIGluaXRfcG11X2J5X3R5
cGU7IHVzZSB0aGUgdmFsdWUgJ3JldCcgaW4KPiA+ID4gIGFtZGdwdV9wbXVfaW5pdCgpLgo+ID4g
W10KPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9w
bXUuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9wbXUuYwo+ID4gW10KPiA+
ID4gQEAgLTI1Miw4ICsyNTIsOCBAQCBpbnQgYW1kZ3B1X3BtdV9pbml0KHN0cnVjdCBhbWRncHVf
ZGV2aWNlICphZGV2KQo+ID4gPiAgCWNhc2UgQ0hJUF9WRUdBMjA6Cj4gPiA+ICAJCS8qIGluaXQg
ZGYgKi8KPiA+ID4gIAkJcmV0ID0gaW5pdF9wbXVfYnlfdHlwZShhZGV2LCBkZl92M182X2F0dHJf
Z3JvdXBzLAo+ID4gPiAtCQkJCSAgICAgICAiREYiLCAiYW1kZ3B1X2RmIiwgUEVSRl9UWVBFX0FN
REdQVV9ERiwKPiA+ID4gLQkJCQkgICAgICAgREZfVjNfNl9NQVhfQ09VTlRFUlMpOwo+ID4gPiAr
CQkJCQkJCSAgICJERiIsICJhbWRncHVfZGYiLCBQRVJGX1RZUEVfQU1ER1BVX0RGLAo+ID4gPiAr
CQkJCQkJCSAgIERGX1YzXzZfTUFYX0NPVU5URVJTKTsKPiA+IAo+ID4gdHJpdmlhOgo+ID4gCj4g
PiBUaGUgaW5kZW50YXRpb24gY2hhbmdlIHNlZW1zIHN1cGVyZmx1b3VzIGFuZAo+ID4gYXBwZWFy
cyB0byBtYWtlIHRoZSBjb2RlIGhhcmRlciB0byByZWFkLgo+ID4gCj4gPiBZb3UgY291bGQgYWxz
byBjYyBKb25hdGhhbiBLaW0gd2hvIHdyb3RlIGFsbCBvZiB0aGlzLgo+IEkgdGhpbmsgdGhpcyBp
cyBqdXN0IGRpc3BsYXkgaXNzdWUgaW4gbWFpbCBmb3JtYXQuIEl0IGlzIGNvcnJlY3QgdGhhdCBp
biB2aS92aW0uCj4gVGhlIGFyZ3VtZW50cyBhcmUgbGluZSB1cCB3aXRoICcoJyBhZnRlciBteSBj
aGFuZ2UuCgpVc2UgOCBjaGFyYWN0ZXIgdGFicyBhbmQgdHJ5IGFnYWluIHBsZWFzZS4KCj4gQEAg
LTI1Miw4ICsyNTIsOCBAQCBpbnQgYW1kZ3B1X3BtdV9pbml0KHN0cnVjdCBhbWRncHVfZGV2aWNl
ICphZGV2KSQKPiAgXkljYXNlIENISVBfVkVHQTIwOiQKPiAgXkleSS8qIGluaXQgZGYgKi8kCj4g
IF5JXklyZXQgPSBpbml0X3BtdV9ieV90eXBlKGFkZXYsIGRmX3YzXzZfYXR0cl9ncm91cHMsJAo+
IC1eSV5JXkleSSAgICAgICAiREYiLCAiYW1kZ3B1X2RmIiwgUEVSRl9UWVBFX0FNREdQVV9ERiwk
Cj4gLV5JXkleSV5JICAgICAgIERGX1YzXzZfTUFYX0NPVU5URVJTKTskCj4gK15JXkleSV5JXkle
SV5JICAgIkRGIiwgImFtZGdwdV9kZiIsIFBFUkZfVFlQRV9BTURHUFVfREYsJAo+ICteSV5JXkle
SV5JXkleSSAgIERGX1YzXzZfTUFYX0NPVU5URVJTKTskCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9hbWQtZ2Z4
