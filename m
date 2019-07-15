Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F78E69E25
	for <lists+amd-gfx@lfdr.de>; Mon, 15 Jul 2019 23:25:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D01289F08;
	Mon, 15 Jul 2019 21:25:33 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B292389F08
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 21:25:30 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id a15so17248792qtn.7
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 14:25:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=svw9J+d1KvCLp2g1/m0M77pzjQy81v3qFQOucZVkvQI=;
 b=b/i0YqBbJlCfj7F19QL9fcUDUtpvHByYbEED1IsJdN0WIrO/zkYocdeQGColWvkaA6
 5jqE55AAUBVmFkZFAQriugTfNlAYz+nXzVhgeZupZ8oOTAQ0AEa2tpR0I/PWzW9XyX+7
 N+27uJ1iuKEkTAbIVpkwai+uvQL/Bzp1hXOo12lgqukaJbLq5oSej86tEbPM+UO7Hfkm
 peBh/mIXqPPGiJtZLqfDYSiNtNuA4yr1UXS4MQ3JHc813Ksf4K2YSW/CnBxQTxL9UKVf
 Cv70MhzxQf5GkBeL+AQTG7qeFRcOvCM4GiN1pxyqczHId0I/RI3E+YBPLInlWAV+uC1q
 ms+w==
X-Gm-Message-State: APjAAAXm+2sXgdvG2Y0voIVfBaaA3NoWLRPAOioY0zz69vt+qlzL6NIh
 jtMjgifQUUax2fOKH7nif8WTxPq6
X-Google-Smtp-Source: APXvYqyV2Y4FXOoQYNF0MUmWhlXGgmZvCtkpV6BRLVqIM8/6Dv+Dx6WdpwQlZ3VHHQyfSmhhVDbx/A==
X-Received: by 2002:a0c:c96a:: with SMTP id v39mr20385962qvj.121.1563225929342; 
 Mon, 15 Jul 2019 14:25:29 -0700 (PDT)
Received: from localhost.localdomain ([71.219.21.119])
 by smtp.gmail.com with ESMTPSA id q56sm10274133qtq.64.2019.07.15.14.25.28
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 15 Jul 2019 14:25:28 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 050/102] drm/amdgpu: Set VM_L2_CNTL.PDE_FAULT_CLASSIFICATION
 to 0 for MMHUB 9.4
Date: Mon, 15 Jul 2019 16:23:45 -0500
Message-Id: <20190715212437.31793-48-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190715212437.31793-1-alexander.deucher@amd.com>
References: <20190715212437.31793-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=svw9J+d1KvCLp2g1/m0M77pzjQy81v3qFQOucZVkvQI=;
 b=bBqsMc9KU1yNfnckBKJOw7Enh/2t9stix/UO9cf14FYck57mow/f+SFuls2BuPEn4K
 uYj0/4YQ9Obxa/j6IizOEvaU9SJIIheZ6IpNlJX40EtDebcCl4fIFq1xiXDBpcEvDl1+
 +yLPMej54Um1K/sZo5Kzdul3AzjrOxphzWFpiAbpJnRCiwke3hxa4ZwiEm/Iu//Q9MXD
 D8Uq9Yw9aEDm6cvLCBwAwWejrUawCk4epkba1t3at0bCtCinzKUAsChQksGXcrVmW2Md
 IhfUkLMVf3vhDAKXzmn74Cz0j2xx6+QKdqu3mLfbVudk47WRN+GgSgWpoM1x44A5Xmt4
 FIbg==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Yong Zhao <Yong.Zhao@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogWW9uZyBaaGFvIDxZb25nLlpoYW9AYW1kLmNvbT4KClNpZ25lZC1vZmYtYnk6IFlvbmcg
WmhhbyA8WW9uZy5aaGFvQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxl
eGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9t
bWh1Yl92OV80LmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVs
ZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9tbWh1Yl92
OV80LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9tbWh1Yl92OV80LmMKaW5kZXggN2Y3
OWZhNGI2YWQxLi42YjdjZGFhZGJkNzAgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L21taHViX3Y5XzQuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9tbWh1
Yl92OV80LmMKQEAgLTE5NSw3ICsxOTUsNyBAQCBzdGF0aWMgdm9pZCBtbWh1Yl92OV80X2luaXRf
Y2FjaGVfcmVncyhzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwgaW50IGh1YmlkKQogCXRtcCA9
IFJFR19TRVRfRklFTEQodG1wLCBWTUwyUEYwX1ZNX0wyX0NOVEwsCiAJCQkgICAgTDJfUERFMF9D
QUNIRV9UQUdfR0VORVJBVElPTl9NT0RFLCAwKTsKIAl0bXAgPSBSRUdfU0VUX0ZJRUxEKHRtcCwg
Vk1MMlBGMF9WTV9MMl9DTlRMLAotCQkJICAgIFBERV9GQVVMVF9DTEFTU0lGSUNBVElPTiwgMSk7
CisJCQkgICAgUERFX0ZBVUxUX0NMQVNTSUZJQ0FUSU9OLCAwKTsKIAl0bXAgPSBSRUdfU0VUX0ZJ
RUxEKHRtcCwgVk1MMlBGMF9WTV9MMl9DTlRMLAogCQkJICAgIENPTlRFWFQxX0lERU5USVRZX0FD
Q0VTU19NT0RFLCAxKTsKIAl0bXAgPSBSRUdfU0VUX0ZJRUxEKHRtcCwgVk1MMlBGMF9WTV9MMl9D
TlRMLAotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
