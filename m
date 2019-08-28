Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DA0DA0AE7
	for <lists+amd-gfx@lfdr.de>; Wed, 28 Aug 2019 21:57:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F15E89F1B;
	Wed, 28 Aug 2019 19:57:07 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C211389EB8
 for <amd-gfx@lists.freedesktop.org>; Wed, 28 Aug 2019 19:56:49 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id n7so978338qtb.6
 for <amd-gfx@lists.freedesktop.org>; Wed, 28 Aug 2019 12:56:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aTI90Tua287LPqeXXvD9PDdHnNWSF82y+wem3D3aStg=;
 b=JzuIpO3A4ucFy3tqclkoXMv3FhYPGjGMiridC1t6U/zu3A4uhjAS41N8OowREXZd+N
 5qkcn4bAaMU1Kn45NnLOxzAE+VZwDDSZUpyScn3RVj1wUIEREHR9QrQSqRO6AYeqq1Cn
 IU8PQM63jKrF9a0tgLzcVj0q1U+C4kxUxDkeVr2XzhJ3YJSLPFzbaTlzO9N13tN54NHc
 8i9qi4jxhOjLXMlp2/ZfDyJ3WY1wf35QhJdURq8PR2mW31H7Kk0k4shAVHqez+Ew+V/J
 b34PwWneC8OrAz321wcqraLypXFerVgowPzb2M6oPG73EmwuDvKJCNrX25LiyUW+VYrj
 6pCg==
X-Gm-Message-State: APjAAAX4u/BV9Hv3CrV2yxK3y1T1ZFRGYRO7KQPHQQ0wWb6u/FkBus1e
 q0Rwv7gET1eFr/kM/Ei9peCNg6sE
X-Google-Smtp-Source: APXvYqx6+MVTUeQVGb96yvgpZjtSAw0MslLlSGQ9ObCmPwpY88li8MuYnMcwV1fWwl6QBZUf+Y924w==
X-Received: by 2002:ac8:7a96:: with SMTP id x22mr6110631qtr.335.1567022208430; 
 Wed, 28 Aug 2019 12:56:48 -0700 (PDT)
Received: from localhost.localdomain ([71.219.73.178])
 by smtp.gmail.com with ESMTPSA id s58sm136578qth.59.2019.08.28.12.56.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Aug 2019 12:56:47 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 15/23] drm/amd/display: Handle Renoir in amdgpu_dm (v2)
Date: Wed, 28 Aug 2019 14:56:14 -0500
Message-Id: <20190828195622.28941-15-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190828195622.28941-1-alexander.deucher@amd.com>
References: <20190828195622.28941-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aTI90Tua287LPqeXXvD9PDdHnNWSF82y+wem3D3aStg=;
 b=kQ3UTDon++DIcyfd2BZAYt7qBlO8vYLs/eyYhil9QiN0icPzUAFUm3IWdRVsCVPqOP
 yGaI36+cpolJD7wWio6PgnIGjktPMjc1GlPXDOKx+IluBJqc0F06eB8k9COJ2+gytq0e
 dL/RJxFfX77Otg+JrXQy8OPNuthj8BcFpQhSnuy/pZZZGHTLeYa9WFTJNRrc8FUsIFyF
 pTpGCfv6FZGR9WqWWJ8YXUNKzy9hDC5db68W50xr4GjKSrqxIBbM2zFfHGNPeIVOu+vC
 GKNHvM9NcsGBeKmLEXKi0TS7mWIXYyASRYYoAFkK+z6mZv3npP/hiMZq75VhcxBGTH20
 RpUg==
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogQmhhd2FucHJlZXQgTGFraGEgPEJoYXdhbnByZWV0Lkxha2hhQGFtZC5jb20+CgpIb29r
IHVwIHJlbm9pciBzdXBwb3J0IHRvIEtNUy4KCnYyOiBzcXVhc2ggaW4gIkZpeGVzIGZvciBSZW5v
aXIgaW4gYW1kZ3B1X2RtIgoKU2lnbmVkLW9mZi1ieTogQmhhd2FucHJlZXQgTGFraGEgPEJoYXdh
bnByZWV0Lkxha2hhQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFu
ZGVyLmRldWNoZXJAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1k
Z3B1X2RtL2FtZGdwdV9kbS5jIHwgMTQgKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAx
NCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5
L2FtZGdwdV9kbS9hbWRncHVfZG0uYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRn
cHVfZG0vYW1kZ3B1X2RtLmMKaW5kZXggMTYwYWYwYzhiNDBjLi4xYjA5NDlkZDc4MDggMTAwNjQ0
Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMK
KysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYwpA
QCAtODEyLDYgKzgxMiw3IEBAIHN0YXRpYyBpbnQgbG9hZF9kbWN1X2Z3KHN0cnVjdCBhbWRncHVf
ZGV2aWNlICphZGV2KQogCWNhc2UgQ0hJUF9OQVZJMTA6CiAJY2FzZSBDSElQX05BVkkxNDoKIAlj
YXNlIENISVBfTkFWSTEyOgorCWNhc2UgQ0hJUF9SRU5PSVI6CiAJCXJldHVybiAwOwogCWNhc2Ug
Q0hJUF9SQVZFTjoKIAkJaWYgKEFTSUNSRVZfSVNfUElDQVNTTyhhZGV2LT5leHRlcm5hbF9yZXZf
aWQpKQpAQCAtMjM2NCw2ICsyMzY1LDkgQEAgc3RhdGljIGludCBhbWRncHVfZG1faW5pdGlhbGl6
ZV9kcm1fZGV2aWNlKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQogCWNhc2UgQ0hJUF9OQVZJ
MTI6CiAJY2FzZSBDSElQX05BVkkxMDoKIAljYXNlIENISVBfTkFWSTE0OgorI2VuZGlmCisjaWYg
ZGVmaW5lZChDT05GSUdfRFJNX0FNRF9EQ19EQ04yXzEpCisJY2FzZSBDSElQX1JFTk9JUjoKICNl
bmRpZgogCQlpZiAoZGNuMTBfcmVnaXN0ZXJfaXJxX2hhbmRsZXJzKGRtLT5hZGV2KSkgewogCQkJ
RFJNX0VSUk9SKCJETTogRmFpbGVkIHRvIGluaXRpYWxpemUgSVJRXG4iKTsKQEAgLTI2MDIsNiAr
MjYwNiwxMyBAQCBzdGF0aWMgaW50IGRtX2Vhcmx5X2luaXQodm9pZCAqaGFuZGxlKQogCQlhZGV2
LT5tb2RlX2luZm8ubnVtX2hwZCA9IDU7CiAJCWFkZXYtPm1vZGVfaW5mby5udW1fZGlnID0gNTsK
IAkJYnJlYWs7CisjZW5kaWYKKyNpZiBkZWZpbmVkKENPTkZJR19EUk1fQU1EX0RDX0RDTjJfMSkK
KwljYXNlIENISVBfUkVOT0lSOgorCQlhZGV2LT5tb2RlX2luZm8ubnVtX2NydGMgPSA0OworCQlh
ZGV2LT5tb2RlX2luZm8ubnVtX2hwZCA9IDQ7CisJCWFkZXYtPm1vZGVfaW5mby5udW1fZGlnID0g
NDsKKwkJYnJlYWs7CiAjZW5kaWYKIAlkZWZhdWx0OgogCQlEUk1fRVJST1IoIlVuc3VwcG9ydGVk
IEFTSUMgdHlwZTogMHglWFxuIiwgYWRldi0+YXNpY190eXBlKTsKQEAgLTI4OTksNiArMjkxMCw5
IEBAIGZpbGxfcGxhbmVfYnVmZmVyX2F0dHJpYnV0ZXMoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFk
ZXYsCiAJICAgIGFkZXYtPmFzaWNfdHlwZSA9PSBDSElQX05BVkkxMCB8fAogCSAgICBhZGV2LT5h
c2ljX3R5cGUgPT0gQ0hJUF9OQVZJMTQgfHwKIAkgICAgYWRldi0+YXNpY190eXBlID09IENISVBf
TkFWSTEyIHx8CisjZW5kaWYKKyNpZiBkZWZpbmVkKENPTkZJR19EUk1fQU1EX0RDX0RDTjJfMSkK
KwkgICAgYWRldi0+YXNpY190eXBlID09IENISVBfUkVOT0lSIHx8CiAjZW5kaWYKIAkgICAgYWRl
di0+YXNpY190eXBlID09IENISVBfUkFWRU4pIHsKIAkJLyogRmlsbCBHRlg5IHBhcmFtcyAqLwot
LSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
