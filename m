Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B2CDA0AE2
	for <lists+amd-gfx@lfdr.de>; Wed, 28 Aug 2019 21:57:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F8AA89F07;
	Wed, 28 Aug 2019 19:57:01 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6DB789EBB
 for <amd-gfx@lists.freedesktop.org>; Wed, 28 Aug 2019 19:56:52 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id p13so830583qkg.13
 for <amd-gfx@lists.freedesktop.org>; Wed, 28 Aug 2019 12:56:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lEAwFQUvllE/KPYtd2/vx5COpCXNtSgvX2A+45vtWH4=;
 b=R5SwQFRCaEM+dCYDK/AHBs/KC9pFGuFqlQwFxjZ0ML07W7RrpN8472bobVUX5lECCw
 bLgeqDcJ7iUwQSTESSXd1oKDkOTEcACcyL8ww48CZ6smv63us68qdDdwUrf+BMMpgaNh
 R1AKCiIWX4QdnQ4BTwW2Z3brBPQnNs9KJau+XVOvVfaFpqKeQEMv2bvaxT58v3Hu+wdT
 fDtkypKrsdvMyoAXafKAw4pkFM4xv4Pipd8P2Kaf7fNSyAR3oLr698zyLY87E0BtW5SX
 crFg+/eU+C1H1QZ3i8cMUjCKZzfT8WHkm88WUYcvV6+qXOJomPc3yNVEiSrbhMfCLffy
 QU+w==
X-Gm-Message-State: APjAAAXg0xi6xXUkwYxRIWbhXntpTNVoM2qBzBrIS1SvHhu485Rcd3rZ
 GAGkhktoGLh+RV2n++9ojncSIq8g
X-Google-Smtp-Source: APXvYqzPUmIKubLJu3VPek4OqXMydMs9x1QA0megSa0lhKKtGDUZm6oOblIgsB7QxKAg6fPhvX+t1Q==
X-Received: by 2002:a37:a157:: with SMTP id k84mr5765826qke.141.1567022211630; 
 Wed, 28 Aug 2019 12:56:51 -0700 (PDT)
Received: from localhost.localdomain ([71.219.73.178])
 by smtp.gmail.com with ESMTPSA id s58sm136578qth.59.2019.08.28.12.56.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Aug 2019 12:56:51 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 19/23] drm/amd/display: build dcn21 blocks
Date: Wed, 28 Aug 2019 14:56:18 -0500
Message-Id: <20190828195622.28941-19-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190828195622.28941-1-alexander.deucher@amd.com>
References: <20190828195622.28941-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lEAwFQUvllE/KPYtd2/vx5COpCXNtSgvX2A+45vtWH4=;
 b=mf3Llj3flwMXec4ZkDqJNELlo2jmWxnbrr6LGaXLJs+IqrpVTKI9LjUQO4a2lNIxod
 GAWx2SQiWpwEX46Wk7VMJTRZekessJ2Wu56bcgJ2SPksQSB5B5NmhltRl7HvCx5tgqD3
 TettoqrAj05ME/nCk2807nuE4pJspbnrlh1g780d64M60QnPuwkF6O17iJzf/gTabLtS
 X+6aPLOBLkRezrC1sYzn2GiHEq58fRDSsOqZBXEIu1DdyphApZ78O+JZyI9tp1n2bi+g
 +DXYEn2YPSbnYY1MpzoXEeZ39JP61WeSCybGUE5Q0d70/O1hIakqCajGiTR3PIzTv0DD
 oL+Q==
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogQmhhd2FucHJlZXQgTGFraGEgPEJoYXdhbnByZWV0Lkxha2hhQGFtZC5jb20+CgpFbmFi
bGUgdGhlIGJ1aWxkaW5nIG9mIGRjbjIxIHN1cHBvcnQuCgpTaWduZWQtb2ZmLWJ5OiBCaGF3YW5w
cmVldCBMYWtoYSA8Qmhhd2FucHJlZXQuTGFraGFAYW1kLmNvbT4KU2lnbmVkLW9mZi1ieTogQWxl
eCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2Ry
bS9hbWQvZGlzcGxheS9kYy9NYWtlZmlsZSB8IDMgKysrCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNl
cnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL01h
a2VmaWxlIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL01ha2VmaWxlCmluZGV4IDU1
Y2U1YjY1NzM5MC4uNjI3OTgyY2IxNWQyIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2Rpc3BsYXkvZGMvTWFrZWZpbGUKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2Rj
L01ha2VmaWxlCkBAIC0zNyw2ICszNyw5IEBAIGVuZGlmCiBpZmRlZiBDT05GSUdfRFJNX0FNRF9E
Q19EQ04xXzAKIERDX0xJQlMgKz0gZGNuMTAgZG1sCiBlbmRpZgoraWZkZWYgQ09ORklHX0RSTV9B
TURfRENfRENOMl8xCitEQ19MSUJTICs9IGRjbjIxCitlbmRpZgogCiBEQ19MSUJTICs9IGRjZTEy
MAogCi0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
