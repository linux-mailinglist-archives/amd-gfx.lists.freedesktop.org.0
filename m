Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4258351020
	for <lists+amd-gfx@lfdr.de>; Mon, 24 Jun 2019 17:16:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B023989C60;
	Mon, 24 Jun 2019 15:16:02 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A69D389C5E
 for <amd-gfx@lists.freedesktop.org>; Mon, 24 Jun 2019 15:15:59 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id x25so13016608ljh.2
 for <amd-gfx@lists.freedesktop.org>; Mon, 24 Jun 2019 08:15:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gvmIwjp1XBeUHeC/yZ46MZ0CarCpCwxeFYQ+2lBAgU0=;
 b=r0cB9dGjW71DhwrIsufOsmwwQEUpYjuh8wbp+dl82ijrqfa7ie4mXwApPfIK+AaGbW
 nnAk5k96qShJOUXhQALvYH8oc1SSCLwEGH9YbCNn8bWvM5SBx2pKgVGFPw5jDPZXT9fd
 mOXePVAmFvnZYjhF2C3FSbUMuBsWpqpXjSVCIDPqFfMhTmmBl+p1zoPSTu5gajhH4ROd
 zlYCOW3Vby7L/YOr4riTLmRPPaC0Y7vIIOhHHMS/0g28TAqFpzSanu/BSslTMpb3DpAz
 xswQmAHXHlE/oJhx8nK1UecMYgpQld0K7zUMfjwNr7uRk6fvifbyKk72iqV7ZQMgF5zq
 0A8A==
X-Gm-Message-State: APjAAAWSqxxgyRVEKH3oT91M9tB/0Q6gqya73uk74e6KmFTaCU0Ntkg+
 xMwTkqbWAcPJqpIpouiycQwIJs6XM5k=
X-Google-Smtp-Source: APXvYqz9s5mVmHiKuskJeNn/LvEdZTIA19mEcWX225Bknnvdpna97QLm1hv+qqdsHD4Uz0c+8HgxHw==
X-Received: by 2002:a2e:970a:: with SMTP id r10mr21665898lji.115.1561389357734; 
 Mon, 24 Jun 2019 08:15:57 -0700 (PDT)
Received: from localhost.localdomain ([188.151.232.219])
 by smtp.googlemail.com with ESMTPSA id u18sm1797201ljj.32.2019.06.24.08.15.56
 for <amd-gfx@lists.freedesktop.org>
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 24 Jun 2019 08:15:57 -0700 (PDT)
From: =?UTF-8?q?Ernst=20Sj=C3=B6strand?= <ernstp@gmail.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 6/6] drm/amd/amdgpu: sdma_v4_0_start: initialize r
Date: Mon, 24 Jun 2019 17:15:44 +0200
Message-Id: <20190624151544.13934-6-ernstp@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190624151544.13934-1-ernstp@gmail.com>
References: <20190624151544.13934-1-ernstp@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=gvmIwjp1XBeUHeC/yZ46MZ0CarCpCwxeFYQ+2lBAgU0=;
 b=SyEXVBb7kq8asMcWVuLB+EGqH/Hpe3NoX+dFjdG6WDyG1vHIsT/UP/RHS0/ttDnG2N
 CNrezug0SRKq4MPtMUWeQmgabAkAOz6pSdPiDf0r4nQ8x9vy0tj2s8ojULEFoIo4Ruco
 QGgrvDCOg/m+gLIgCSBqsTqPg3v9I4fvwsuH6ebyqM3rAj7NJXY+ILA8zo61J59vDDuZ
 3fIi+ZkV6G177BgdyS07SGagMOO+aL7tO5dyE3kAFkuJNcJE4DbCVhyrqIirpnvtx69D
 LdyuPLRMj8gpPdL7oLaDOwXkaNGFFOU2+tEYN1EMgv9ON0j8rGyJHQDvcpjHXSPyqeKo
 qQSw==
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

UmVwb3J0ZWQgYnkgc21hdGNoOgpkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zZG1hX3Y0XzAu
YzoxMTY3IHNkbWFfdjRfMF9zdGFydCgpIGVycm9yOiB1bmluaXRpYWxpemVkIHN5bWJvbCAncicu
CgpTaWduZWQtb2ZmLWJ5OiBFcm5zdCBTasO2c3RyYW5kIDxlcm5zdHBAZ21haWwuY29tPgotLS0K
IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NkbWFfdjRfMC5jIHwgMiArLQogMSBmaWxlIGNo
YW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvc2RtYV92NF8wLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9zZG1hX3Y0XzAuYwppbmRleCBjMGI2MDExYjRiZDEuLjllNTcxY2EyODNjMyAxMDA2NDQK
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc2RtYV92NF8wLmMKKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvc2RtYV92NF8wLmMKQEAgLTEwOTIsNyArMTA5Miw3IEBAIHN0
YXRpYyBpbnQgc2RtYV92NF8wX2xvYWRfbWljcm9jb2RlKHN0cnVjdCBhbWRncHVfZGV2aWNlICph
ZGV2KQogc3RhdGljIGludCBzZG1hX3Y0XzBfc3RhcnQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFk
ZXYpCiB7CiAJc3RydWN0IGFtZGdwdV9yaW5nICpyaW5nOwotCWludCBpLCByOworCWludCBpLCBy
ID0gMDsKIAogCWlmIChhbWRncHVfc3Jpb3ZfdmYoYWRldikpIHsKIAkJc2RtYV92NF8wX2N0eF9z
d2l0Y2hfZW5hYmxlKGFkZXYsIGZhbHNlKTsKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdm
eEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9hbWQtZ2Z4
