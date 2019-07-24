Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A69B872717
	for <lists+amd-gfx@lfdr.de>; Wed, 24 Jul 2019 07:00:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F0226E446;
	Wed, 24 Jul 2019 05:00:37 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CD1B6E440
 for <amd-gfx@lists.freedesktop.org>; Wed, 24 Jul 2019 05:00:26 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id h21so44193702qtn.13
 for <amd-gfx@lists.freedesktop.org>; Tue, 23 Jul 2019 22:00:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=T6ycn0jaUTopQ622GQ6LWmKC6a5u4eGJ+d9YI5rEwOk=;
 b=KaozfwE1pRNiy1oFyLEaxFjh5O/5M94gL/Pa0gP1Ir/+HWFv0KaZyyoXb6AzNv2Tf1
 pHUyl2YouiOKRoMjxCVdHV+WIYusELHQeYixfn17uP+SX0G67vQxrryw+Rzv751z/AVd
 m2o03zcN67ts8xKPvCpnLnFMHz9VmazL9JpRdhHqKYctV3ZWKeMr639t1CGTKpxQL6ai
 VlRpPPAX2SRLv+yZdcSV9hKOiP4Ge+uKNMSciJt9xzg902Fz5uHK8sM7Qx+2CHPoB1Qc
 dezOKBu/JN99GExNCKwNZf4P/BmtgAYeGrYZCjDePDP2szfGjnYKrP4gEZMHTFv0j/aP
 Uf6A==
X-Gm-Message-State: APjAAAUV3u/b4ls+B0rvgZBM8Mkw4E+0An6MRA3tIopZFM/vAvuVI6PW
 MvTn7iPvHWnHIgmnRdsBq6U+1oZv
X-Google-Smtp-Source: APXvYqz2nSpfGkSUmsJdjhqDWP3VJTJpPw/m/eOzoAcMRBfKfBjPdwukYl+wn8qwVoEsbHrTVjfgvA==
X-Received: by 2002:aed:33e6:: with SMTP id v93mr56638065qtd.157.1563944425313; 
 Tue, 23 Jul 2019 22:00:25 -0700 (PDT)
Received: from localhost.localdomain ([71.51.160.180])
 by smtp.gmail.com with ESMTPSA id x23sm18524908qtp.37.2019.07.23.22.00.24
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 23 Jul 2019 22:00:24 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 4/9] drm/amdgpu: add reset_method asic callback for vi
Date: Wed, 24 Jul 2019 00:00:07 -0500
Message-Id: <20190724050012.31398-4-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190724050012.31398-1-alexander.deucher@amd.com>
References: <20190724050012.31398-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=T6ycn0jaUTopQ622GQ6LWmKC6a5u4eGJ+d9YI5rEwOk=;
 b=b6MBem+lUgDfTW61NrqjOYZXfWM5LPapPVdgoTqWLs+txAZnFwZ9pmN0PyuT2uHkot
 EC3RoNDsNOuCyDfafTuPxbeVFKspAhoKX6dcRpG1xwpk1D9SHhthIiqoRdDHr5QE4+CQ
 xcJfx0jPtxRJLqTgcDWCxXCrAi4o/dCHU1kiFDVoc01fcRyvfIGcJ9px/96Ql/yVn4V6
 9+1IS/856LmK4tJTL2h7ry7RZ67QFhKYPNsflr5PEF4DUl9HRmh22XfDOhklizfTCSEW
 FQ+Uk7bef2WXZuWQ70QJqGyKx/pdp2rdpzXX6/wTKudAQM4zEilPASy/xbDIMQXyYYAI
 xQ6A==
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

VkkgYWx3YXlzIHVzZXMgdGhlIGxlZ2FjeSBwY2kgYmFzZWQgcmVzZXQuCgpTaWduZWQtb2ZmLWJ5
OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Ci0tLQogZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvdmkuYyB8IDcgKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDcgaW5z
ZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3ZpLmMg
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS92aS5jCmluZGV4IGZmZmFlNGMyOTczYi4uNTZj
ODgyYjNlYTNjIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS92aS5jCisr
KyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3ZpLmMKQEAgLTcwOSw2ICs3MDksMTIgQEAg
c3RhdGljIGludCB2aV9hc2ljX3Jlc2V0KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQogCXJl
dHVybiByOwogfQogCitzdGF0aWMgZW51bSBhbWRfcmVzZXRfbWV0aG9kCit2aV9hc2ljX3Jlc2V0
X21ldGhvZChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKK3sKKwlyZXR1cm4gQU1EX1JFU0VU
X01FVEhPRF9MRUdBQ1k7Cit9CisKIHN0YXRpYyB1MzIgdmlfZ2V0X2NvbmZpZ19tZW1zaXplKHN0
cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQogewogCXJldHVybiBSUkVHMzIobW1DT05GSUdfTUVN
U0laRSk7CkBAIC0xMDIxLDYgKzEwMjcsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGFtZGdwdV9h
c2ljX2Z1bmNzIHZpX2FzaWNfZnVuY3MgPQogCS5yZWFkX2Jpb3NfZnJvbV9yb20gPSAmdmlfcmVh
ZF9iaW9zX2Zyb21fcm9tLAogCS5yZWFkX3JlZ2lzdGVyID0gJnZpX3JlYWRfcmVnaXN0ZXIsCiAJ
LnJlc2V0ID0gJnZpX2FzaWNfcmVzZXQsCisJLnJlc2V0X21ldGhvZCA9ICZ2aV9hc2ljX3Jlc2V0
X21ldGhvZCwKIAkuc2V0X3ZnYV9zdGF0ZSA9ICZ2aV92Z2Ffc2V0X3N0YXRlLAogCS5nZXRfeGNs
ayA9ICZ2aV9nZXRfeGNsaywKIAkuc2V0X3V2ZF9jbG9ja3MgPSAmdmlfc2V0X3V2ZF9jbG9ja3Ms
Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
