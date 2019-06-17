Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E0EA549001
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:46:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2880189E2C;
	Mon, 17 Jun 2019 19:46:42 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com
 [IPv6:2607:f8b0:4864:20::72b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 035D289E38
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:46:36 +0000 (UTC)
Received: by mail-qk1-x72b.google.com with SMTP id l128so6999839qke.2
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:46:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=H7jRtaqu+RbVa/0eNy0xLgB67gbzD99AY4u0sxHXI30=;
 b=FWqbT99/muJwqzHY0uYoBE0mL5ILAZfDIaDRq6xPcWggOWbjbZOGoeLkQEBTeBKkLG
 /SpuKeexZXPUH0xn23tQaf/B+gsT72FXlPLEkwdePeqzQr6WCh7BBYm6UwjOk+r5yw7L
 H1mtrlopMO+NeaKujxnKcqwYuTw23WrM0faxFW1x6qzHpZKS2Ihyho4dD7iidZ/crRXo
 2xZld9toNVTZChWSv25tThiiRbBuN2ETv1ngzLvgYhtXVNXZ3FXiJYrMrlMLlnQMUHjA
 Pdx8I6yMn85fInYeGWsNOUXqfASeGDQ2ml9Zpi/cQRm76/GlLMGoR/GHn8badYqlYCH6
 CWQw==
X-Gm-Message-State: APjAAAXlvld8MpJJJ3P7kG1CdK9YZCz/YvnnvRd4Pm2HYdLxd22pR0F0
 YQggXrMc/CS28it+leYNnXj23D44PDM=
X-Google-Smtp-Source: APXvYqwmrmxpubmFlk23sGO4TSVFolDSvnxDSSAWQ37MEdqm9LGV3PRaPAgGzCBoctIjdlSAqs0WYA==
X-Received: by 2002:a05:620a:1456:: with SMTP id
 i22mr66329973qkl.170.1560800794827; 
 Mon, 17 Jun 2019 12:46:34 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id u4sm6559420qkb.16.2019.06.17.12.46.34
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:46:34 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 339/459] drm/amd/display: updates for dcn20_update_bandwidth
Date: Mon, 17 Jun 2019 14:44:40 -0500
Message-Id: <20190617194540.18497-40-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617194540.18497-1-alexander.deucher@amd.com>
References: <20190617194540.18497-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=H7jRtaqu+RbVa/0eNy0xLgB67gbzD99AY4u0sxHXI30=;
 b=h8mIzVtul+2E3qB3unB+pcGHfP+NtCNbfabE7+AtqTDytxNNy+hUaovN6Q0j+Ngadh
 IdCXlC1xnyoaY/hb0X5yIP/QExNbrZ2ygeyLvd6VJUTnJ2ye1rUMgREAVbKh/u1L9y9m
 wbgyOzy9EA7Gp//TEcHdXQAR0KEo5UuO5xgsnruF4uoOamQnEAFk2sKI09rD9aSvcXtL
 j9aAx9YVz29reXKjMoU7EOfrj2z0hLi0WoMlPsvz/q1RvX/YPHfgEZLS1RxBPq5y0Mlz
 DprB4J4w05xs0vJIKMR64GLdIS6jRWTJfHx0o60kor/v4ZXeRCPiymIv7GtnOxHFsE6B
 xrMw==
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

UGFzcyBleHRyYSBwYXJhbWV0ZXIgdG8gdmFsaWRhdGVfYmFuZHdpZHRoKCkgY2FsbGJhY2suCgpT
aWduZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Ci0t
LQogZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIwX2h3c2VxLmMgfCAy
ICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjAvZGNuMjBfaHdzZXEu
YyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9kY24yMF9od3NlcS5jCmlu
ZGV4IDQ4N2EwN2NiZWI5My4uM2Q1ZWIyMGVhOWJhIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjAvZGNuMjBfaHdzZXEuYworKysgYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjAvZGNuMjBfaHdzZXEuYwpAQCAtMTM0NSw3ICsxMzQ1LDcg
QEAgYm9vbCBkY24yMF91cGRhdGVfYmFuZHdpZHRoKAogCWludCBpOwogCiAJLyogcmVjYWxjdWxh
dGUgRE1MIHBhcmFtZXRlcnMgKi8KLQlpZiAoIWRjLT5yZXNfcG9vbC0+ZnVuY3MtPnZhbGlkYXRl
X2JhbmR3aWR0aChkYywgY29udGV4dCkpIHsKKwlpZiAoIWRjLT5yZXNfcG9vbC0+ZnVuY3MtPnZh
bGlkYXRlX2JhbmR3aWR0aChkYywgY29udGV4dCwgZmFsc2UpKSB7CiAJCXJldHVybiBmYWxzZTsK
IAl9CiAKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
