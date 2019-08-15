Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D03318E71C
	for <lists+amd-gfx@lfdr.de>; Thu, 15 Aug 2019 10:41:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA1A689CD4;
	Thu, 15 Aug 2019 08:41:35 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D34586E8B7;
 Thu, 15 Aug 2019 07:27:09 +0000 (UTC)
Received: from [2001:4bb8:18c:28b5:c70:4a89:bc61:2] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hyAA7-00010W-QW; Thu, 15 Aug 2019 07:27:08 +0000
From: Christoph Hellwig <hch@lst.de>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "David (ChunMing) Zhou" <David1.Zhou@amd.com>
Subject: [PATCH 1/4] drm/radeon: handle PCIe root ports with addressing
 limitations
Date: Thu, 15 Aug 2019 09:27:00 +0200
Message-Id: <20190815072703.7010-2-hch@lst.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190815072703.7010-1-hch@lst.de>
References: <20190815072703.7010-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Mailman-Approved-At: Thu, 15 Aug 2019 08:41:35 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From
 :Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=HRWpQtxV9xoLsNARYHwlXoqVEaFSd37kaecfauBfEU0=; b=jlCfV3DAoNyJiudaXiXwAUKMly
 j7oiBQwtZN2yD1e0yVSPiun4mvCtKPVz2U4aAnCFnbv6I8k7pVCr1yspmRzeZdmS+80Zdt5qKmlm1
 kvdH3whXNwr6FjKKsDlEeRx14ap1rOX5pYJFIPG1Zbga+u8p6wiJWOPHhTYl/JliGFCjSBmH/0Dgn
 ztES0EnH1TzKyL7CTEt6oBN75ZT8xSQ+///ozIGscnYMks/2Qf35TzqFhKrvIMF8mO4t4GDl4XOoY
 LNlXugpa7FlPZdDN7PletDQNyBJcArf4cjnmMNbbnEWpaJaIYzv1pT2nta0iQxpR37knQVsACilX3
 SQxclZYw==;
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
Cc: Atish Patra <Atish.Patra@wdc.com>,
 Alistair Francis <alistair.francis@wdc.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

cmFkZW9uIHVzZXMgYSBuZWVkX2RtYTMyIGZsYWcgdG8gaW5kaWNhdGUgdG8gdGhlIGRybSBjb3Jl
IHRoYXQgc29tZQphbGxvY2F0aW9ucyBuZWVkIHRvIGJlIGRvbmUgdXNpbmcgR0ZQX0RNQTMyLCBi
dXQgaXQgb25seSBjaGVja3MgdGhlCmRldmljZSBhZGRyZXNzaW5nIGNhcGFiaWxpdGllcyB0byBt
YWtlIHRoYXQgZGVjaXNpb24uICBVbmZvcnR1bmF0ZWx5ClBDSWUgcm9vdCBwb3J0cyB0aGF0IGhh
dmUgbGltaXRlZCBhZGRyZXNzaW5nIGV4aXN0IGFzIHdlbGwuICBVc2UgdGhlCmRtYV9hZGRyZXNz
aW5nX2xpbWl0ZWQgaW5zdGVhZCB0byBhbHNvIHRha2UgdGhvc2UgaW50byBhY2NvdW50LgoKUmVw
b3J0ZWQtYnk6IEF0aXNoIFBhdHJhIDxBdGlzaC5QYXRyYUB3ZGMuY29tPgpTaWduZWQtb2ZmLWJ5
OiBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGxzdC5kZT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vcmFk
ZW9uL3JhZGVvbi5oICAgICAgICB8ICAxIC0KIGRyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9u
X2RldmljZS5jIHwgMTIgKysrKystLS0tLS0tCiBkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVv
bl90dG0uYyAgICB8ICAyICstCiAzIGZpbGVzIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgOSBk
ZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbi5o
IGIvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb24uaAppbmRleCAzMjgwOGU1MGJlMTIuLjFh
MGIyMjUyNmE3NSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb24uaAor
KysgYi9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbi5oCkBAIC0yMzg3LDcgKzIzODcsNiBA
QCBzdHJ1Y3QgcmFkZW9uX2RldmljZSB7CiAJc3RydWN0IHJhZGVvbl93YgkJd2I7CiAJc3RydWN0
IHJhZGVvbl9kdW1teV9wYWdlCWR1bW15X3BhZ2U7CiAJYm9vbAkJCQlzaHV0ZG93bjsKLQlib29s
CQkJCW5lZWRfZG1hMzI7CiAJYm9vbAkJCQluZWVkX3N3aW90bGI7CiAJYm9vbAkJCQlhY2NlbF93
b3JraW5nOwogCWJvb2wJCQkJZmFzdGZiX3dvcmtpbmc7IC8qIElHUCBmZWF0dXJlKi8KZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX2RldmljZS5jIGIvZHJpdmVycy9n
cHUvZHJtL3JhZGVvbi9yYWRlb25fZGV2aWNlLmMKaW5kZXggZGNlYjU1NGU1Njc0Li5iOGNjMDU4
MjY2NjcgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX2RldmljZS5j
CisrKyBiL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX2RldmljZS5jCkBAIC0xMzY1LDI3
ICsxMzY1LDI1IEBAIGludCByYWRlb25fZGV2aWNlX2luaXQoc3RydWN0IHJhZGVvbl9kZXZpY2Ug
KnJkZXYsCiAJZWxzZQogCQlyZGV2LT5tYy5tY19tYXNrID0gMHhmZmZmZmZmZlVMTDsgLyogMzIg
Yml0IE1DICovCiAKLQkvKiBzZXQgRE1BIG1hc2sgKyBuZWVkX2RtYTMyIGZsYWdzLgorCS8qIHNl
dCBETUEgbWFzay4KIAkgKiBQQ0lFIC0gY2FuIGhhbmRsZSA0MC1iaXRzLgogCSAqIElHUCAtIGNh
biBoYW5kbGUgNDAtYml0cwogCSAqIEFHUCAtIGdlbmVyYWxseSBkbWEzMiBpcyBzYWZlc3QKIAkg
KiBQQ0kgLSBkbWEzMiBmb3IgbGVnYWN5IHBjaSBnYXJ0LCA0MCBiaXRzIG9uIG5ld2VyIGFzaWNz
CiAJICovCi0JcmRldi0+bmVlZF9kbWEzMiA9IGZhbHNlOworCWRtYV9iaXRzID0gNDA7CiAJaWYg
KHJkZXYtPmZsYWdzICYgUkFERU9OX0lTX0FHUCkKLQkJcmRldi0+bmVlZF9kbWEzMiA9IHRydWU7
CisJCWRtYV9iaXRzID0gMzI7CiAJaWYgKChyZGV2LT5mbGFncyAmIFJBREVPTl9JU19QQ0kpICYm
CiAJICAgIChyZGV2LT5mYW1pbHkgPD0gQ0hJUF9SUzc0MCkpCi0JCXJkZXYtPm5lZWRfZG1hMzIg
PSB0cnVlOworCQlkbWFfYml0cyA9IDMyOwogI2lmZGVmIENPTkZJR19QUEM2NAogCWlmIChyZGV2
LT5mYW1pbHkgPT0gQ0hJUF9DRURBUikKLQkJcmRldi0+bmVlZF9kbWEzMiA9IHRydWU7CisJCWRt
YV9iaXRzID0gMzI7CiAjZW5kaWYKIAotCWRtYV9iaXRzID0gcmRldi0+bmVlZF9kbWEzMiA/IDMy
IDogNDA7CiAJciA9IHBjaV9zZXRfZG1hX21hc2socmRldi0+cGRldiwgRE1BX0JJVF9NQVNLKGRt
YV9iaXRzKSk7CiAJaWYgKHIpIHsKLQkJcmRldi0+bmVlZF9kbWEzMiA9IHRydWU7CiAJCWRtYV9i
aXRzID0gMzI7CiAJCXByX3dhcm4oInJhZGVvbjogTm8gc3VpdGFibGUgRE1BIGF2YWlsYWJsZVxu
Iik7CiAJfQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fdHRtLmMg
Yi9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl90dG0uYwppbmRleCBmYjM2OTZiYzYxNmQu
LjExNmEyN2IyNWRjNCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25f
dHRtLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fdHRtLmMKQEAgLTc5NCw3
ICs3OTQsNyBAQCBpbnQgcmFkZW9uX3R0bV9pbml0KHN0cnVjdCByYWRlb25fZGV2aWNlICpyZGV2
KQogCXIgPSB0dG1fYm9fZGV2aWNlX2luaXQoJnJkZXYtPm1tYW4uYmRldiwKIAkJCSAgICAgICAm
cmFkZW9uX2JvX2RyaXZlciwKIAkJCSAgICAgICByZGV2LT5kZGV2LT5hbm9uX2lub2RlLT5pX21h
cHBpbmcsCi0JCQkgICAgICAgcmRldi0+bmVlZF9kbWEzMik7CisJCQkgICAgICAgZG1hX2FkZHJl
c3NpbmdfbGltaXRlZCgmcmRldi0+cGRldi0+ZGV2KSk7CiAJaWYgKHIpIHsKIAkJRFJNX0VSUk9S
KCJmYWlsZWQgaW5pdGlhbGl6aW5nIGJ1ZmZlciBvYmplY3QgZHJpdmVyKCVkKS5cbiIsIHIpOwog
CQlyZXR1cm4gcjsKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9h
bWQtZ2Z4
