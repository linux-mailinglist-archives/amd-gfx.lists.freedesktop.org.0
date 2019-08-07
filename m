Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2EC884F5A
	for <lists+amd-gfx@lfdr.de>; Wed,  7 Aug 2019 17:01:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7F086E68C;
	Wed,  7 Aug 2019 15:01:35 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B16F6E68C
 for <amd-gfx@lists.freedesktop.org>; Wed,  7 Aug 2019 15:01:34 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id h21so88578565qtn.13
 for <amd-gfx@lists.freedesktop.org>; Wed, 07 Aug 2019 08:01:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=60pbqVISAcOtkKC0tVcnsZFNEa5D8tleUKvchKheiLc=;
 b=oXWt6G0O9sM8Tg8r8wFVMiUwxdh4hfXzGOOFynmYNWC91yG3xEfxsmhtsJcqj8Dla+
 c6UIgiS1rLiGBP7HC/smFEwoAweUDY0OnzbJ0VwlWGymaVT7WfZLEbgo65gp4CSLJB82
 Qz0yjy3sO74j01pdKiulB6oYUP66e833fLfc38WDqcYjYeggjRonHk1FUJ+dVgHjEi/a
 XTG67D+eGHOCc2KpfwjYPCmk24eqdnANRSOW18UZZay0E6cDQidiN21XwpEiNPa9p0hu
 soU5r2+G1chdy4DvGVLp8C64Vl6a5NcEKUyQyBY05P00NuaSl2woT3+lKMYi/QTTRk9a
 gWqg==
X-Gm-Message-State: APjAAAX06V4PDhA+vBJU684zfTHBEh2Vdn4z8zJDvALcizu7S1BN8j2t
 H5gz4b5sfI+r1lO7tpjVYdQ7hA55fqs=
X-Google-Smtp-Source: APXvYqzr4JJ3tw1L0MuBGGgl2ASMk4B0LeHQMhjfI+kzpfhKU2wFBy8cdPNAga23Sm2AUcMYru7PFA==
X-Received: by 2002:ac8:1183:: with SMTP id d3mr8436935qtj.53.1565190093003;
 Wed, 07 Aug 2019 08:01:33 -0700 (PDT)
Received: from localhost.localdomain ([71.51.170.6])
 by smtp.gmail.com with ESMTPSA id p13sm33723247qkj.4.2019.08.07.08.01.31
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 07 Aug 2019 08:01:32 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH] Revert "drm/amdkfd: New IOCTL to allocate queue GWS"
Date: Wed,  7 Aug 2019 10:01:24 -0500
Message-Id: <20190807150124.13978-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=60pbqVISAcOtkKC0tVcnsZFNEa5D8tleUKvchKheiLc=;
 b=inMl04Wjkjijohl4ZLXn7R27HgFjN65IU9rvoA39RgiqahFllu6D4uiK31rXee0HEy
 vlSRAW0t/HqMCgsuImY2DYiKNJVIofUhYWQcunqCBoXTQbaUNAc76E3QMXNKxLvXCz07
 /igR+rPVrStUpBlOM/H+IVB4Fl/kLaAxXDJGHkXSPSi69PHncA/bxYFT/GjrNTwW9+AT
 kI/y6AsfTwliUaXf/AzdBm0iOWvkro82nXjJITCrvZ0Bn1fMSv8IeP3MTOBc0eq+ELZz
 lIKFfU8lQC1PJh8kuQTfk0PlwO9JaoJCv6SdGnEMTki4ewjk70uqfjoJl7Mtmi7XVKhW
 i4kw==
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
Cc: Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VGhpcyByZXZlcnRzIGNvbW1pdCAxYTA1OGMzMzc2NzY1ZWUzMWQ2NWUyOGNiYmI5ZDRmZjE1MTIw
MDU2LgoKVGhpcyBpbnRlcmZhY2UgaXMgc3RpbGwgaW4gdG9vIG11Y2ggZmx1eC4gIFJldmVydCB1
bnRpbAppdCdzIHNvcnRlZCBvdXQuCgpTaWduZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhh
bmRlci5kZXVjaGVyQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2Zk
X2NoYXJkZXYuYyB8IDI4IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQogaW5jbHVkZS91YXBpL2xp
bnV4L2tmZF9pb2N0bC5oICAgICAgICAgICB8IDIwICstLS0tLS0tLS0tLS0tLS0tCiAyIGZpbGVz
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCA0NyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfY2hhcmRldi5jIGIvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRrZmQva2ZkX2NoYXJkZXYuYwppbmRleCAyNmIxNWNjNTZjMzEuLjFkM2NkNWM1MGQ1
ZiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2NoYXJkZXYuYwor
KysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfY2hhcmRldi5jCkBAIC0xNTY3LDMy
ICsxNTY3LDYgQEAgc3RhdGljIGludCBrZmRfaW9jdGxfdW5tYXBfbWVtb3J5X2Zyb21fZ3B1KHN0
cnVjdCBmaWxlICpmaWxlcCwKIAlyZXR1cm4gZXJyOwogfQogCi1zdGF0aWMgaW50IGtmZF9pb2N0
bF9hbGxvY19xdWV1ZV9nd3Moc3RydWN0IGZpbGUgKmZpbGVwLAotCQlzdHJ1Y3Qga2ZkX3Byb2Nl
c3MgKnAsIHZvaWQgKmRhdGEpCi17Ci0JaW50IHJldHZhbDsKLQlzdHJ1Y3Qga2ZkX2lvY3RsX2Fs
bG9jX3F1ZXVlX2d3c19hcmdzICphcmdzID0gZGF0YTsKLQlzdHJ1Y3Qga2ZkX2RldiAqZGV2Owot
Ci0JaWYgKCFod3NfZ3dzX3N1cHBvcnQpCi0JCXJldHVybiAtRU5PREVWOwotCi0JZGV2ID0ga2Zk
X2RldmljZV9ieV9pZChhcmdzLT5ncHVfaWQpOwotCWlmICghZGV2KSB7Ci0JCXByX2RlYnVnKCJD
b3VsZCBub3QgZmluZCBncHUgaWQgMHgleFxuIiwgYXJncy0+Z3B1X2lkKTsKLQkJcmV0dXJuIC1F
Tk9ERVY7Ci0JfQotCWlmIChkZXYtPmRxbS0+c2NoZWRfcG9saWN5ID09IEtGRF9TQ0hFRF9QT0xJ
Q1lfTk9fSFdTKQotCQlyZXR1cm4gLUVOT0RFVjsKLQotCW11dGV4X2xvY2soJnAtPm11dGV4KTsK
LQlyZXR2YWwgPSBwcW1fc2V0X2d3cygmcC0+cHFtLCBhcmdzLT5xdWV1ZV9pZCwgYXJncy0+bnVt
X2d3cyA/IGRldi0+Z3dzIDogTlVMTCk7Ci0JbXV0ZXhfdW5sb2NrKCZwLT5tdXRleCk7Ci0KLQlh
cmdzLT5maXJzdF9nd3MgPSAwOwotCXJldHVybiByZXR2YWw7Ci19Ci0KIHN0YXRpYyBpbnQga2Zk
X2lvY3RsX2dldF9kbWFidWZfaW5mbyhzdHJ1Y3QgZmlsZSAqZmlsZXAsCiAJCXN0cnVjdCBrZmRf
cHJvY2VzcyAqcCwgdm9pZCAqZGF0YSkKIHsKQEAgLTE3OTUsOCArMTc2OSw2IEBAIHN0YXRpYyBj
b25zdCBzdHJ1Y3QgYW1ka2ZkX2lvY3RsX2Rlc2MgYW1ka2ZkX2lvY3Rsc1tdID0gewogCUFNREtG
RF9JT0NUTF9ERUYoQU1ES0ZEX0lPQ19JTVBPUlRfRE1BQlVGLAogCQkJCWtmZF9pb2N0bF9pbXBv
cnRfZG1hYnVmLCAwKSwKIAotCUFNREtGRF9JT0NUTF9ERUYoQU1ES0ZEX0lPQ19BTExPQ19RVUVV
RV9HV1MsCi0JCQlrZmRfaW9jdGxfYWxsb2NfcXVldWVfZ3dzLCAwKSwKIH07CiAKICNkZWZpbmUg
QU1ES0ZEX0NPUkVfSU9DVExfQ09VTlQJQVJSQVlfU0laRShhbWRrZmRfaW9jdGxzKQpkaWZmIC0t
Z2l0IGEvaW5jbHVkZS91YXBpL2xpbnV4L2tmZF9pb2N0bC5oIGIvaW5jbHVkZS91YXBpL2xpbnV4
L2tmZF9pb2N0bC5oCmluZGV4IDA3MGQxYmM3ZTcyNS4uMjA5MTdjNTlmMzljIDEwMDY0NAotLS0g
YS9pbmNsdWRlL3VhcGkvbGludXgva2ZkX2lvY3RsLmgKKysrIGIvaW5jbHVkZS91YXBpL2xpbnV4
L2tmZF9pb2N0bC5oCkBAIC00MTAsMjEgKzQxMCw2IEBAIHN0cnVjdCBrZmRfaW9jdGxfdW5tYXBf
bWVtb3J5X2Zyb21fZ3B1X2FyZ3MgewogCV9fdTMyIG5fc3VjY2VzczsJCS8qIHRvL2Zyb20gS0ZE
ICovCiB9OwogCi0vKiBBbGxvY2F0ZSBHV1MgZm9yIHNwZWNpZmljIHF1ZXVlCi0gKgotICogQGdw
dV9pZDogICAgICBkZXZpY2UgaWRlbnRpZmllcgotICogQHF1ZXVlX2lkOiAgICBxdWV1ZSdzIGlk
IHRoYXQgR1dTIGlzIGFsbG9jYXRlZCBmb3IKLSAqIEBudW1fZ3dzOiAgICAgaG93IG1hbnkgR1dT
IHRvIGFsbG9jYXRlCi0gKiBAZmlyc3RfZ3dzOiAgIGluZGV4IG9mIHRoZSBmaXJzdCBHV1MgYWxs
b2NhdGVkLgotICogICAgICAgICAgICAgICBvbmx5IHN1cHBvcnQgY29udGlndW91cyBHV1MgYWxs
b2NhdGlvbgotICovCi1zdHJ1Y3Qga2ZkX2lvY3RsX2FsbG9jX3F1ZXVlX2d3c19hcmdzIHsKLQlf
X3UzMiBncHVfaWQ7CQkvKiB0byBLRkQgKi8KLQlfX3UzMiBxdWV1ZV9pZDsJCS8qIHRvIEtGRCAq
LwotCV9fdTMyIG51bV9nd3M7CQkvKiB0byBLRkQgKi8KLQlfX3UzMiBmaXJzdF9nd3M7CS8qIGZy
b20gS0ZEICovCi19OwotCiBzdHJ1Y3Qga2ZkX2lvY3RsX2dldF9kbWFidWZfaW5mb19hcmdzIHsK
IAlfX3U2NCBzaXplOwkJLyogZnJvbSBLRkQgKi8KIAlfX3U2NCBtZXRhZGF0YV9wdHI7CS8qIHRv
IEtGRCAqLwpAQCAtNTQ0LDEwICs1MjksNyBAQCBlbnVtIGtmZF9tbWlvX3JlbWFwIHsKICNkZWZp
bmUgQU1ES0ZEX0lPQ19JTVBPUlRfRE1BQlVGCQlcCiAJCUFNREtGRF9JT1dSKDB4MUQsIHN0cnVj
dCBrZmRfaW9jdGxfaW1wb3J0X2RtYWJ1Zl9hcmdzKQogCi0jZGVmaW5lIEFNREtGRF9JT0NfQUxM
T0NfUVVFVUVfR1dTCQlcCi0JCUFNREtGRF9JT1dSKDB4MUUsIHN0cnVjdCBrZmRfaW9jdGxfYWxs
b2NfcXVldWVfZ3dzX2FyZ3MpCi0KICNkZWZpbmUgQU1ES0ZEX0NPTU1BTkRfU1RBUlQJCTB4MDEK
LSNkZWZpbmUgQU1ES0ZEX0NPTU1BTkRfRU5ECQkweDFGCisjZGVmaW5lIEFNREtGRF9DT01NQU5E
X0VORAkJMHgxRQogCiAjZW5kaWYKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9hbWQtZ2Z4
