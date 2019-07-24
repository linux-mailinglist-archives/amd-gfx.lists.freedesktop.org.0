Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 815767270E
	for <lists+amd-gfx@lfdr.de>; Wed, 24 Jul 2019 07:00:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A4E26E43B;
	Wed, 24 Jul 2019 05:00:26 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECD376E43B
 for <amd-gfx@lists.freedesktop.org>; Wed, 24 Jul 2019 05:00:24 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id 44so13226408qtg.11
 for <amd-gfx@lists.freedesktop.org>; Tue, 23 Jul 2019 22:00:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oCHzk+NhkzoY0N8hnGPa0ejAcbc4eVf9BYgTpr+RDWM=;
 b=UC1KMhFaz9nLl9U3yAVCycj1kpA5ZYR3TB4k3PusfVAeUFD3I+vUHcuymypc2Ndxo5
 WgXPx2jQ1kHKLRIE+37iNONLEGSgU9pbKXzWMaiZMkCwwWoZPH3IW1hle4L7k/1+rMHC
 9OE86NyfAJhmczySLc8TZO27VojEisZ6EzJVD3e9ZPCI2TUgYNtfPl6ZbzKy0b1TNf/g
 KACHc+XNBqtv3Bjuf4bNppNIA25DlEY65QMeic6aLEXBzrWLYYzrB1RNIt2RVdRiWAkh
 TQ0fhrna4hTe0WEqCgAKaxj8Um+fpzqHNmwKh2Elqdb592/ek374E2D7nt9mDnQnrSMu
 sRuQ==
X-Gm-Message-State: APjAAAVbtM/HjChaEy76krU86LTzwnPlFzqXBM3ewkZi51XzezC+5ifF
 b0xvn066hO8/V7U02Ws56qKTCyUz
X-Google-Smtp-Source: APXvYqyBqV6AK9Nu1N6WrHm2qRplcEb3n/uYtxOs3774OZeMJB+FdnTdX+MNWLWzPVDoST3a3N31ww==
X-Received: by 2002:ac8:26d5:: with SMTP id 21mr55401632qtp.266.1563944423793; 
 Tue, 23 Jul 2019 22:00:23 -0700 (PDT)
Received: from localhost.localdomain ([71.51.160.180])
 by smtp.gmail.com with ESMTPSA id x23sm18524908qtp.37.2019.07.23.22.00.23
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 23 Jul 2019 22:00:23 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 2/9] drm/amdgpu: add reset_method asic callback for si
Date: Wed, 24 Jul 2019 00:00:05 -0500
Message-Id: <20190724050012.31398-2-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190724050012.31398-1-alexander.deucher@amd.com>
References: <20190724050012.31398-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oCHzk+NhkzoY0N8hnGPa0ejAcbc4eVf9BYgTpr+RDWM=;
 b=J9zzsG22OpBwmuCvzCuLr9R4nyjk8a5WiNCnlhsbyqzkgMiPmoZoxxby6wTD8vgWzS
 lhvLl5L0WkkzjzdMmz5H7vrGxt8dzL9VydhPZoSSJPnj5cNdUOAukJcslgPjRNfOh9f8
 nfmITj9mYwVmo4Xgq7Us7kSVGvkMSpCYh13idEzVozasUFEwklOL51kOMItckM46Eg0l
 7q4XNngLc/2IcpY/pHmmAMkzas6cabWAWDQDfMgvOCp7OlI3S8JgByz3WtinrzIZtwu1
 P+lhz7uleu+06rrC6v7z9AUaJ5dVI+z2hEE00MfGThbDwxOFjh+afE53IfKFrWqSbLro
 DkJA==
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

U0kgYWx3YXlzIHVzZXMgdGhlIGxlZ2FjeSBwY2kgYmFzZWQgcmVzZXQuCgpTaWduZWQtb2ZmLWJ5
OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Ci0tLQogZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvc2kuYyB8IDcgKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDcgaW5z
ZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NpLmMg
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zaS5jCmluZGV4IDRiMWUwYzE2YWM0MS4uOTA0
MzYxNDUxNjUwIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zaS5jCisr
KyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NpLmMKQEAgLTExODUsNiArMTE4NSwxMiBA
QCBzdGF0aWMgaW50IHNpX2FzaWNfcmVzZXQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCiAJ
cmV0dXJuIDA7CiB9CiAKK3N0YXRpYyBlbnVtIGFtZF9yZXNldF9tZXRob2QKK3NpX2FzaWNfcmVz
ZXRfbWV0aG9kKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQoreworCXJldHVybiBBTURfUkVT
RVRfTUVUSE9EX0xFR0FDWTsKK30KKwogc3RhdGljIHUzMiBzaV9nZXRfY29uZmlnX21lbXNpemUo
c3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCiB7CiAJcmV0dXJuIFJSRUczMihtbUNPTkZJR19N
RU1TSVpFKTsKQEAgLTEzOTMsNiArMTM5OSw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgYW1kZ3B1
X2FzaWNfZnVuY3Mgc2lfYXNpY19mdW5jcyA9CiAJLnJlYWRfYmlvc19mcm9tX3JvbSA9ICZzaV9y
ZWFkX2Jpb3NfZnJvbV9yb20sCiAJLnJlYWRfcmVnaXN0ZXIgPSAmc2lfcmVhZF9yZWdpc3RlciwK
IAkucmVzZXQgPSAmc2lfYXNpY19yZXNldCwKKwkucmVzZXRfbWV0aG9kID0gJnNpX2FzaWNfcmVz
ZXRfbWV0aG9kLAogCS5zZXRfdmdhX3N0YXRlID0gJnNpX3ZnYV9zZXRfc3RhdGUsCiAJLmdldF94
Y2xrID0gJnNpX2dldF94Y2xrLAogCS5zZXRfdXZkX2Nsb2NrcyA9ICZzaV9zZXRfdXZkX2Nsb2Nr
cywKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
