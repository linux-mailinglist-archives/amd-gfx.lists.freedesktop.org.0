Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C0CD7E435
	for <lists+amd-gfx@lfdr.de>; Thu,  1 Aug 2019 22:30:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39F746E7F5;
	Thu,  1 Aug 2019 20:30:34 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61C3D6E7EC
 for <amd-gfx@lists.freedesktop.org>; Thu,  1 Aug 2019 20:30:31 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id g18so53100460qkl.3
 for <amd-gfx@lists.freedesktop.org>; Thu, 01 Aug 2019 13:30:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MEVLRTnWiHvnbi4zu9M5IPki/v4cfCVKfYodCrtKcLA=;
 b=kGsPDgE1IRrh2BmYmUyeLWb6veA+3vSCEz7Jf4X9TYSbKHyT+B3CHiTk2xTaf2Ftad
 sNrHVe+qDUnfeMw/pK4YSBIONxisyvEHGH+H6dZJJbvlqwa3i3hoh+e4SfyUmlA+//Ue
 6Up+Lalpsl1V3JErUZhSEuM0k6puor35s5BYQpPp4YslSWM26kBHrcUEinZCRp+gPIdF
 DL8sj8M8wR1lorcrwJouiIQrAaSKiVYaxloQoksQ8nSmvBwf5rD04oy/71Wuv3X3w67h
 R4ggVi6ZgFHo7YJAQraEAeQjh8hU6wgaqq8Fk+qjEoKTWG9Ioa23a7xZCJkFumaT/9YK
 H6xA==
X-Gm-Message-State: APjAAAWVFszU0Ni6/Ihaah5QBZNsphEDw6S+cLUpEQ2LmbvfsNXoED+Y
 SujV3L9VfE9twEMI2GPggaC++Hwc
X-Google-Smtp-Source: APXvYqy3bJpXozx48kj/GdczSeCPBr1wKFqaK+wJrXl4gIGm+bRtAP5rElfbZxpqcBaNxzjW53rjiQ==
X-Received: by 2002:a05:620a:1292:: with SMTP id
 w18mr87482803qki.416.1564691430301; 
 Thu, 01 Aug 2019 13:30:30 -0700 (PDT)
Received: from localhost.localdomain ([71.219.6.100])
 by smtp.gmail.com with ESMTPSA id c20sm25129315qkk.69.2019.08.01.13.30.29
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 01 Aug 2019 13:30:29 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 28/36] drm/amdgpu: add smu ip block for navi12
Date: Thu,  1 Aug 2019 15:29:49 -0500
Message-Id: <20190801202957.29791-29-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190801202957.29791-1-alexander.deucher@amd.com>
References: <20190801202957.29791-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MEVLRTnWiHvnbi4zu9M5IPki/v4cfCVKfYodCrtKcLA=;
 b=itfFfpPrwaMknwNSnAbzPRMBmeGZGMVqkeC5lMIImNYu8fDLOIDJSXqwOHqrZKKh5C
 q9KOAvgWI7pnYbXykgHTsYWI44Ze72ZxQmRV2DQP0dDlm9OCvqegS+GHICnKh0KhrlOC
 OAVSjxPV+gI/QRLhgGdQ1GEBSjEBLii0W7nKlD2RVyAQWIZXjMMcO3vyFjtYqv+pYpx2
 ealKzmJaBgzzESZJG/5RUYxufX503rjkOysYKFDZQjL3bd4CMK3Evph7rAP4HO87j5zL
 FdlDONbP3uaHii09IC0NpN7jdj/olf7LQ0WWJWn5b2eqmDPcaF5jzYkW49ftjeCkPSkR
 TUBQ==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Jack Xiao <Jack.Xiao@amd.com>,
 Xiaojie Yuan <xiaojie.yuan@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogWGlhb2ppZSBZdWFuIDx4aWFvamllLnl1YW5AYW1kLmNvbT4KClNpZ25lZC1vZmYtYnk6
IFhpYW9qaWUgWXVhbiA8eGlhb2ppZS55dWFuQGFtZC5jb20+ClJldmlld2VkLWJ5OiBKYWNrIFhp
YW8gPEphY2suWGlhb0BhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhh
bmRlci5kZXVjaGVyQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvbnYu
YyB8IDYgKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvbnYuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L252LmMKaW5kZXggYjI5MzUyOTI0YmQ0Li44N2RjNTk1NDY3NzEgMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L252LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvbnYuYwpAQCAtNDI1LDEwICs0MjUsMTYgQEAgaW50IG52X3NldF9pcF9ibG9ja3Mo
c3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCiAJCWFtZGdwdV9kZXZpY2VfaXBfYmxvY2tfYWRk
KGFkZXYsICZudl9jb21tb25faXBfYmxvY2spOwogCQlhbWRncHVfZGV2aWNlX2lwX2Jsb2NrX2Fk
ZChhZGV2LCAmZ21jX3YxMF8wX2lwX2Jsb2NrKTsKIAkJYW1kZ3B1X2RldmljZV9pcF9ibG9ja19h
ZGQoYWRldiwgJm5hdmkxMF9paF9pcF9ibG9jayk7CisJCWlmIChhZGV2LT5maXJtd2FyZS5sb2Fk
X3R5cGUgPT0gQU1ER1BVX0ZXX0xPQURfUFNQICYmCisJCSAgICBpc19zdXBwb3J0X3N3X3NtdShh
ZGV2KSkKKwkJCWFtZGdwdV9kZXZpY2VfaXBfYmxvY2tfYWRkKGFkZXYsICZzbXVfdjExXzBfaXBf
YmxvY2spOwogCQlpZiAoYWRldi0+ZW5hYmxlX3ZpcnR1YWxfZGlzcGxheSB8fCBhbWRncHVfc3Jp
b3ZfdmYoYWRldikpCiAJCQlhbWRncHVfZGV2aWNlX2lwX2Jsb2NrX2FkZChhZGV2LCAmZGNlX3Zp
cnR1YWxfaXBfYmxvY2spOwogCQlhbWRncHVfZGV2aWNlX2lwX2Jsb2NrX2FkZChhZGV2LCAmZ2Z4
X3YxMF8wX2lwX2Jsb2NrKTsKIAkJYW1kZ3B1X2RldmljZV9pcF9ibG9ja19hZGQoYWRldiwgJnNk
bWFfdjVfMF9pcF9ibG9jayk7CisJCWlmIChhZGV2LT5maXJtd2FyZS5sb2FkX3R5cGUgPT0gQU1E
R1BVX0ZXX0xPQURfRElSRUNUICYmCisJCSAgICBpc19zdXBwb3J0X3N3X3NtdShhZGV2KSkKKwkJ
CWFtZGdwdV9kZXZpY2VfaXBfYmxvY2tfYWRkKGFkZXYsICZzbXVfdjExXzBfaXBfYmxvY2spOwog
CQlicmVhazsKIAlkZWZhdWx0OgogCQlyZXR1cm4gLUVJTlZBTDsKLS0gCjIuMjAuMQoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5n
IGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
