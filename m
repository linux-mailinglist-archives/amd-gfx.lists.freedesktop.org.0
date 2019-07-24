Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C7C17270F
	for <lists+amd-gfx@lfdr.de>; Wed, 24 Jul 2019 07:00:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CDA16E43D;
	Wed, 24 Jul 2019 05:00:26 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DCFA6E43B
 for <amd-gfx@lists.freedesktop.org>; Wed, 24 Jul 2019 05:00:24 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id z4so44286476qtc.3
 for <amd-gfx@lists.freedesktop.org>; Tue, 23 Jul 2019 22:00:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Unqck4JCjQk8T49XLUDyOTykBWPgmm4JrVL+sL6bFtY=;
 b=c7owU6+E/f6aq9IrePpmGiw5O8RfL45hXrvW9oWfCaQvuuzyO4s2jw/+HJcxQ+tvWN
 Tc7F+zdIJZIvnZlV4jRYtR5sArZ4b9VWc19i6n0HDALo3lRpcnovYQyOTRKrGiih8SD+
 FPROr1kZztesCaVp7UMwyYvKN/nHHmDZiJMcjLRZLC28F5DC+2/txh8XVqqHh4jJMj4C
 xjzDi5F4c7m6226paQfTB6wtNDsNssWV9VtsRk65Iz+1mkX6nmpjtqjRvmK6G23QPcJJ
 HqSXY8C5Ln/MxQY+lYvVofWukJAda8gsRqRKdBqW2Bw/GTihBO4C2p7Q5bQcJu9l5DiN
 S3FQ==
X-Gm-Message-State: APjAAAUNPHxPGEF4TB8byNv2jDUIKRSlWzrkpf2oRTvyqcPdJgsy/98u
 7fiqjfwxnSf9WMUw92iFVOIqeRev
X-Google-Smtp-Source: APXvYqwScoKOTzgwHHTzmpDAhM16aMawX5GRbpe1Uzjc/fWSXvk2JvCcYfLiSYzxC/4hGH6Wa5rrLA==
X-Received: by 2002:ac8:252e:: with SMTP id 43mr55831742qtm.61.1563944423080; 
 Tue, 23 Jul 2019 22:00:23 -0700 (PDT)
Received: from localhost.localdomain ([71.51.160.180])
 by smtp.gmail.com with ESMTPSA id x23sm18524908qtp.37.2019.07.23.22.00.22
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 23 Jul 2019 22:00:22 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 1/9] drm/amdgpu: add an asic callback to determine the reset
 method
Date: Wed, 24 Jul 2019 00:00:04 -0500
Message-Id: <20190724050012.31398-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Unqck4JCjQk8T49XLUDyOTykBWPgmm4JrVL+sL6bFtY=;
 b=r7BJ+xb7qOw0hl7idxCh/BXbQ5eBj+cCk6qsrUGqN8VPZAk3rG01v141W6OKgdrJxa
 WUd8dO7bkoYojU2RLCNZwWJejt8kImwyShLi63bRaakLm4ueoClTO1xK5DITT7elO0wM
 HV+adrBGiRVSSvz0NlZOGfvLT+fw6RD8WuSQzF/s87BWbW4MtzeeTN7Xolhyk/DKy94D
 0Wyvte1E1YQbWwtiIk8qlkmnsZmEej5lA6uIsMFeo0Zme5E5Fye2oe5C0IBCaAKy7j2h
 /XoFuRjadC320OmiYi0vTTpwi3Et+Bx/7ofP/6uzecsqCve049hPCXeLVLbMkdZ0Wo+i
 yJ3w==
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

U29tZXRpbWVzIHRoZSBkcml2ZXIgbWF5IGhhdmUgdG8gYmVoYXZlIGRpZmZlcmVudGx5IGRlcGVu
ZGluZwpvbiB0aGUgbWV0aG9kIHdlIGFyZSB1c2luZyB0byByZXNldCB0aGUgR1BVLgoKU2lnbmVk
LW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgotLS0KIGRy
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdS5oIHwgMTAgKysrKysrKysrKwogMSBmaWxl
IGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHUuaCBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdS5o
CmluZGV4IDRiNTE0YTQ0MTg0Yy4uNmM0OWMyM2Y5OTYxIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHUuaAorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHUuaApAQCAtNTMyLDYgKzUzMiwxNCBAQCBzdHJ1Y3QgYW1kZ3B1X2FsbG93ZWRfcmVn
aXN0ZXJfZW50cnkgewogCWJvb2wgZ3JibV9pbmRleGVkOwogfTsKIAorZW51bSBhbWRfcmVzZXRf
bWV0aG9kIHsKKwlBTURfUkVTRVRfTUVUSE9EX0xFR0FDWSA9IDAsCisJQU1EX1JFU0VUX01FVEhP
RF9NT0RFMCwKKwlBTURfUkVTRVRfTUVUSE9EX01PREUxLAorCUFNRF9SRVNFVF9NRVRIT0RfTU9E
RTIsCisJQU1EX1JFU0VUX01FVEhPRF9CQUNPCit9OworCiAvKgogICogQVNJQyBzcGVjaWZpYyBm
dW5jdGlvbnMuCiAgKi8KQEAgLTU0Myw2ICs1NTEsNyBAQCBzdHJ1Y3QgYW1kZ3B1X2FzaWNfZnVu
Y3MgewogCQkJICAgICB1MzIgc2hfbnVtLCB1MzIgcmVnX29mZnNldCwgdTMyICp2YWx1ZSk7CiAJ
dm9pZCAoKnNldF92Z2Ffc3RhdGUpKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LCBib29sIHN0
YXRlKTsKIAlpbnQgKCpyZXNldCkoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpOworCWVudW0g
YW1kX3Jlc2V0X21ldGhvZCAoKnJlc2V0X21ldGhvZCkoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFk
ZXYpOwogCS8qIGdldCB0aGUgcmVmZXJlbmNlIGNsb2NrICovCiAJdTMyICgqZ2V0X3hjbGspKHN0
cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KTsKIAkvKiBNTSBibG9jayBjbG9ja3MgKi8KQEAgLTEx
MDksNiArMTExOCw3IEBAIGludCBlbXVfc29jX2FzaWNfaW5pdChzdHJ1Y3QgYW1kZ3B1X2Rldmlj
ZSAqYWRldik7CiAgKi8KICNkZWZpbmUgYW1kZ3B1X2FzaWNfc2V0X3ZnYV9zdGF0ZShhZGV2LCBz
dGF0ZSkgKGFkZXYpLT5hc2ljX2Z1bmNzLT5zZXRfdmdhX3N0YXRlKChhZGV2KSwgKHN0YXRlKSkK
ICNkZWZpbmUgYW1kZ3B1X2FzaWNfcmVzZXQoYWRldikgKGFkZXYpLT5hc2ljX2Z1bmNzLT5yZXNl
dCgoYWRldikpCisjZGVmaW5lIGFtZGdwdV9hc2ljX3Jlc2V0X21ldGhvZChhZGV2KSAoYWRldikt
PmFzaWNfZnVuY3MtPnJlc2V0X21ldGhvZCgoYWRldikpCiAjZGVmaW5lIGFtZGdwdV9hc2ljX2dl
dF94Y2xrKGFkZXYpIChhZGV2KS0+YXNpY19mdW5jcy0+Z2V0X3hjbGsoKGFkZXYpKQogI2RlZmlu
ZSBhbWRncHVfYXNpY19zZXRfdXZkX2Nsb2NrcyhhZGV2LCB2LCBkKSAoYWRldiktPmFzaWNfZnVu
Y3MtPnNldF91dmRfY2xvY2tzKChhZGV2KSwgKHYpLCAoZCkpCiAjZGVmaW5lIGFtZGdwdV9hc2lj
X3NldF92Y2VfY2xvY2tzKGFkZXYsIGV2LCBlYykgKGFkZXYpLT5hc2ljX2Z1bmNzLT5zZXRfdmNl
X2Nsb2NrcygoYWRldiksIChldiksIChlYykpCi0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1n
ZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
