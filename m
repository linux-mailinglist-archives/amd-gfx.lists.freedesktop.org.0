Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC57DD96B7
	for <lists+amd-gfx@lfdr.de>; Wed, 16 Oct 2019 18:14:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 669D76E915;
	Wed, 16 Oct 2019 16:14:03 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E2466E915
 for <amd-gfx@lists.freedesktop.org>; Wed, 16 Oct 2019 16:14:01 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id o12so36958166qtf.3
 for <amd-gfx@lists.freedesktop.org>; Wed, 16 Oct 2019 09:14:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=75T0g5ioJxO/m1FxYt4aQjUlxltVkyahe7l7oblAtqs=;
 b=NNi7axqlbFViz11x7lJqQ1d33eDZ99nWtvND34tEUSLw2pR/2/MQrvzKmCO8f16Iz5
 4CgcDrem6Pw/5nNQemfmDr7qrN3fVQ/+ZZ2nMX6vcaAHj+2xuuZ1Sq4JNKjkIRVfo5Ro
 agy4ZpRM2h+y0Ucd2FZx0c9jofzNfM/+o0mdj1yB8OITQ7qV3eBaH6Y8QC6pGeQuYrWe
 VuG0F75Pt6di9qM2BQISL/mWX7goU9zBOv4kXjmnJgt+z1wCYEFGyR6f5XvipFDmvwlc
 N0RcwSrN6iPm1AYu8oXWr9/DfGoXK3FfvrKZL4mkLaVGCOSl087YnfAldwC0KM0GoyzP
 lzDA==
X-Gm-Message-State: APjAAAWwcstEmqbWIYjyPKNM4A6hkc+Vl0rKEy1yAS9JTOstxxEsKewA
 JRxT/bWF1FevvbR8xlO6XWtKpRst
X-Google-Smtp-Source: APXvYqyP+L+Qc78QZBE+KWkufIrE4fQ64W+Y0b0ZBxSIOFnQ0V/sUJIYTIaCpluv+LSEaZQX4OYLiA==
X-Received: by 2002:ac8:724f:: with SMTP id l15mr44964883qtp.63.1571242440060; 
 Wed, 16 Oct 2019 09:14:00 -0700 (PDT)
Received: from localhost.localdomain ([71.51.171.205])
 by smtp.gmail.com with ESMTPSA id p53sm13555581qtk.23.2019.10.16.09.13.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Oct 2019 09:13:59 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH] drm/amdgpu/display: fix build when
 CONFIG_DRM_AMD_DC_DSC_SUPPORT=n
Date: Wed, 16 Oct 2019 12:13:43 -0400
Message-Id: <20191016161343.698656-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=75T0g5ioJxO/m1FxYt4aQjUlxltVkyahe7l7oblAtqs=;
 b=lywtsZbUvU2uwNDKVLgkDGQUoF9ylutgCHPIuI2jrgD0cPMfrMm5YM1cBGBDX+p7uB
 ECwCBzc5GPlaDg86uxP5t+sFzXWh/OLMODPF22O75devVGI3NPCOOjhA8qtQOqcLOtKo
 KLVCY30sjtoHYFRTFPXV2r7K+wiACoTc1ASmc6c7SSdD0xwdAzbU8qagN5ieLXVGDaRW
 Lb4oJa8Ms3dcUL2rx9nG6DHbQKPkcHxfc63g1LBdNbn5AwUnuVm+HgZUJsqUfTWmeH+Z
 UnJx6RuMlgtmzeKtftqkpmvnRtGs2scGqhwveIWcu/S8NwkhSvqhH0zxIoxkjYu4GAJZ
 vMYA==
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

QWRkIHByb3BlciBjb25maWcgY2hlY2suCgpTaWduZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIgPGFs
ZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5
L2RjL2RjbjIwL2RjbjIwX3Jlc291cmNlLmMgfCAyICsrCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNl
cnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2Rj
bjIwL2RjbjIwX3Jlc291cmNlLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNu
MjAvZGNuMjBfcmVzb3VyY2UuYwppbmRleCA5MTRlMzc4YmNkYTQuLjRmMDMzMTgxMDY5NiAxMDA2
NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIwX3Jlc291
cmNlLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIwX3Jl
c291cmNlLmMKQEAgLTE5MTAsOCArMTkxMCwxMCBAQCBpbnQgZGNuMjBfcG9wdWxhdGVfZG1sX3Bp
cGVzX2Zyb21fY29udGV4dCgKIAkJCXBpcGVzW3BpcGVfY250XS5kb3V0Lm91dHB1dF9icHAgPSBv
dXRwdXRfYnBjICogMzsKIAkJfQogCisjaWZkZWYgQ09ORklHX0RSTV9BTURfRENfRFNDX1NVUFBP
UlQKIAkJaWYgKHJlc19jdHgtPnBpcGVfY3R4W2ldLnN0cmVhbS0+dGltaW5nLmZsYWdzLkRTQykK
IAkJCXBpcGVzW3BpcGVfY250XS5kb3V0Lm91dHB1dF9icHAgPSByZXNfY3R4LT5waXBlX2N0eFtp
XS5zdHJlYW0tPnRpbWluZy5kc2NfY2ZnLmJpdHNfcGVyX3BpeGVsIC8gMTYuMDsKKyNlbmRpZgog
CiAJCS8qIHRvZG86IGRlZmF1bHQgbWF4IGZvciBub3csIHVudGlsIHRoZXJlIGlzIGxvZ2ljIHJl
ZmxlY3RpbmcgdGhpcyBpbiBkYyovCiAJCXBpcGVzW3BpcGVfY250XS5kb3V0Lm91dHB1dF9icGMg
PSAxMjsKLS0gCjIuMjMuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
