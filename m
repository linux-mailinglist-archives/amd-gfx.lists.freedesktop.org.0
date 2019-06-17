Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CAE6549065
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:50:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 063196E05C;
	Mon, 17 Jun 2019 19:50:30 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F10656E057
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:50:19 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id s22so6974041qkj.12
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:50:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=X9ItltBEnUuInWppKQbxPyprCLo2pm5u4skhq3Yn1Yg=;
 b=OM6dTBw1TrXXNwf3i4cw4APsSKCgCYOMIuxsf516+qgSwsh3tyS80ZFA/r5TYfGoXI
 DT/793pFXABnnXLJ5wSwd0BLUZy5PSKmFq9TnSAYV0zQ01r2djDU3KelM3EpHL/QqLz8
 Qr6VH3rScCXOmuCZ58GkGJYsK2Ysb6VdXVRNXY44JEWE0+E3Lg/xCIMy7dgrkwsh35oW
 aawbj71GBKBX6LoIve0sZNBTVqL0AXbefnqd1ZoAS1NyRWDy5X47dt2s+wiCXd4KVnEV
 /OQmSkBjAOFiOthrB6HSygnJeo8y6JGAW5RirKiNuQEGNcT8Qk+TQGgtLeXvktBXZSVq
 mIaw==
X-Gm-Message-State: APjAAAW5+Sqxy/mWCzFveKnrToGCN5AJeX8JSxAx54t/qpbKg2Cal9Gy
 R23HB94l4gQbSiff38NsuOhQfPskd25sfw==
X-Google-Smtp-Source: APXvYqwqxkYDtpgmOoFZHDaR5WUMYx0Eni0c4TeJpxk6EGLHjhJIQJcVhNwsZMgA9THYkmCNY37DUw==
X-Received: by 2002:a05:620a:5a:: with SMTP id
 t26mr18518522qkt.201.1560801018886; 
 Mon, 17 Jun 2019 12:50:18 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id a51sm7520252qta.85.2019.06.17.12.50.18
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:50:18 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 422/459] drm/amd/display: add dsc_passthrough_support bit in
 dpcd struct
Date: Mon, 17 Jun 2019 14:49:11 -0500
Message-Id: <20190617194948.18667-23-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617194948.18667-1-alexander.deucher@amd.com>
References: <20190617194948.18667-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=X9ItltBEnUuInWppKQbxPyprCLo2pm5u4skhq3Yn1Yg=;
 b=SH0YKwv9KmCEAXwqxxDpf54Q9tDkc66Ci/wtygjEZX1FhGgtqoVP0O3RDywJuA9PvE
 kyVQDmXUxTJsgKo8/vStKgZi7LbJf0PMMj2RPhRCb/rRwqDY8fEzotDSFk9xyXr9vEcn
 /QJOhvbKACMqjNpUvosRpvBW/HnnqmE7p0n0kDx6qHCp40yoiVRnBo//YDr6vdnzLkt9
 W8g+LVZ1PfCFWmprpvHLNVW9TmpYYNGej3gtEa941XDQolsH/wIjH4S0zc/zJnxueiy6
 vS4hCOwHSUNQUPDJlALscIUR7i9K9PEiGdmAY0nFFE6O/H+0FbS08RWEH9oMcuzRcYOx
 wpdg==
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
Cc: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 Tony Cheng <Tony.Cheng@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 Wenjing Liu <Wenjing.Liu@amd.com>, Nikola Cornij <Nikola.Cornij@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogV2VuamluZyBMaXUgPFdlbmppbmcuTGl1QGFtZC5jb20+CgpTaWduZWQtb2ZmLWJ5OiBX
ZW5qaW5nIExpdSA8V2VuamluZy5MaXVAYW1kLmNvbT4KUmV2aWV3ZWQtYnk6IE5pa29sYSBDb3Ju
aWogPE5pa29sYS5Db3JuaWpAYW1kLmNvbT4KUmV2aWV3ZWQtYnk6IFRvbnkgQ2hlbmcgPFRvbnku
Q2hlbmdAYW1kLmNvbT4KQWNrZWQtYnk6IEJoYXdhbnByZWV0IExha2hhIDxCaGF3YW5wcmVldC5M
YWtoYUBhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVj
aGVyQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2luY2x1ZGUvZHBj
ZF9zdHJ1Y3RzLmggfCA2ICsrKy0tLQogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwg
MyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkv
aW5jbHVkZS9kcGNkX3N0cnVjdHMuaCBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9pbmNs
dWRlL2RwY2Rfc3RydWN0cy5oCmluZGV4IDZmNDE3ZTA0ODBlNi4uY2E5YzVlMGMwNjJmIDEwMDY0
NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvaW5jbHVkZS9kcGNkX3N0cnVjdHMu
aAorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvaW5jbHVkZS9kcGNkX3N0cnVjdHMu
aApAQCAtMzQsOSArMzQsOSBAQCBzdHJ1Y3QgZHBjZF9kc2NfYmFzaWNfY2FwYWJpbGl0aWVzIHsK
IAkJc3RydWN0IHsKIAkJCS8vIEJ5dGUgMAogCQkJc3RydWN0IHsKLQotCQkJCXVuc2lnbmVkIGNo
YXIgZHNjX3N1cHBvcnQJCQkJOjE7IC8vIEJpdDAKLQkJCQl1bnNpZ25lZCBjaGFyIHJlc2VydmVk
CQkJCQk6NzsKKwkJCQl1bnNpZ25lZCBjaGFyIGRzY19zdXBwb3J0CQk6MTsgLy8gQml0MAorCQkJ
CXVuc2lnbmVkIGNoYXIgZHNjX3Bhc3N0aHJvdWdoX3N1cHBvcnQJOjE7IC8vIEJpdDEKKwkJCQl1
bnNpZ25lZCBjaGFyIHJlc2VydmVkCQkJOjY7CiAJCQl9IGRzY19zdXBwb3J0OwogCiAJCQkvLyBC
eXRlIDEKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
