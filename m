Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09DC58E71D
	for <lists+amd-gfx@lfdr.de>; Thu, 15 Aug 2019 10:41:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 079F889CD7;
	Thu, 15 Aug 2019 08:41:36 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7544D6E8B8;
 Thu, 15 Aug 2019 07:27:12 +0000 (UTC)
Received: from [2001:4bb8:18c:28b5:c70:4a89:bc61:2] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hyAAA-00010f-6d; Thu, 15 Aug 2019 07:27:10 +0000
From: Christoph Hellwig <hch@lst.de>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "David (ChunMing) Zhou" <David1.Zhou@amd.com>
Subject: [PATCH 2/4] drm/amdgpu: handle PCIe root ports with addressing
 limitations
Date: Thu, 15 Aug 2019 09:27:01 +0200
Message-Id: <20190815072703.7010-3-hch@lst.de>
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
 bh=HhO4/D/NaNM06KJjZWx26/cJBBtl+T/HbPuQrHkNthA=; b=BeH2wPF+BkgHdS7k0Gkpdes7m5
 PdK1UQndHXyoYXvPjG4BilaU7+yAYLiNWHbvH6JhGutgEBzVm9YCF1tK0B9LYYpKOuyYyLNfe0vLc
 uyE2OvhWnBLb+HOWDtb+BK6EveoXzwq8dh7V0bHdKuR0guDWJ2WdQ7fsr0X1/2iZlbhvurksLz436
 0og0iCFAX8iEU3yj4jOguZzh+GzDBE7VaInj14HfybLqVdDmxionFRDHqj9wAJQN50+H+i8g24BDn
 4jaF72La75LTC36QPH+vYd1QugRnNHBsSGnVG4RXDgFU+p+RLY6H577syjyAuY7/eDql6Z1y3H8Oc
 EYU311lg==;
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

YW1kZ3B1IHVzZXMgYSBuZWVkX2RtYTMyIGZsYWcgdG8gaW5kaWNhdGUgdG8gdGhlIGRybSBjb3Jl
IHRoYXQgc29tZQphbGxvY2F0aW9ucyBuZWVkIHRvIGJlIGRvbmUgdXNpbmcgR0ZQX0RNQTMyLCBi
dXQgaXQgb25seSBjaGVja3MgdGhlCmRldmljZSBhZGRyZXNzaW5nIGNhcGFiaWxpdGllcyB0byBt
YWtlIHRoYXQgZGVjaXNpb24uICBVbmZvcnR1bmF0ZWx5ClBDSWUgcm9vdCBwb3J0cyB0aGF0IGhh
dmUgbGltaXRlZCBhZGRyZXNzaW5nIGV4aXN0IGFzIHdlbGwuICBVc2UgdGhlCmRtYV9hZGRyZXNz
aW5nX2xpbWl0ZWQgaW5zdGVhZCB0byBhbHNvIHRha2UgdGhvc2UgaW50byBhY2NvdW50LgoKU2ln
bmVkLW9mZi1ieTogQ2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBsc3QuZGU+Ci0tLQogZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3R0bS5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEg
aW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYW1kZ3B1X3R0bS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1X3R0bS5jCmluZGV4IGU1MWI0OGFjNDhlYi4uOTFmMTI4YjQzYjZhIDEwMDY0NAotLS0gYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdHRtLmMKKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3R0bS5jCkBAIC0xNzI4LDcgKzE3MjgsNyBAQCBpbnQgYW1k
Z3B1X3R0bV9pbml0KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQogCXIgPSB0dG1fYm9fZGV2
aWNlX2luaXQoJmFkZXYtPm1tYW4uYmRldiwKIAkJCSAgICAgICAmYW1kZ3B1X2JvX2RyaXZlciwK
IAkJCSAgICAgICBhZGV2LT5kZGV2LT5hbm9uX2lub2RlLT5pX21hcHBpbmcsCi0JCQkgICAgICAg
YWRldi0+bmVlZF9kbWEzMik7CisJCQkgICAgICAgZG1hX2FkZHJlc3NpbmdfbGltaXRlZChhZGV2
LT5kZXYpKTsKIAlpZiAocikgewogCQlEUk1fRVJST1IoImZhaWxlZCBpbml0aWFsaXppbmcgYnVm
ZmVyIG9iamVjdCBkcml2ZXIoJWQpLlxuIiwgcik7CiAJCXJldHVybiByOwotLSAKMi4yMC4xCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1h
aWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
