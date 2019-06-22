Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C67A4F9A8
	for <lists+amd-gfx@lfdr.de>; Sun, 23 Jun 2019 05:40:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F9A789D42;
	Sun, 23 Jun 2019 03:40:23 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
X-Greylist: delayed 561 seconds by postgrey-1.36 at gabe;
 Sat, 22 Jun 2019 18:22:52 UTC
Received: from smtprelay.hostedemail.com (smtprelay0184.hostedemail.com
 [216.40.44.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88FE46E8E8
 for <amd-gfx@lists.freedesktop.org>; Sat, 22 Jun 2019 18:22:52 +0000 (UTC)
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com
 [10.5.19.251])
 by smtpgrave03.hostedemail.com (Postfix) with ESMTP id EC7001801DBE9
 for <amd-gfx@lists.freedesktop.org>; Sat, 22 Jun 2019 18:13:31 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay07.hostedemail.com (Postfix) with ESMTP id 90855181D33FC;
 Sat, 22 Jun 2019 18:13:29 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2, 0, 0, , d41d8cd98f00b204, joe@perches.com,
 :::::::::::::::::::::::,
 RULES_HIT:41:152:355:379:599:988:989:1260:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1541:1593:1594:1711:1730:1747:1777:1792:2198:2199:2393:2559:2562:3138:3139:3140:3141:3142:3352:3622:3865:3866:3867:3868:3870:3871:3872:3873:4321:4605:5007:7903:10004:10400:10848:11026:11232:11233:11473:11657:11658:11914:12043:12048:12296:12297:12438:12679:12740:12895:13069:13161:13229:13311:13357:13894:14659:14721:21063:21080:21451:21627:30012:30054:30070:30091,
 0,
 RBL:23.242.196.136:@perches.com:.lbl8.mailshell.net-62.8.0.180 64.201.201.201,
 CacheIP:none, Bayesian:0.5, 0.5, 0.5, Netcheck:none, DomainCache:0,
 MSF:not bulk, SPF:fn, MSBL:0, DNSBL:neutral, Custom_rules:0:0:0, LFtime:24,
 LUA_SUMMARY:none
X-HE-Tag: guide54_1e3a390309d01
X-Filterd-Recvd-Size: 2148
Received: from XPS-9350.home (cpe-23-242-196-136.socal.res.rr.com
 [23.242.196.136]) (Authenticated sender: joe@perches.com)
 by omf08.hostedemail.com (Postfix) with ESMTPA;
 Sat, 22 Jun 2019 18:13:27 +0000 (UTC)
Message-ID: <0ab82cdb0bec30e7e431f106f8e0e9d141491555.camel@perches.com>
Subject: Re: [PATCH -next v2] drm/amdgpu: return 'ret' in amdgpu_pmu_init
From: Joe Perches <joe@perches.com>
To: Mao Wenan <maowenan@huawei.com>, airlied@linux.ie, daniel@ffwll.ch, 
 alexander.deucher@amd.com, christian.koenig@amd.com, David1.Zhou@amd.com, 
 dan.carpenter@oracle.com, julia.lawall@lip6.fr
Date: Sat, 22 Jun 2019 11:13:26 -0700
In-Reply-To: <20190622130527.182022-1-maowenan@huawei.com>
References: <20190622104318.GT28859@kadam>
 <20190622130527.182022-1-maowenan@huawei.com>
User-Agent: Evolution 3.30.5-0ubuntu0.18.10.1 
MIME-Version: 1.0
X-Mailman-Approved-At: Sun, 23 Jun 2019 03:40:21 +0000
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

T24gU2F0LCAyMDE5LTA2LTIyIGF0IDIxOjA1ICswODAwLCBNYW8gV2VuYW4gd3JvdGU6Cj4gVGhl
cmUgaXMgb25lIHdhcm5pbmc6Cj4gZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Bt
dS5jOiBJbiBmdW5jdGlvbiDigJhhbWRncHVfcG11X2luaXTigJk6Cj4gZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYW1kZ3B1X3BtdS5jOjI0OTo2OiB3YXJuaW5nOiB2YXJpYWJsZSDigJhyZXTi
gJkgc2V0IGJ1dCBub3QgdXNlZCBbLVd1bnVzZWQtYnV0LXNldC12YXJpYWJsZV0KPiAgIGludCBy
ZXQgPSAwOwpbXQo+ICB2MS0+djI6IGNoYW5nZSB0aGUgc3ViamVjdCBmb3IgdGhpcyBwYXRjaDsg
Y2hhbmdlIHRoZSBpbmRlbnRpbmcgd2hlbiBpdCBjYWxscyBpbml0X3BtdV9ieV90eXBlOyB1c2Ug
dGhlIHZhbHVlICdyZXQnIGluCj4gIGFtZGdwdV9wbXVfaW5pdCgpLgpbXQo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcG11LmMgYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfcG11LmMKW10KPiBAQCAtMjUyLDggKzI1Miw4IEBAIGludCBh
bWRncHVfcG11X2luaXQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCj4gIAljYXNlIENISVBf
VkVHQTIwOgo+ICAJCS8qIGluaXQgZGYgKi8KPiAgCQlyZXQgPSBpbml0X3BtdV9ieV90eXBlKGFk
ZXYsIGRmX3YzXzZfYXR0cl9ncm91cHMsCj4gLQkJCQkgICAgICAgIkRGIiwgImFtZGdwdV9kZiIs
IFBFUkZfVFlQRV9BTURHUFVfREYsCj4gLQkJCQkgICAgICAgREZfVjNfNl9NQVhfQ09VTlRFUlMp
Owo+ICsJCQkJCQkJICAgIkRGIiwgImFtZGdwdV9kZiIsIFBFUkZfVFlQRV9BTURHUFVfREYsCj4g
KwkJCQkJCQkgICBERl9WM182X01BWF9DT1VOVEVSUyk7Cgp0cml2aWE6CgpUaGUgaW5kZW50YXRp
b24gY2hhbmdlIHNlZW1zIHN1cGVyZmx1b3VzIGFuZAphcHBlYXJzIHRvIG1ha2UgdGhlIGNvZGUg
aGFyZGVyIHRvIHJlYWQuCgpZb3UgY291bGQgYWxzbyBjYyBKb25hdGhhbiBLaW0gd2hvIHdyb3Rl
IGFsbCBvZiB0aGlzLgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
