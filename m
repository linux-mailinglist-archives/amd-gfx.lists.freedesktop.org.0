Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85C95232376
	for <lists+amd-gfx@lfdr.de>; Wed, 29 Jul 2020 19:35:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 134826E5D1;
	Wed, 29 Jul 2020 17:35:03 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F2926E5C8
 for <amd-gfx@lists.freedesktop.org>; Wed, 29 Jul 2020 17:35:01 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id d27so18248867qtg.4
 for <amd-gfx@lists.freedesktop.org>; Wed, 29 Jul 2020 10:35:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IMX0bbaXjdhitPmkT39qtDB4M3iFe31KWAtRm6msT4c=;
 b=n7V7qRqVq2oB5VBDmO+AKx7hyj0lQr2xSayvbLxJlsPLuYRYDFTGPVdMk+jhLbRVp/
 mAHWJkReoO4+dvYHOzuoVQwMJ8ENVOyTbOlL/84wDbt6ETf9WWRL2zsaWsN9pD8zYms9
 hAdWXgpW3rluSA/f4bYgmopj/mC6EzkbS8ks/yoCICZCJC5/isU2t+Om+xllKmdL4LOX
 Q77sxvYMgWa52KL7gKsXYdHQxwM+QIgRD8KI2IzJEcfY+gOQDLI6y9viOw5Y7M1qyEBl
 G4rUPJfpEV5E/DHvLNdqCHCPnMUPpbybQspkwXuAjwe9rS4hoa7wmzBgNwFzyRgtXZEW
 YBDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IMX0bbaXjdhitPmkT39qtDB4M3iFe31KWAtRm6msT4c=;
 b=AMme7ngx6iFIms+zNmwY2zNo/L3DLjn8/1R65Su4VEY0sYQxN9K5zaYKsXR2pBxJsq
 ybPHDEqtQBMGKAOTj8l2vIOyUwCIWox4hi4H8PDo17mLSl3xw4N6EoEQSg2YtgGDNI36
 K31AiZtNxRLxbyY1ZutyDA8yDodrJUS8FlOaDanHrqoG3wVUzlXfm4e4rRMcsOfqOyOz
 CSDpv8L8vrh31OF+ZoIM4omIfFazAFVby9KX9SDTVPRRxCCu7uBaSrEPbiLNFPYP8yrv
 Wiu7DiF5qBz07KUxCT4b0tlsxe2qgXRNrVxuPRAuuYOb8Jk1B0l/Dy8RtIcUCQQlc81T
 oXug==
X-Gm-Message-State: AOAM531zIispj2RCuiDnFfNty81PdLbYokHZk1qebySXgTUjTWMhEGJG
 ytPysh+5LwEnBs1bNtgxz1d3BQsW
X-Google-Smtp-Source: ABdhPJxOYy29FQrUNiIPYIp1JTU8DBD8Z7mm9J9QfMTugcTQHhNHeKn2WnhUAM4sZHsAnVU894RkjA==
X-Received: by 2002:ac8:458a:: with SMTP id l10mr13209600qtn.345.1596044100366; 
 Wed, 29 Jul 2020 10:35:00 -0700 (PDT)
Received: from localhost.localdomain ([71.219.66.138])
 by smtp.gmail.com with ESMTPSA id z72sm2132956qka.107.2020.07.29.10.34.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jul 2020 10:34:59 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 13/17] drm/amdgpu: drop the CPU pointers for the stolen vga bos
Date: Wed, 29 Jul 2020 13:34:35 -0400
Message-Id: <20200729173439.3698-14-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200729173439.3698-1-alexander.deucher@amd.com>
References: <20200729173439.3698-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-BeenThere: amd-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion list for AMD gfx <amd-gfx.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/amd-gfx>
List-Post: <mailto:amd-gfx@lists.freedesktop.org>
List-Help: <mailto:amd-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=subscribe>
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Felix Kuehling <Felix.Kuehling@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

V2UgbmV2ZXIgdXNlIHRoZW0uCgpSZXZpZXdlZC1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0
aWFuLmtvZW5pZ0BhbWQuY29tPgpSZXZpZXdlZC1ieTogRmVsaXggS3VlaGxpbmcgPEZlbGl4Lkt1
ZWhsaW5nQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRl
dWNoZXJAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdHRt
LmMgfCAxNiArKysrKy0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCsp
LCAxMSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfdHRtLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdHRtLmMK
aW5kZXggZWM5NzUyNTFiMTcxLi4zZGY5ZDVhNTM3NDEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90dG0uYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHVfdHRtLmMKQEAgLTE5MTUsNyArMTkxNSw2IEBAIGludCBhbWRncHVfdHRtX2lu
aXQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCiAJdWludDY0X3QgZ3R0X3NpemU7CiAJaW50
IHI7CiAJdTY0IHZpc192cmFtX2xpbWl0OwotCXZvaWQgKnN0b2xlbl92Z2FfYnVmLCAqc3RvbGVu
X2V4dGVuZGVkX2J1ZjsKIAogCW11dGV4X2luaXQoJmFkZXYtPm1tYW4uZ3R0X3dpbmRvd19sb2Nr
KTsKIApAQCAtMTk4MiwxNCArMTk4MSwxNCBAQCBpbnQgYW1kZ3B1X3R0bV9pbml0KHN0cnVjdCBh
bWRncHVfZGV2aWNlICphZGV2KQogCXIgPSBhbWRncHVfYm9fY3JlYXRlX2tlcm5lbF9hdChhZGV2
LCAwLCBhZGV2LT5nbWMuc3RvbGVuX3ZnYV9zaXplLAogCQkJCSAgICAgICBBTURHUFVfR0VNX0RP
TUFJTl9WUkFNLAogCQkJCSAgICAgICAmYWRldi0+Z21jLnN0b2xlbl92Z2FfbWVtb3J5LAotCQkJ
CSAgICAgICAmc3RvbGVuX3ZnYV9idWYpOworCQkJCSAgICAgICBOVUxMKTsKIAlpZiAocikKIAkJ
cmV0dXJuIHI7CiAJciA9IGFtZGdwdV9ib19jcmVhdGVfa2VybmVsX2F0KGFkZXYsIGFkZXYtPmdt
Yy5zdG9sZW5fdmdhX3NpemUsCiAJCQkJICAgICAgIGFkZXYtPmdtYy5zdG9sZW5fZXh0ZW5kZWRf
c2l6ZSwKIAkJCQkgICAgICAgQU1ER1BVX0dFTV9ET01BSU5fVlJBTSwKIAkJCQkgICAgICAgJmFk
ZXYtPmdtYy5zdG9sZW5fZXh0ZW5kZWRfbWVtb3J5LAotCQkJCSAgICAgICAmc3RvbGVuX2V4dGVu
ZGVkX2J1Zik7CisJCQkJICAgICAgIE5VTEwpOwogCWlmIChyKQogCQlyZXR1cm4gcjsKIApAQCAt
MjA0OCwxMyArMjA0NywxMCBAQCBpbnQgYW1kZ3B1X3R0bV9pbml0KHN0cnVjdCBhbWRncHVfZGV2
aWNlICphZGV2KQogICovCiB2b2lkIGFtZGdwdV90dG1fbGF0ZV9pbml0KHN0cnVjdCBhbWRncHVf
ZGV2aWNlICphZGV2KQogewotCXZvaWQgKnN0b2xlbl92Z2FfYnVmLCAqc3RvbGVuX2V4dGVuZGVk
X2J1ZjsKLQogCS8qIHJldHVybiB0aGUgVkdBIHN0b2xlbiBtZW1vcnkgKGlmIGFueSkgYmFjayB0
byBWUkFNICovCiAJaWYgKCFhZGV2LT5nbWMua2VlcF9zdG9sZW5fdmdhX21lbW9yeSkKLQkJYW1k
Z3B1X2JvX2ZyZWVfa2VybmVsKCZhZGV2LT5nbWMuc3RvbGVuX3ZnYV9tZW1vcnksIE5VTEwsICZz
dG9sZW5fdmdhX2J1Zik7Ci0JYW1kZ3B1X2JvX2ZyZWVfa2VybmVsKCZhZGV2LT5nbWMuc3RvbGVu
X2V4dGVuZGVkX21lbW9yeSwgTlVMTCwKLQkJCSAgICAgICZzdG9sZW5fZXh0ZW5kZWRfYnVmKTsK
KwkJYW1kZ3B1X2JvX2ZyZWVfa2VybmVsKCZhZGV2LT5nbWMuc3RvbGVuX3ZnYV9tZW1vcnksIE5V
TEwsIE5VTEwpOworCWFtZGdwdV9ib19mcmVlX2tlcm5lbCgmYWRldi0+Z21jLnN0b2xlbl9leHRl
bmRlZF9tZW1vcnksIE5VTEwsIE5VTEwpOwogfQogCiAvKioKQEAgLTIwNjIsMTUgKzIwNTgsMTMg
QEAgdm9pZCBhbWRncHVfdHRtX2xhdGVfaW5pdChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikK
ICAqLwogdm9pZCBhbWRncHVfdHRtX2Zpbmkoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCiB7
Ci0Jdm9pZCAqc3RvbGVuX3ZnYV9idWY7Ci0KIAlpZiAoIWFkZXYtPm1tYW4uaW5pdGlhbGl6ZWQp
CiAJCXJldHVybjsKIAogCWFtZGdwdV90dG1fdHJhaW5pbmdfcmVzZXJ2ZV92cmFtX2ZpbmkoYWRl
dik7CiAJLyogcmV0dXJuIHRoZSBzdG9sZW4gdmdhIG1lbW9yeSBiYWNrIHRvIFZSQU0gKi8KIAlp
ZiAoYWRldi0+Z21jLmtlZXBfc3RvbGVuX3ZnYV9tZW1vcnkpCi0JCWFtZGdwdV9ib19mcmVlX2tl
cm5lbCgmYWRldi0+Z21jLnN0b2xlbl92Z2FfbWVtb3J5LCBOVUxMLCAmc3RvbGVuX3ZnYV9idWYp
OworCQlhbWRncHVfYm9fZnJlZV9rZXJuZWwoJmFkZXYtPmdtYy5zdG9sZW5fdmdhX21lbW9yeSwg
TlVMTCwgTlVMTCk7CiAJLyogcmV0dXJuIHRoZSBJUCBEaXNjb3ZlcnkgVE1SIG1lbW9yeSBiYWNr
IHRvIFZSQU0gKi8KIAlhbWRncHVfYm9fZnJlZV9rZXJuZWwoJmFkZXYtPmRpc2NvdmVyeV9tZW1v
cnksIE5VTEwsIE5VTEwpOwogCWFtZGdwdV90dG1fZndfcmVzZXJ2ZV92cmFtX2ZpbmkoYWRldik7
Ci0tIAoyLjI1LjQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeAo=
