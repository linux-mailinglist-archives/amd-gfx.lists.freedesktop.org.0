Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BEB53502DE
	for <lists+amd-gfx@lfdr.de>; Mon, 24 Jun 2019 09:15:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 462B489A77;
	Mon, 24 Jun 2019 07:15:56 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail2-relais-roc.national.inria.fr
 (mail2-relais-roc.national.inria.fr [192.134.164.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C0A389D53
 for <amd-gfx@lists.freedesktop.org>; Sun, 23 Jun 2019 06:10:24 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.63,407,1557180000"; d="scan'208";a="388655915"
Received: from abo-12-105-68.mrs.modulonet.fr (HELO hadrien) ([85.68.105.12])
 by mail2-relais-roc.national.inria.fr with
 ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 23 Jun 2019 08:10:21 +0200
Date: Sun, 23 Jun 2019 08:10:21 +0200 (CEST)
From: Julia Lawall <julia.lawall@lip6.fr>
X-X-Sender: jll@hadrien
To: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH -next] drm/amdgpu: remove set but not used variables 'ret'
In-Reply-To: <20190623060027.GU28859@kadam>
Message-ID: <alpine.DEB.2.21.1906230809400.4961@hadrien>
References: <20190622030314.169640-1-maowenan@huawei.com>
 <20190622104318.GT28859@kadam> <20190623060027.GU28859@kadam>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
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
Cc: David1.Zhou@amd.com, airlied@linux.ie, kernel-janitors@vger.kernel.org,
 Mao Wenan <maowenan@huawei.com>, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, daniel@ffwll.ch, alexander.deucher@amd.com,
 christian.koenig@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

CgpPbiBTdW4sIDIzIEp1biAyMDE5LCBEYW4gQ2FycGVudGVyIHdyb3RlOgoKPiBPbiBTYXQsIEp1
biAyMiwgMjAxOSBhdCAwMTo0MzoxOVBNICswMzAwLCBEYW4gQ2FycGVudGVyIHdyb3RlOgo+ID4g
T24gU2F0LCBKdW4gMjIsIDIwMTkgYXQgMTE6MDM6MTRBTSArMDgwMCwgTWFvIFdlbmFuIHdyb3Rl
Ogo+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Bt
dS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3BtdS5jCj4gPiA+IGluZGV4
IDBlNmRiYTkuLjBiZjRkZDkgMTAwNjQ0Cj4gPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV9wbXUuYwo+ID4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfcG11LmMKPiA+ID4gQEAgLTI0NiwxMiArMjQ2LDEwIEBAIHN0YXRpYyBpbnQgaW5p
dF9wbXVfYnlfdHlwZShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwKPiA+ID4gIC8qIGluaXQg
YW1kZ3B1X3BtdSAqLwo+ID4gPiAgaW50IGFtZGdwdV9wbXVfaW5pdChzdHJ1Y3QgYW1kZ3B1X2Rl
dmljZSAqYWRldikKPiA+ID4gIHsKPiA+ID4gLQlpbnQgcmV0ID0gMDsKPiA+ID4gLQo+ID4gPiAg
CXN3aXRjaCAoYWRldi0+YXNpY190eXBlKSB7Cj4gPiA+ICAJY2FzZSBDSElQX1ZFR0EyMDoKPiA+
ID4gIAkJLyogaW5pdCBkZiAqLwo+ID4gPiAtCQlyZXQgPSBpbml0X3BtdV9ieV90eXBlKGFkZXYs
IGRmX3YzXzZfYXR0cl9ncm91cHMsCj4gPiA+ICsJCWluaXRfcG11X2J5X3R5cGUoYWRldiwgZGZf
djNfNl9hdHRyX2dyb3VwcywKPiA+ID4gIAkJCQkgICAgICAgIkRGIiwgImFtZGdwdV9kZiIsIFBF
UkZfVFlQRV9BTURHUFVfREYsCj4gPiA+ICAJCQkJICAgICAgIERGX1YzXzZfTUFYX0NPVU5URVJT
KTsKPiA+Cj4gPgo+ID4gWW91J3JlIHJlc2VuZGluZyB0aGlzIGZvciBvdGhlciByZWFzb25zLCBi
dXQgZG9uJ3QgZm9yZ2V0IHRvIHVwZGF0ZSB0aGUKPiA+IGluZGVudGluZyBvbiB0aGUgYXJndW1l
bnRzIHNvIHRoZXkgc3RpbGwgbGluZSB1cCB3aXRoIHRoZSAnKCcuCj4gPgo+Cj4gU29ycnksIEkg
d2FzIHVuY2xlYXIuICBJZiB5b3UgcHVsbCB0aGUgaW5pdF9wbXVfYnlfdHlwZSggYmFjayA2Cj4g
Y2hhcmFjdGVycyB0aGVuIHlvdSBhbHNvIG5lZWQgdG8gcHVsbCB0aGUgIkRGIiBiYWNrIDYgY2hh
cmFjdGVycy4KPgo+IAkJaW5pdF9wbXVfYnlfdHlwZShhZGV2LCBkZl92M182X2F0dHJfZ3JvdXBz
LCAiREYiLCAiYW1kZ3B1X2RmIiwKPiAJCQkJIFBFUkZfVFlQRV9BTURHUFVfREYsIERGX1YzXzZf
TUFYX0NPVU5URVJTKTsKPgo+IFlvdSBjYW4gYWN0dWFsbHkgZml0IGl0IGludG8gdHdvIGxpbmVz
IGFmdGVyd2FyZHMuCgpNeSBzdWdnZXN0aW9uIHdhcyB0byBrZWVwIHRoZSByZXQgPSBpbnN0ZWFk
IG9mIGRpc2NhcmRpbmcgdGhlIGluZGljYXRpb24Kb2YgZmFpbHVyZSwgc28gSSB0aGluayB0aGF0
IHRoaXMgaXMgbm90IHJlbGV2YW50LgoKanVsaWEKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9hbWQtZ2Z4
