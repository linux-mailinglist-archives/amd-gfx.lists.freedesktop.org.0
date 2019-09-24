Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DB1E5BC754
	for <lists+amd-gfx@lfdr.de>; Tue, 24 Sep 2019 13:56:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E6E96EA10;
	Tue, 24 Sep 2019 11:56:28 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A37246EA10
 for <amd-gfx@lists.freedesktop.org>; Tue, 24 Sep 2019 11:56:27 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id 5so1946848wmg.0
 for <amd-gfx@lists.freedesktop.org>; Tue, 24 Sep 2019 04:56:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VNMgnzkIFi6rP9RCMUdVw7kPuE4SIITDwbQzk+o2IwA=;
 b=RIuAnKOQVCMzNhqBZbTPQQFLRmRtSCTqRsHtrfxCeWdYlhHMK3cwWwsnMX23Mqou48
 MtkfxxRpUFZ3nTUmnm+9E2e0ctSxr27T8jmu1lIcbPp4TApZuBXe0hgy06PEuMAaYmfX
 oQtRm7Mua+kKcnOeOXI87MudBLRkTnm3jSWzzA5oRNCPmWwjYIsXqc6433OADu8Z/iW+
 htS8nTcb2yTA4AQenY0yPNxldzVuYIzRcuF6tWYGPZQDBL5Jo2XE9LkXq0pJ6laRPuFW
 st+Bpv+MrqG7RK70e/vci62j94hTyn98GwzZPDqN/cmaRigS8lpYxRPh0R5rWdfSsi4f
 xLjg==
X-Gm-Message-State: APjAAAUCxHSkM1ZFHxneKiwnEAHlbYJ5er7BHVZjLdC0sEH/9LRYYHiG
 KfLwDVYi2vtgsuzeRMInTIE=
X-Google-Smtp-Source: APXvYqy5yiLdNIrcEnLRvmoluNKMq4IxCeZqUuf/KEpbMoUQ6MjhtzqvHoyjHeWZqYdGhVoSLDs1lA==
X-Received: by 2002:a1c:9c52:: with SMTP id f79mr2384143wme.89.1569326186223; 
 Tue, 24 Sep 2019 04:56:26 -0700 (PDT)
Received: from baker.fritz.box ([2a02:908:1252:fb60:4184:4143:4db:3b9])
 by smtp.gmail.com with ESMTPSA id g11sm1710786wmh.45.2019.09.24.04.56.25
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 24 Sep 2019 04:56:25 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: Emily.Deng@amd.com,
	amd-gfx@lists.freedesktop.org
Subject: [PATCH] drm7amdgpu: once more fix amdgpu_bo_create_kernel_at
Date: Tue, 24 Sep 2019 13:56:24 +0200
Message-Id: <20190924115624.10949-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.14.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VNMgnzkIFi6rP9RCMUdVw7kPuE4SIITDwbQzk+o2IwA=;
 b=rPAzvyeH4j10SfRpsK74ERhHdWBeQ90mcYE7otprc6CMYdwxH/iEHj8e2dNRHDdeQK
 LZIhj2FwFNndcDuqtKCHaca5O5YdAp4ZkQL/x1QbDNJim5MlgIgqw8xnC/qcRH81MJEU
 pNUZ3ov0e7qUGqDycyxuxQXlzTbeuHXgi6tsPNbVmlpdC8JqRbLfteucGp+crn831lZt
 7NwEyJgn+bsvibYBFmOJVoYW0Ah9WldeE3cjJakUAmcfXFH57dROBz731ykTf4JlD9Ws
 XwudYaAsmtiWLgzeESV/aYPHkVV9hkie6niGd0xHakUX6faUe4cxbAvuYo4R3chEbB5H
 amJQ==
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

V2hlbiBDUFUgYWNjZXNzIGlzIG5lZWRlZCB3ZSBzaG91bGQgdGVsbCB0aGF0IHRvCmFtZGdwdV9i
b19jcmVhdGVfcmVzZXJ2ZWQoKSBvciBvdGhlcndpc2UgdGhlIGFjY2VzcyBpcyBkZW5pZWQgbGF0
ZXIgb24uCgpTaWduZWQtb2ZmLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmln
QGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X29iamVjdC5j
IHwgOSArKysrKystLS0KIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDMgZGVsZXRp
b25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X29i
amVjdC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X29iamVjdC5jCmluZGV4
IDEyZDJhZGNkZjE0ZS4uZjEwYjYxNzVlMjBjIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfb2JqZWN0LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X29iamVjdC5jCkBAIC0zNjksNyArMzY5LDcgQEAgaW50IGFtZGdwdV9ib19jcmVh
dGVfa2VybmVsX2F0KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LAogCXNpemUgPSBBTElHTihz
aXplLCBQQUdFX1NJWkUpOwogCiAJciA9IGFtZGdwdV9ib19jcmVhdGVfcmVzZXJ2ZWQoYWRldiwg
c2l6ZSwgUEFHRV9TSVpFLCBkb21haW4sIGJvX3B0ciwKLQkJCQkgICAgICBOVUxMLCBOVUxMKTsK
KwkJCQkgICAgICBOVUxMLCBjcHVfYWRkcik7CiAJaWYgKHIpCiAJCXJldHVybiByOwogCkBAIC0z
NzcsMTIgKzM3NywxNSBAQCBpbnQgYW1kZ3B1X2JvX2NyZWF0ZV9rZXJuZWxfYXQoc3RydWN0IGFt
ZGdwdV9kZXZpY2UgKmFkZXYsCiAJICogUmVtb3ZlIHRoZSBvcmlnaW5hbCBtZW0gbm9kZSBhbmQg
Y3JlYXRlIGEgbmV3IG9uZSBhdCB0aGUgcmVxdWVzdAogCSAqIHBvc2l0aW9uLgogCSAqLworCWlm
IChjcHVfYWRkcikKKwkJYW1kZ3B1X2JvX2t1bm1hcCgqYm9fcHRyKTsKKworCXR0bV9ib19tZW1f
cHV0KCYoKmJvX3B0ciktPnRibywgJigqYm9fcHRyKS0+dGJvLm1lbSk7CisKIAlmb3IgKGkgPSAw
OyBpIDwgKCpib19wdHIpLT5wbGFjZW1lbnQubnVtX3BsYWNlbWVudDsgKytpKSB7CiAJCSgqYm9f
cHRyKS0+cGxhY2VtZW50c1tpXS5mcGZuID0gb2Zmc2V0ID4+IFBBR0VfU0hJRlQ7CiAJCSgqYm9f
cHRyKS0+cGxhY2VtZW50c1tpXS5scGZuID0gKG9mZnNldCArIHNpemUpID4+IFBBR0VfU0hJRlQ7
CiAJfQotCi0JdHRtX2JvX21lbV9wdXQoJigqYm9fcHRyKS0+dGJvLCAmKCpib19wdHIpLT50Ym8u
bWVtKTsKIAlyID0gdHRtX2JvX21lbV9zcGFjZSgmKCpib19wdHIpLT50Ym8sICYoKmJvX3B0cikt
PnBsYWNlbWVudCwKIAkJCSAgICAgJigqYm9fcHRyKS0+dGJvLm1lbSwgJmN0eCk7CiAJaWYgKHIp
Ci0tIAoyLjE0LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
