Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 339838E71E
	for <lists+amd-gfx@lfdr.de>; Thu, 15 Aug 2019 10:41:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A565089CE1;
	Thu, 15 Aug 2019 08:41:36 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1DDC6E8B8;
 Thu, 15 Aug 2019 07:27:14 +0000 (UTC)
Received: from [2001:4bb8:18c:28b5:c70:4a89:bc61:2] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hyAAC-00010m-JV; Thu, 15 Aug 2019 07:27:12 +0000
From: Christoph Hellwig <hch@lst.de>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "David (ChunMing) Zhou" <David1.Zhou@amd.com>
Subject: [PATCH 3/4] drm/radeon: simplify and cleanup setting the dma mask
Date: Thu, 15 Aug 2019 09:27:02 +0200
Message-Id: <20190815072703.7010-4-hch@lst.de>
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
 bh=AwFuGumE9IIrj++t8nZcW7NCG+hmEZXmZtXnY+EyQlc=; b=eSruVy8fiuD0VoyLhPcSRQPk9F
 NIojc0tW9vHqVAu2hAyQE1A57YHqiQawsj8cuciY0huP/QX26VCycXkpIjWYkOzGetJ5IkFrSEs8w
 PSbpbKg6jNHT8+McLYWFjOur3MK4wjQGiXRK3QjevcSHnKXx777te+UNz/freT+jZnnR4lwvLoE8d
 8/cDGXeVnEj/GXT59EwabEChV+XUxvgxFEcMvwaowfJSg/0H/L7kgZDKoPMDr5HB9UTakaokrbvNR
 oHdPQVo3lUkOAeUsUPCs9d2td6xsNS81t4mqlZTHxJ8eaS6RBdSD8c5683r/DVOVmT08NU8Ol77qW
 q1PzIzPw==;
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

VXNlIGRtYV9zZXRfbWFza19hbmRfY29oZXJlbnQgdG8gc2V0IGJvdGggbWFza3MgaW4gb25lIGdv
LCBhbmQgcmVtb3ZlCnRoZSBubyBsb25nZXIgcmVxdWlyZWQgZmFsbGJhY2ssIGFzIHRoZSBrZXJu
ZWwgbm93IGFsd2F5cyBhY2NlcHRzCmxhcmdlciB0aGFuIHJlcXVpcmVkIERNQSBtYXNrcy4gIEZh
aWwgdGhlIGRyaXZlciBwcm9iZSBpZiB3ZSBjYW4ndApzZXQgdGhlIERNQSBtYXNrLCBhcyB0aGF0
IG1lYW5zIHRoZSBzeXN0ZW0gY2FuIG9ubHkgc3VwcG9ydCBhIGxhcmdlcgptYXNrLgoKU2lnbmVk
LW9mZi1ieTogQ2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBsc3QuZGU+Ci0tLQogZHJpdmVycy9ncHUv
ZHJtL3JhZGVvbi9yYWRlb25fZGV2aWNlLmMgfCA5ICsrLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQs
IDIgaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vcmFkZW9uL3JhZGVvbl9kZXZpY2UuYyBiL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFk
ZW9uX2RldmljZS5jCmluZGV4IGI4Y2MwNTgyNjY2Ny4uODhlYjdjYjUyMmJiIDEwMDY0NAotLS0g
YS9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9kZXZpY2UuYworKysgYi9kcml2ZXJzL2dw
dS9kcm0vcmFkZW9uL3JhZGVvbl9kZXZpY2UuYwpAQCAtMTM4MiwxNSArMTM4MiwxMCBAQCBpbnQg
cmFkZW9uX2RldmljZV9pbml0KHN0cnVjdCByYWRlb25fZGV2aWNlICpyZGV2LAogCQlkbWFfYml0
cyA9IDMyOwogI2VuZGlmCiAKLQlyID0gcGNpX3NldF9kbWFfbWFzayhyZGV2LT5wZGV2LCBETUFf
QklUX01BU0soZG1hX2JpdHMpKTsKKwlyID0gZG1hX3NldF9tYXNrX2FuZF9jb2hlcmVudCgmcmRl
di0+cGRldi0+ZGV2LCBETUFfQklUX01BU0soZG1hX2JpdHMpKTsKIAlpZiAocikgewotCQlkbWFf
Yml0cyA9IDMyOwogCQlwcl93YXJuKCJyYWRlb246IE5vIHN1aXRhYmxlIERNQSBhdmFpbGFibGVc
biIpOwotCX0KLQlyID0gcGNpX3NldF9jb25zaXN0ZW50X2RtYV9tYXNrKHJkZXYtPnBkZXYsIERN
QV9CSVRfTUFTSyhkbWFfYml0cykpOwotCWlmIChyKSB7Ci0JCXBjaV9zZXRfY29uc2lzdGVudF9k
bWFfbWFzayhyZGV2LT5wZGV2LCBETUFfQklUX01BU0soMzIpKTsKLQkJcHJfd2FybigicmFkZW9u
OiBObyBjb2hlcmVudCBETUEgYXZhaWxhYmxlXG4iKTsKKwkJcmV0dXJuIHI7CiAJfQogCXJkZXYt
Pm5lZWRfc3dpb3RsYiA9IGRybV9uZWVkX3N3aW90bGIoZG1hX2JpdHMpOwogCi0tIAoyLjIwLjEK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZngg
bWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
