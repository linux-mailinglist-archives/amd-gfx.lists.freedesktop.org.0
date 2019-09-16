Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 41100B403B
	for <lists+amd-gfx@lfdr.de>; Mon, 16 Sep 2019 20:22:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA4806EA29;
	Mon, 16 Sep 2019 18:22:40 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 053B86EA27
 for <amd-gfx@lists.freedesktop.org>; Mon, 16 Sep 2019 18:22:39 +0000 (UTC)
Received: by mail-pf1-x444.google.com with SMTP id q12so403441pff.9
 for <amd-gfx@lists.freedesktop.org>; Mon, 16 Sep 2019 11:22:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wCWmQrUdC4+yidolvtodOAbWEg6K9IbAqOG50vb4hkU=;
 b=mvmaInaswilw90yzKcCRLfgFEt+grAD9asgAlFo92DLzhMOW+YQNHceBTwgUYUP+wk
 qV7T0uuayJV4XVmaqPrxFvd682zcLsAUagHp1rXfDR/IiGjeCHAGZkiX4aOG/RhIjDbd
 PUJles4MSH6upTtAUnbKL98DluI7Z/C09V475stpZPnlNEavlEW81jZEbeSWFAkViP1B
 xciPtP1y2FqAxx0lAl0BX3nNqdMOArfIb8B71hOxSBuKyA7wLuQ5vEsft/sWs+BPOE05
 vidbvYlGfCS9zLKnUkCkiFK2ady8IseM2FmFrb4eW3F8wzhY7oi6hXTbLbs6YOBdPVDA
 r72g==
X-Gm-Message-State: APjAAAWxOz3FpOdiFVHHjCDYLugIBdb8U3lxVsaCiUPG2vZVhsO6dhov
 +90SV4an2v5OwtQGBjObjQTAPcCo
X-Google-Smtp-Source: APXvYqyHHNqEBc7GKFnN9F9ga+x5ub+tJCX0eSfdCqncr29pz1GWaDDtHXHHtuqy0hSoWZdqrP2/Zg==
X-Received: by 2002:a17:90a:9f4a:: with SMTP id
 q10mr547250pjv.77.1568658158043; 
 Mon, 16 Sep 2019 11:22:38 -0700 (PDT)
Received: from localhost.localdomain ([71.219.73.178])
 by smtp.gmail.com with ESMTPSA id 16sm11887436pgp.23.2019.09.16.11.22.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Sep 2019 11:22:37 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH] drm/amdgpu/vm: fix documentation for amdgpu_vm_bo_param
Date: Mon, 16 Sep 2019 13:22:28 -0500
Message-Id: <20190916182228.11860-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wCWmQrUdC4+yidolvtodOAbWEg6K9IbAqOG50vb4hkU=;
 b=NUpeRlUS59HZk6VWFs4kRQcV5zYTcMHyTHzQC81Fu2sMjTudq/hVlnJHAkPSy2j8t8
 C+v1+bcvuTNcynTL3g3wLbq2jKh0smOGLTnL+240/o/DwbM3/qKP24OZCjTscgJHSOVl
 2YD3DplxQsiM/cGpCIDrHN6VojIuoTFQg5pWg0AVdVtKrYCQ4ZlHKJHa3IyDn8X8y8Om
 HMTDoWjJRLyb5uvYN9lfUiNQr+6xAq++rpbjjrjZPyJFGso7WBCPl7VXTaTW4voDu+HP
 TapYYPWl1rDJW9WMb9AWINaWq/qH80Ib94ETfShncHe3OQ0diDSpZ0mtKSTjkwCmf+d8
 VbgA==
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

QWRkIG5ldyBwYXJhbWV0ZXJzLgoKU2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5k
ZXIuZGV1Y2hlckBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV92bS5jIHwgMiArKwogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92bS5jIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZtLmMKaW5kZXggZjExNzVmOWY0YjgwLi41NDU0OWEyNmVl
MDEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92bS5jCisr
KyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92bS5jCkBAIC04MjUsNiArODI1
LDggQEAgc3RhdGljIGludCBhbWRncHVfdm1fY2xlYXJfYm8oc3RydWN0IGFtZGdwdV9kZXZpY2Ug
KmFkZXYsCiAgKgogICogQGFkZXY6IGFtZGdwdV9kZXZpY2UgcG9pbnRlcgogICogQHZtOiByZXF1
ZXN0aW5nIHZtCisgKiBAbGV2ZWw6IHRoZSBwYWdlIHRhYmxlIGxldmVsCisgKiBAZGlyZWN0OiB1
c2UgYSBkaXJlY3QgdXBkYXRlCiAgKiBAYnA6IHJlc3VsdGluZyBCTyBhbGxvY2F0aW9uIHBhcmFt
ZXRlcnMKICAqLwogc3RhdGljIHZvaWQgYW1kZ3B1X3ZtX2JvX3BhcmFtKHN0cnVjdCBhbWRncHVf
ZGV2aWNlICphZGV2LCBzdHJ1Y3QgYW1kZ3B1X3ZtICp2bSwKLS0gCjIuMjAuMQoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxp
c3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
