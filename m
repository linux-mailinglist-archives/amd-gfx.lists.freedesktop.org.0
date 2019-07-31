Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 182F27CB36
	for <lists+amd-gfx@lfdr.de>; Wed, 31 Jul 2019 19:58:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D97206E207;
	Wed, 31 Jul 2019 17:58:49 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-vs1-xe42.google.com (mail-vs1-xe42.google.com
 [IPv6:2607:f8b0:4864:20::e42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 148806E1B4
 for <amd-gfx@lists.freedesktop.org>; Wed, 31 Jul 2019 17:58:49 +0000 (UTC)
Received: by mail-vs1-xe42.google.com with SMTP id u3so46780994vsh.6
 for <amd-gfx@lists.freedesktop.org>; Wed, 31 Jul 2019 10:58:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hSvb+50+jhJ3d1eH8zRIBpx33+4tAwpxHJ7rPgFkJKc=;
 b=blRhG/LyS8+Wxe8N5Seb/JPzu8v43t3H6jTxe3NLX5skFmHCZAJ3F34JSY6HfReP+e
 O23JqW5YkoPOrHmdM5yvSbIziTRhQeVd6aEN5b+wTsCIpjZ2bR4bSQMpUz+ZXRcBnPvl
 wlLC7l2tqTv27yj6DdYOJtF/2CLXOJbcRFgvHHqDgsCtMlwXRj6YrjuoxVWh1mCxE7Cl
 rYMW37z1z1F5N97UddH1fn1RpRPCCbxNMyUUfnVO6xfscD1Y2dSQYXhhnCpduv7++Nl2
 gH6DKHm/y2XlvqMONd2kyoIOHlRDw4JsU+fllaUxgjKPNHuUrTzOdKB7Pas80ZdcZdTT
 /Rwg==
X-Gm-Message-State: APjAAAXEvObcW3kNbSmQ8Mf2k7VOLzBO79x2myHVnjHBLamLNbYX+Rj8
 RPnjHUjB9LokhQiux0H80VsqGSU4
X-Google-Smtp-Source: APXvYqz6w4r7LKw6Qgrt5ezOli76KfKv3YZkNHnNuM7h9fjsuTA49ROFy1ZVH2+DshMQoQ6yEYYpUg==
X-Received: by 2002:a67:89c7:: with SMTP id l190mr78782004vsd.13.1564595927833; 
 Wed, 31 Jul 2019 10:58:47 -0700 (PDT)
Received: from localhost.localdomain ([71.219.6.100])
 by smtp.gmail.com with ESMTPSA id m123sm18189707vsm.30.2019.07.31.10.58.47
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 31 Jul 2019 10:58:47 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 20/26] drm/amdgpu: remove ras_reserve_vram in ras injection
Date: Wed, 31 Jul 2019 12:58:12 -0500
Message-Id: <20190731175818.20159-21-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190731175818.20159-1-alexander.deucher@amd.com>
References: <20190731175818.20159-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hSvb+50+jhJ3d1eH8zRIBpx33+4tAwpxHJ7rPgFkJKc=;
 b=n5rP2w8blLQJXJNVSlMx7qduI9+TC7e0OH0FTeCi9KCHDv0uD4Y8+PAxEUjTDP/L9n
 Vj6/ZqTx9u2FLaOwTfqu+OVhBlD4llU4q+y//FWRPOQa/2JDTfIryO0DZgw9Ol8MGfUw
 K2aujX0pmBo2hvM/XUWfDQ6EB3ma2buQ+GjL86iMlRnaMNGhYRNIepnOg5v4juDqtjB5
 y09AoDTcLNcBFeCzumNoJ/6SzUHJcBmvw2wZa+zoAtlm2y23u2aIkSzepTLTYIvOBezv
 Q7NRdLLKkD0HrVtvwcJXdoG+9RrdyAVAwbwTK2O4zi9H4MK8nK9EY+7suZgSdS65G5IV
 rJsg==
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
Cc: Tao Zhou <tao.zhou1@amd.com>, Dennis Li <dennis.li@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogVGFvIFpob3UgPHRhby56aG91MUBhbWQuY29tPgoKZXJyb3IgaW5qZWN0aW9uIGFkZHJl
c3MgaXMgbm90IGluIGdwdSBhZGRyZXNzIHNwYWNlCgpTaWduZWQtb2ZmLWJ5OiBUYW8gWmhvdSA8
dGFvLnpob3UxQGFtZC5jb20+ClJldmlld2VkLWJ5OiBEZW5uaXMgTGkgPGRlbm5pcy5saUBhbWQu
Y29tPgpSZXZpZXdlZC1ieTogSGF3a2luZyBaaGFuZyA8SGF3a2luZy5aaGFuZ0BhbWQuY29tPgot
LS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuYyB8IDIxICsrKysrKysr
KystLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKyksIDExIGRlbGV0
aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9y
YXMuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuYwppbmRleCBhODdk
ZWI3YmU0MTQuLmNjZDU4NjNiY2E4OCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1X3Jhcy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV9yYXMuYwpAQCAtNjAsNiArNjAsOSBAQCBjb25zdCBjaGFyICpyYXNfYmxvY2tfc3RyaW5nW10g
PSB7CiAjZGVmaW5lIEFNREdQVV9SQVNfRkxBR19JTklUX05FRURfUkVTRVQJCTIKICNkZWZpbmUg
UkFTX0RFRkFVTFRfRkxBR1MgKEFNREdQVV9SQVNfRkxBR19JTklUX0JZX1ZCSU9TKQogCisvKiBp
bmplY3QgYWRkcmVzcyBpcyA1MiBiaXRzICovCisjZGVmaW5lCVJBU19VTUNfSU5KRUNUX0FERFJf
TElNSVQJKDB4MVVMTCA8PCA1MikKKwogc3RhdGljIGludCBhbWRncHVfcmFzX3Jlc2VydmVfdnJh
bShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwKIAkJdWludDY0X3Qgb2Zmc2V0LCB1aW50NjRf
dCBzaXplLAogCQlzdHJ1Y3QgYW1kZ3B1X2JvICoqYm9fcHRyKTsKQEAgLTI0NSw3ICsyNDgsNiBA
QCBzdGF0aWMgc3NpemVfdCBhbWRncHVfcmFzX2RlYnVnZnNfY3RybF93cml0ZShzdHJ1Y3QgZmls
ZSAqZiwgY29uc3QgY2hhciBfX3VzZXIgKgogewogCXN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2
ID0gKHN0cnVjdCBhbWRncHVfZGV2aWNlICopZmlsZV9pbm9kZShmKS0+aV9wcml2YXRlOwogCXN0
cnVjdCByYXNfZGVidWdfaWYgZGF0YTsKLQlzdHJ1Y3QgYW1kZ3B1X2JvICpibzsKIAlpbnQgcmV0
ID0gMDsKIAogCXJldCA9IGFtZGdwdV9yYXNfZGVidWdmc19jdHJsX3BhcnNlX2RhdGEoZiwgYnVm
LCBzaXplLCBwb3MsICZkYXRhKTsKQEAgLTI2MywxNyArMjY1LDE0IEBAIHN0YXRpYyBzc2l6ZV90
IGFtZGdwdV9yYXNfZGVidWdmc19jdHJsX3dyaXRlKHN0cnVjdCBmaWxlICpmLCBjb25zdCBjaGFy
IF9fdXNlciAqCiAJCXJldCA9IGFtZGdwdV9yYXNfZmVhdHVyZV9lbmFibGUoYWRldiwgJmRhdGEu
aGVhZCwgMSk7CiAJCWJyZWFrOwogCWNhc2UgMjoKLQkJcmV0ID0gYW1kZ3B1X3Jhc19yZXNlcnZl
X3ZyYW0oYWRldiwKLQkJCQlkYXRhLmluamVjdC5hZGRyZXNzLCBQQUdFX1NJWkUsICZibyk7Ci0J
CWlmIChyZXQpIHsKLQkJCS8qIGFkZHJlc3Mgd2FzIG9mZnNldCwgbm93IGl0IGlzIGFic29sdXRl
LiovCi0JCQlkYXRhLmluamVjdC5hZGRyZXNzICs9IGFkZXYtPmdtYy52cmFtX3N0YXJ0OwotCQkJ
aWYgKGRhdGEuaW5qZWN0LmFkZHJlc3MgPiBhZGV2LT5nbWMudnJhbV9lbmQpCi0JCQkJYnJlYWs7
Ci0JCX0gZWxzZQotCQkJZGF0YS5pbmplY3QuYWRkcmVzcyA9IGFtZGdwdV9ib19ncHVfb2Zmc2V0
KGJvKTsKKwkJaWYgKChkYXRhLmluamVjdC5hZGRyZXNzID49IGFkZXYtPmdtYy5tY192cmFtX3Np
emUpIHx8CisJCSAgICAoZGF0YS5pbmplY3QuYWRkcmVzcyA+PSBSQVNfVU1DX0lOSkVDVF9BRERS
X0xJTUlUKSkgeworCQkJcmV0ID0gLUVJTlZBTDsKKwkJCWJyZWFrOworCQl9CisKKwkJLyogZGF0
YS5pbmplY3QuYWRkcmVzcyBpcyBvZmZzZXQgaW5zdGVhZCBvZiBhYnNvbHV0ZSBncHUgYWRkcmVz
cyAqLwogCQlyZXQgPSBhbWRncHVfcmFzX2Vycm9yX2luamVjdChhZGV2LCAmZGF0YS5pbmplY3Qp
OwotCQlhbWRncHVfcmFzX3JlbGVhc2VfdnJhbShhZGV2LCAmYm8pOwogCQlicmVhazsKIAlkZWZh
dWx0OgogCQlyZXQgPSAtRUlOVkFMOwotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2FtZC1nZng=
