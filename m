Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2763169E09
	for <lists+amd-gfx@lfdr.de>; Mon, 15 Jul 2019 23:25:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8AF489E14;
	Mon, 15 Jul 2019 21:25:08 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com
 [IPv6:2607:f8b0:4864:20::836])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BEBA89DDF
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 21:25:05 +0000 (UTC)
Received: by mail-qt1-x836.google.com with SMTP id h18so17247463qtm.9
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 14:25:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hoZHFoT6F+X5f4lNa5UJWYXNeuVWrpxuwCTcJ91A5wQ=;
 b=XdIm3ahCF6ac1ASAS+TRhWHv0mp4uAq7ACxOegXgHBBT3rqEd6mjF67PjTTyPouZF0
 uvUpf/XIRS7gScW5mXQR7bZhdejEeeU9bPA0ucu7dGw+7R2Nxii0Uf0k9UF0TnY0s35g
 4WXOox1DB7tdzjfp4InKaRbb2emgmWktbwCveuzuBsgonR48EINlMU2LWGZwiTeh5uI1
 ZlXqqryFuj/6aWGK1UVvsD4eEJJ71Iij12T+F6WOSXFeDIvMDMPXe7ND0L3CGCWiindg
 UzF9zG1ra2XDnbODGPxoWISFEsfYrgU5Jpn+cHp/bI/gGB/ZarNNlW7BtTzd8ZE+qYBe
 t6rw==
X-Gm-Message-State: APjAAAVve5WSS7YOFlMpeKw3vj8s8TI7+44b+EYN2JYV319N2/GD/pBf
 eAHN+TGoXqVoTLCigk0bi51SOkAx
X-Google-Smtp-Source: APXvYqygeg81CeOp/v3u37k4lEI1e2vtcTChZRkum8ROB0Q7z0DtbBP91vUrZ+BwmnERpn4FXngcXQ==
X-Received: by 2002:ac8:38c5:: with SMTP id g5mr20130627qtc.299.1563225904426; 
 Mon, 15 Jul 2019 14:25:04 -0700 (PDT)
Received: from localhost.localdomain ([71.219.21.119])
 by smtp.gmail.com with ESMTPSA id q56sm10274133qtq.64.2019.07.15.14.25.03
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 15 Jul 2019 14:25:03 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 022/102] drm/amdgpu: add to set Arcturus ip blocks
Date: Mon, 15 Jul 2019 16:23:17 -0500
Message-Id: <20190715212437.31793-20-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190715212437.31793-1-alexander.deucher@amd.com>
References: <20190715212437.31793-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hoZHFoT6F+X5f4lNa5UJWYXNeuVWrpxuwCTcJ91A5wQ=;
 b=Y90b0OnEHzYCSzcpm0/E34cIIOVNxdm/lMsLorvG0Z0vxLwy7TGN6AnDrcPq7hrMGt
 4uQN/qax2GIqn/U5r0LX4d13gGNSCiqzg5NnrOPJwL1bE3zdureycxt65iuiI9irEumg
 1dqvqd6wGbZoX4QB9VW+xdyHDnkUQ15P2yoR94hWriIQJOodd9H2iLNjk3P/74omF1jU
 wqBe+rE/MPZiZBJ8yZcBdBlsGCqz7wbmXdHwiWQSu5JEsxyNFXwtH7g0OyqW6u5Id4m5
 w0sqfEtv9lkNehTXADenrIWzJezTN7bTzjjx2FoGPvG1a7vcu1WyX+6nM4dgD6im8rBe
 h2XQ==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Le Ma <le.ma@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogTGUgTWEgPGxlLm1hQGFtZC5jb20+CgpTaWduZWQtb2ZmLWJ5OiBMZSBNYSA8bGUubWFA
YW1kLmNvbT4KUmV2aWV3ZWQtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1k
LmNvbT4KU2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQu
Y29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2UuYyB8IDEg
KwogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1X2RldmljZS5jCmluZGV4IGY4MjUwYTc3NmI5My4uMDE3YmJkNTQxZjAwIDEw
MDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMKKysr
IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jCkBAIC0xNTM0LDYg
KzE1MzQsNyBAQCBzdGF0aWMgaW50IGFtZGdwdV9kZXZpY2VfaXBfZWFybHlfaW5pdChzdHJ1Y3Qg
YW1kZ3B1X2RldmljZSAqYWRldikKIAljYXNlIENISVBfVkVHQTEyOgogCWNhc2UgQ0hJUF9WRUdB
MjA6CiAJY2FzZSBDSElQX1JBVkVOOgorCWNhc2UgQ0hJUF9BUkNUVVJVUzoKIAkJaWYgKGFkZXYt
PmFzaWNfdHlwZSA9PSBDSElQX1JBVkVOKQogCQkJYWRldi0+ZmFtaWx5ID0gQU1ER1BVX0ZBTUlM
WV9SVjsKIAkJZWxzZQotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2FtZC1nZng=
