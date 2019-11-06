Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DA00CF19E0
	for <lists+amd-gfx@lfdr.de>; Wed,  6 Nov 2019 16:21:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3996B6EDA2;
	Wed,  6 Nov 2019 15:21:36 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
X-Greylist: delayed 935 seconds by postgrey-1.36 at gabe;
 Wed, 06 Nov 2019 09:30:31 UTC
Received: from mail-m972.mail.163.com (mail-m972.mail.163.com [123.126.97.2])
 by gabe.freedesktop.org (Postfix) with ESMTP id ED20A6EC75;
 Wed,  6 Nov 2019 09:30:31 +0000 (UTC)
Received: from localhost.localdomain (unknown [202.112.113.212])
 by smtp2 (Coremail) with SMTP id GtxpCgCXOxEGj8Jd3sZmBA--.31S3;
 Wed, 06 Nov 2019 17:14:48 +0800 (CST)
From: Pan Bian <bianpan2016@163.com>
To: Alex Deucher <alexander.deucher@amd.com>, christian.koenig@amd.com,
 "David (ChunMing) Zhou" <David1.Zhou@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH] drm/amdgpu: fix potential double drop fence reference
Date: Wed,  6 Nov 2019 17:14:45 +0800
Message-Id: <1573031685-25969-1-git-send-email-bianpan2016@163.com>
X-Mailer: git-send-email 2.7.4
X-CM-TRANSID: GtxpCgCXOxEGj8Jd3sZmBA--.31S3
X-Coremail-Antispam: 1Uf129KBjvdXoW7JFWfKF1xur1kCrW8Zr47urg_yoWDCwb_uF
 WUXFn3Cw13CFn0gF17Zr45Za9rt345Za1kWr1ft39YyryUZ3yjq34Uurn5Xa18uayxWasr
 X3WqgFyYkwnrCjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUjXdb7UUUUU==
X-Originating-IP: [202.112.113.212]
X-CM-SenderInfo: held01tdqsiiqw6rljoofrz/1tbiQAhlclSIdIDGYwAAsS
X-Mailman-Approved-At: Wed, 06 Nov 2019 15:21:34 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=163.com; 
 s=s110527; h=From:Subject:Date:Message-Id; bh=sVdTflIE+iXOvcN6Wo
 Co4qaadEnEkJvxlkUvIsF0664=; b=LuKoXVvYBTHDB35390tz/PmzS63L14Czxp
 YffOwccsl12O3nTXjjBNyxg1uUOghBPiyU4jOs/3x/3/eAfI/4nsDVEg8E85ko55
 Uxigc19ZUFHZy0yBILc9qstlxkVmXQTLDCnia55Ax4zKX4UO8m0mFrWuqim1tRWe
 zxuTErRKQ=
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
Cc: Pan Bian <bianpan2016@163.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VGhlIG9iamVjdCBmZW5jZSBpcyBub3Qgc2V0IHRvIE5VTEwgYWZ0ZXIgaXRzIHJlZmVyZW5jZSBp
cyBkcm9wcGVkLiBBcyBhCnJlc3VsdCwgaXRzIHJlZmVyZW5jZSBtYXkgYmUgZHJvcHBlZCBhZ2Fp
biBpZiBlcnJvciBvY2N1cnMgYWZ0ZXIgdGhhdCwKd2hpY2ggbWF5IGxlYWQgdG8gYSB1c2UgYWZ0
ZXIgZnJlZSBidWcuIFRvIGF2b2lkIHRoZSBpc3N1ZSwgZmVuY2UgaXMKZXhwbGljaXRseSBzZXQg
dG8gTlVMTCBhZnRlciBkcm9wcGluZyBpdHMgcmVmZXJlbmNlLgoKU2lnbmVkLW9mZi1ieTogUGFu
IEJpYW4gPGJpYW5wYW4yMDE2QDE2My5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X3Rlc3QuYyB8IDIgKysKIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykK
CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdGVzdC5jIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Rlc3QuYwppbmRleCBiNjZkMjlkNWZm
YTIuLmIxNTgyMzBhZjhkYiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1X3Rlc3QuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdGVz
dC5jCkBAIC0xMzgsNiArMTM4LDcgQEAgc3RhdGljIHZvaWQgYW1kZ3B1X2RvX3Rlc3RfbW92ZXMo
c3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCiAJCX0KIAogCQlkbWFfZmVuY2VfcHV0KGZlbmNl
KTsKKwkJZmVuY2UgPSBOVUxMOwogCiAJCXIgPSBhbWRncHVfYm9fa21hcCh2cmFtX29iaiwgJnZy
YW1fbWFwKTsKIAkJaWYgKHIpIHsKQEAgLTE4Myw2ICsxODQsNyBAQCBzdGF0aWMgdm9pZCBhbWRn
cHVfZG9fdGVzdF9tb3ZlcyhzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKIAkJfQogCiAJCWRt
YV9mZW5jZV9wdXQoZmVuY2UpOworCQlmZW5jZSA9IE5VTEw7CiAKIAkJciA9IGFtZGdwdV9ib19r
bWFwKGd0dF9vYmpbaV0sICZndHRfbWFwKTsKIAkJaWYgKHIpIHsKLS0gCjIuNy40CgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcg
bGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
