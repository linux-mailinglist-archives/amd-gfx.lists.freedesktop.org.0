Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A5DF98733
	for <lists+amd-gfx@lfdr.de>; Thu, 22 Aug 2019 00:24:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AC356EA28;
	Wed, 21 Aug 2019 22:24:36 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1700C89F35
 for <amd-gfx@lists.freedesktop.org>; Wed, 21 Aug 2019 22:24:33 +0000 (UTC)
Received: by mail-qk1-x742.google.com with SMTP id u190so3365525qkh.5
 for <amd-gfx@lists.freedesktop.org>; Wed, 21 Aug 2019 15:24:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wvfttLGarGI6AabvFtH5oWbmeaGy/l+PSiE/tbEjnqw=;
 b=p5OZR6j0brooDnMW2QDvwiGJj9mLIn7i0TyBOBLZ6ILhsFTNOB4VLxjJNBVIjVR6Nk
 QT/EaYM79ooWb/iCaNy2MEZUXWL4bFqsI0AOrecQpR1bu4QD7eYXRjtWiXRBvoolqg/I
 MnkzjWv/un9MNgVPIbXcJfHOsY9iFc9Y0U0OnWbJNTT9yEJC1rVBm+wV2XCgQ7EKWnOv
 y/WEY/f8XiPNVV/oiT4xQHFiRwqeaycPy46SNZjVV94ztPSwkqHvo9kOGKaoiTwndn4e
 X2DBh6AR+3s+/4aGEkoReS8neVXsiFvejUFtcIEQrr92UHDZ2rFo665+QwHSaXmgw9Mv
 qlhA==
X-Gm-Message-State: APjAAAWuKiOzsxErsdEiwksQszWJX7G1zZdek9H3eT/gvOrRIIPTcgJt
 52hAu92lvnsbr7+fkWEBpEwwtWTC
X-Google-Smtp-Source: APXvYqwZkfmpIGHo9g5LCjsuaUntvRLO7pTODKf5jq4OQspDOcdBTTROKiYHuZADVa2kIQ2MWg44lw==
X-Received: by 2002:a05:620a:143b:: with SMTP id
 k27mr10299326qkj.127.1566426271833; 
 Wed, 21 Aug 2019 15:24:31 -0700 (PDT)
Received: from localhost.localdomain ([71.219.73.178])
 by smtp.gmail.com with ESMTPSA id w1sm10853983qte.36.2019.08.21.15.24.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Aug 2019 15:24:31 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 23/37] drm/amdgpu: enable HDP clock gating for rn
Date: Wed, 21 Aug 2019 17:23:45 -0500
Message-Id: <20190821222359.13578-24-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190821222359.13578-1-alexander.deucher@amd.com>
References: <20190821222359.13578-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wvfttLGarGI6AabvFtH5oWbmeaGy/l+PSiE/tbEjnqw=;
 b=XxhTfXZNOEHThuu4reBJf63s67E8JaHSaW6Ii1eyagm1eJNLgzVQb+6ctJ4kIRZ5UC
 as+jdYUBjtEyKjxHuJOkmfSV4sfmySRUMKCp2Sis6dtkONjIQikA/cxSLDtfxz/Cr6/0
 1rqEe0vRYx+eRDKkuJYFXhJW7QO+MXUNUu/eTk2bSFKHRZHQiGmYMvDCnRzINteAiFcD
 TGTTH/0vG4cxIHqJeSw7IeZAn6D3uNMAksMgedNQOwKkqPVo1XUc6OM9wiqnXW56V0Zw
 bPyODvhnPK7fddrcQXDQVqTCXsBA0uL4sNyT9aNs8kMr0/4ubig6dkXNf/7SuNw91UJ/
 7NAA==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Prike Liang <Prike.Liang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogUHJpa2UgTGlhbmcgPFByaWtlLkxpYW5nQGFtZC5jb20+CgpFbmFibGUgSERQIGxpZ2h0
IHNsZWVwIGNsb2NrIGdhdGluZy4KClNpZ25lZC1vZmYtYnk6IFByaWtlIExpYW5nIDxQcmlrZS5M
aWFuZ0BhbWQuY29tPgpSZXZpZXdlZC1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hl
ckBhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVy
QGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc29jMTUuYyB8IDMgKyst
CiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc29jMTUuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L3NvYzE1LmMKaW5kZXggMjVmNTVjNzkzZmViLi5jZTEwMWJjYmUwMmMgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NvYzE1LmMKKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvc29jMTUuYwpAQCAtMTE2NSw3ICsxMTY1LDggQEAgc3RhdGlj
IGludCBzb2MxNV9jb21tb25fZWFybHlfaW5pdCh2b2lkICpoYW5kbGUpCiAJCQkJIEFNRF9DR19T
VVBQT1JUX01DX0xTIHwKIAkJCQkgQU1EX0NHX1NVUFBPUlRfU0RNQV9NR0NHIHwKIAkJCQkgQU1E
X0NHX1NVUFBPUlRfU0RNQV9MUyB8Ci0JCQkJIEFNRF9DR19TVVBQT1JUX0JJRl9MUzsKKwkJCQkg
QU1EX0NHX1NVUFBPUlRfQklGX0xTIHwKKwkJCQkgQU1EX0NHX1NVUFBPUlRfSERQX0xTOwogCQlh
ZGV2LT5wZ19mbGFncyA9IDA7CiAJCWFkZXYtPmV4dGVybmFsX3Jldl9pZCA9IGFkZXYtPnJldl9p
ZCArIDB4OTE7CiAKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9h
bWQtZ2Z4
