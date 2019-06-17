Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AA6948F5B
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:32:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AB0789C25;
	Mon, 17 Jun 2019 19:31:58 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D28D289C25
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:31:50 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id w17so5830187qto.10
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:31:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2opl8fWfERK/KVKyATkcrbdFdkWwrwkSptZkcMnNSPc=;
 b=PDRiTDU+W+l3vqFeXDa28E6zpPTws/609c92U4ko9MB54hnf0XRyrpymXs89kDe2se
 uHNI5bgDa48bSSDxhUDv/7l8H4zbX6bfr7MEIJX27w79vmN1PsLIzPxvtdwXvMVOkRQd
 HrTc7+Iv80BbmoUZkNoRQN2c8PZhzeC9Q7ASFH0swP1Dmel0L4eJyQmelaNHI0WOZsoD
 5CxJOBjYrDpfTvCLJmYHHXkeuvzyhlS53VrHw+8i/G6FbnzhOEvynMWEjl5nKF5q77Gr
 PP+qVkXF4p5a7GjyltAwRotCGbAQk76abKG4f4ZMc+bSA9phJN9o/ryMZatl2vXX85Y0
 p4jw==
X-Gm-Message-State: APjAAAXnxcHEnA/bLBTcIfRom7eTWu3mv7lmLktAD8l431TOUzOStV7l
 SKi6gOpwggwss0VnjhH46/Tq1x59LE4=
X-Google-Smtp-Source: APXvYqzjlBqYWp1IRzscB8g3Cl/3AW+T7Amm6VDAasDLJ4lfrD5pmb8oTvM6seuNEvWlqNBUfcIlhA==
X-Received: by 2002:ac8:2642:: with SMTP id v2mr28572663qtv.333.1560799909739; 
 Mon, 17 Jun 2019 12:31:49 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id u2sm7474875qtj.97.2019.06.17.12.31.48
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:31:49 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 240/459] drm/amd/powerplay: add function get_gpu_power for
 navi10
Date: Mon, 17 Jun 2019 14:30:07 -0500
Message-Id: <20190617193106.18231-41-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617193106.18231-1-alexander.deucher@amd.com>
References: <20190617193106.18231-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2opl8fWfERK/KVKyATkcrbdFdkWwrwkSptZkcMnNSPc=;
 b=I5K5Yb/rapGTTp+Rt/Bmu7H1jQmqDUjGrcT7dAqRUJRz6LuzK1LbNmylJIj+Rt0//u
 mPCx01ixc/+3cvuEFSvsEzW1kOAJ4QQIRfOSP7zws05EhcFx2Ffio7g1O4lc0jAzbxS7
 sxpCZexZjw3CkwOFPE+WzW1S4Mdw1/iBoHxFA6a0ER2G9wEjRUEmRktVs8MoeH7FL30Q
 gUanSQHnIDS6JY/pKr17zKlfnK3i6F0RNxJ+l5U9ta1GAyRiORuAtSJ3UhnOcQ3m+i62
 8s+fowsvcG6KW13vvGGh6wj+KCNL3CkJb4X/3njw9hPeBlFB4bPkGvp6NBs+4GdUp39z
 mt2A==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Kevin Wang <kevin1.wang@amd.com>,
 Huang Rui <ray.huang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogS2V2aW4gV2FuZyA8a2V2aW4xLndhbmdAYW1kLmNvbT4KCmFkZCBjYWxsYmFjayBmdW5j
dGlvbiBnZXRfZ3B1X3Bvd2VyIGZvciBuYXZpMTAgYXNpYwoKU2lnbmVkLW9mZi1ieTogS2V2aW4g
V2FuZyA8a2V2aW4xLndhbmdAYW1kLmNvbT4KUmV2aWV3ZWQtYnk6IEh1YW5nIFJ1aSA8cmF5Lmh1
YW5nQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNo
ZXJAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9uYXZpMTBfcHB0
LmMgfCAxOSArKysrKysrKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMTkgaW5zZXJ0aW9u
cygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L25hdmkxMF9w
cHQuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L25hdmkxMF9wcHQuYwppbmRleCAy
MmI2YWU5MzEzN2MuLmUyMWExZWFlZThiOSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9wb3dlcnBsYXkvbmF2aTEwX3BwdC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJw
bGF5L25hdmkxMF9wcHQuYwpAQCAtNzQ5LDYgKzc0OSwyNCBAQCBzdGF0aWMgaW50IG5hdmkxMF91
bmZvcmNlX2RwbV9sZXZlbHMoc3RydWN0IHNtdV9jb250ZXh0ICpzbXUpIHsKIAlyZXR1cm4gcmV0
OwogfQogCitzdGF0aWMgaW50IG5hdmkxMF9nZXRfZ3B1X3Bvd2VyKHN0cnVjdCBzbXVfY29udGV4
dCAqc211LCB1aW50MzJfdCAqdmFsdWUpCit7CisJaW50IHJldCA9IDA7CisJU211TWV0cmljc190
IG1ldHJpY3M7CisKKwlpZiAoIXZhbHVlKQorCQlyZXR1cm4gLUVJTlZBTDsKKworCXJldCA9IHNt
dV91cGRhdGVfdGFibGUoc211LCBTTVVfVEFCTEVfU01VX01FVFJJQ1MsICh2b2lkICopJm1ldHJp
Y3MsCisJCQkgICAgICAgZmFsc2UpOworCWlmIChyZXQpCisJCXJldHVybiByZXQ7CisKKwkqdmFs
dWUgPSBtZXRyaWNzLkN1cnJTb2NrZXRQb3dlciA8PCA4OworCisJcmV0dXJuIDA7Cit9CisKIHN0
YXRpYyBjb25zdCBzdHJ1Y3QgcHB0YWJsZV9mdW5jcyBuYXZpMTBfcHB0X2Z1bmNzID0gewogCS50
YWJsZXNfaW5pdCA9IG5hdmkxMF90YWJsZXNfaW5pdCwKIAkuYWxsb2NfZHBtX2NvbnRleHQgPSBu
YXZpMTBfYWxsb2NhdGVfZHBtX2NvbnRleHQsCkBAIC03NzIsNiArNzkwLDcgQEAgc3RhdGljIGNv
bnN0IHN0cnVjdCBwcHRhYmxlX2Z1bmNzIG5hdmkxMF9wcHRfZnVuY3MgPSB7CiAJLmRpc3BsYXlf
Y29uZmlnX2NoYW5nZWQgPSBuYXZpMTBfZGlzcGxheV9jb25maWdfY2hhbmdlZCwKIAkuZm9yY2Vf
ZHBtX2xpbWl0X3ZhbHVlID0gbmF2aTEwX2ZvcmNlX2RwbV9saW1pdF92YWx1ZSwKIAkudW5mb3Jj
ZV9kcG1fbGV2ZWxzID0gbmF2aTEwX3VuZm9yY2VfZHBtX2xldmVscywKKwkuZ2V0X2dwdV9wb3dl
ciA9IG5hdmkxMF9nZXRfZ3B1X3Bvd2VyLAogfTsKIAogdm9pZCBuYXZpMTBfc2V0X3BwdF9mdW5j
cyhzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSkKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdm
eEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9hbWQtZ2Z4
