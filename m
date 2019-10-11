Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BF08D3749
	for <lists+amd-gfx@lfdr.de>; Fri, 11 Oct 2019 03:46:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 561AC6EB9A;
	Fri, 11 Oct 2019 01:46:09 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7361D6EB94
 for <amd-gfx@lists.freedesktop.org>; Fri, 11 Oct 2019 01:45:53 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id u184so7502206qkd.4
 for <amd-gfx@lists.freedesktop.org>; Thu, 10 Oct 2019 18:45:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4npGK0UCQcZ+74du8iZUcnKPb43MXoCijUvc6F4dBO0=;
 b=f0g8Z9APEA7WWiL6ceT4lulDjOaM4GPjgK2YcqKWBplSpCPXE5PGABsqhigsiLHrCW
 1LFXly88RU8Z4p9kKIWLcvbOodKGVjirD4YAZTqEwGQVDlJsoluJ4IEJMQz322TtdArT
 bTB0Gt60C1bVCyIvDn8vlU7tr9EZvEKwiaqEy5s2TNu34aoX17v9iadRqnr9vl6Pnaib
 gHdpCFCQddEJUHHsmWf8/3sHNyZ1t9tGbc2qZkoI4crE2O7uX13ZWa+8dL+iJc/Cls2M
 kT48D7cL+o7ZnHiLeec2mmiK5KV7pH1NAet05La4gGhxH3BOqDIEyU0OpMB9JSOOcmDl
 scFA==
X-Gm-Message-State: APjAAAWuzYDs3fai8V/QP17dUvkoMAIfYAhsC8AaAX9xyjALRM7kJ7Gt
 Dr/KizqbZ2tixlJznWwTIaSqXXpr
X-Google-Smtp-Source: APXvYqw/HEzCOewVmM6xy1QOJ4OZfMitrxlhHHC2Wa+Br52qYcBCiXaEYPPp73e53CI0NFb+Fcg64w==
X-Received: by 2002:a37:a9c1:: with SMTP id
 s184mr12963593qke.360.1570758352199; 
 Thu, 10 Oct 2019 18:45:52 -0700 (PDT)
Received: from localhost.localdomain ([71.51.171.205])
 by smtp.gmail.com with ESMTPSA id s23sm3612945qte.72.2019.10.10.18.45.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Oct 2019 18:45:51 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org,
	tiwai@suse.de,
	lukas@wunner.de
Subject: [PATCH 07/19] drm/amdgpu: add a amdgpu_device_supports_baco helper
Date: Thu, 10 Oct 2019 20:45:24 -0500
Message-Id: <20191011014536.10869-8-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191011014536.10869-1-alexander.deucher@amd.com>
References: <20191011014536.10869-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4npGK0UCQcZ+74du8iZUcnKPb43MXoCijUvc6F4dBO0=;
 b=tDaN/m/DlgrTI57BZv2RVSI+cCMr1d/anxihY4QkQ/egEDx94S2sXPbok+Gbjg/Ezw
 EMih+nQvYT45g+4acsvL+t3MKGDyannnI3il5Axlxpxvkszm7ZiLnfxxEiEZzaFQmrQE
 c8VHQwJUBD9rAWo7xnNcy8mAFbmBtlVpSrVw1C99GTJosyvrTK6HWBD7NmREpwciTp7h
 vLe5DyAez4u8kSbSE6JKeR/j+spzT47H+i2yk0UyUPPnmVRNuWstDPrUpu61OzQL4e5T
 3eUF8SO9hMX6WRzo/TZn5fAyCsoTuZ4yzvhmSad53mJMTqgZPmM8H/wr9N8IjKukpT0F
 Kerg==
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

VG8gY2hlY2sgaWYgYSBkZXZpY2Ugc3VwcG9ydHMgQkFDTyBvciBub3QuICBUaGlzIHdpbGwgYmUK
dXNlZCBpbiBkZXRlcm1pbmluZyB3aGVuIHRvIGVuYWJsZSBydW50aW1lIHBtLgoKU2lnbmVkLW9m
Zi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgotLS0KIGRyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdS5oICAgICAgICB8ICAxICsKIGRyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2UuYyB8IDE1ICsrKysrKysrKysrKysrKwogMiBm
aWxlcyBjaGFuZ2VkLCAxNiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1LmggYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHUuaAppbmRleCA3ODMzOGRiN2U0OGUuLjVmMWFlMDlmNDY0NCAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1LmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1LmgKQEAgLTExMjAsNiArMTEyMCw3IEBAIHZvaWQgYW1kZ3B1X2RldmljZV9w
cm9ncmFtX3JlZ2lzdGVyX3NlcXVlbmNlKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LAogCQkJ
CQkgICAgIGNvbnN0IHUzMiBhcnJheV9zaXplKTsKIAogYm9vbCBhbWRncHVfZGV2aWNlX2lzX3B4
KHN0cnVjdCBkcm1fZGV2aWNlICpkZXYpOworYm9vbCBhbWRncHVfZGV2aWNlX3N1cHBvcnRzX2Jh
Y28oc3RydWN0IGRybV9kZXZpY2UgKmRldik7CiBib29sIGFtZGdwdV9kZXZpY2VfaXNfcGVlcl9h
Y2Nlc3NpYmxlKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LAogCQkJCSAgICAgIHN0cnVjdCBh
bWRncHVfZGV2aWNlICpwZWVyX2FkZXYpOwogCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfZGV2aWNlLmMKaW5kZXggOTFiZGIyNDZlNDA1Li5kMGMxN2UzOGI0MzAgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2UuYworKysgYi9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMKQEAgLTE1Myw2ICsxNTMsMjEg
QEAgYm9vbCBhbWRncHVfZGV2aWNlX2lzX3B4KHN0cnVjdCBkcm1fZGV2aWNlICpkZXYpCiAJcmV0
dXJuIGZhbHNlOwogfQogCisvKioKKyAqIGFtZGdwdV9kZXZpY2Vfc3VwcG9ydHNfYmFjbyAtIERv
ZXMgdGhlIGRldmljZSBzdXBwb3J0IEJBQ08KKyAqCisgKiBAZGV2OiBkcm1fZGV2aWNlIHBvaW50
ZXIKKyAqCisgKiBSZXR1cm5zIHRydWUgaWYgdGhlIGRldmljZSBzdXBwb3J0ZSBCQUNPLAorICog
b3RoZXJ3aXNlIHJldHVybiBmYWxzZS4KKyAqLworYm9vbCBhbWRncHVfZGV2aWNlX3N1cHBvcnRz
X2JhY28oc3RydWN0IGRybV9kZXZpY2UgKmRldikKK3sKKwlzdHJ1Y3QgYW1kZ3B1X2RldmljZSAq
YWRldiA9IGRldi0+ZGV2X3ByaXZhdGU7CisKKwlyZXR1cm4gYW1kZ3B1X2FzaWNfc3VwcG9ydHNf
YmFjbyhhZGV2KTsKK30KKwogLyoKICAqIE1NSU8gcmVnaXN0ZXIgYWNjZXNzIGhlbHBlciBmdW5j
dGlvbnMuCiAgKi8KLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9h
bWQtZ2Z4
