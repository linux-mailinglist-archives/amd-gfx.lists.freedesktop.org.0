Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 46DA258451
	for <lists+amd-gfx@lfdr.de>; Thu, 27 Jun 2019 16:16:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 807596E422;
	Thu, 27 Jun 2019 14:16:38 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA43B6E422
 for <amd-gfx@lists.freedesktop.org>; Thu, 27 Jun 2019 14:16:36 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id m29so2611863qtu.1
 for <amd-gfx@lists.freedesktop.org>; Thu, 27 Jun 2019 07:16:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5svZ0QdVFCVHSqOHEUqGqSvpRwGI3k3Qq/njbRpCG2g=;
 b=SfJo4+xS4FyA4H7eEx8niSoPFczumEDMOQDOFk5K+oLSItwyNu19aAE6eGzexVY+hH
 QfJ2x2YiZ+AO0F5zGtIDlbHD1gC+owMVubniXn5InNXJOdwsh8vsykvEiGHFxgk7JtJY
 mplEqjWQdPgTKiKe7WC6QiLUjJrQERIKULhZmUJT3bALpZ5p3uTQ34pDKR6LIAN8apaY
 29yVSn1CxFJPaLivUmItUyBcyFafABZQjPtw2+IPOQu73v46HBEJtuhw/DmbArZ5H2+8
 uCoLR2ivT8Ee647IiY4Cum1ZAy1Z3OVam3otfzfkz+8w5vM/eDoSp3eQRZ9zcMMpAJ11
 qk+g==
X-Gm-Message-State: APjAAAUEFfasfTNe9CMr6ZlwI6LdjmIf+HKUYmD4Ldon5lKcuCUM8LSb
 S+QFE66EGtMjJhzQgES6JlKVsqaLjSw=
X-Google-Smtp-Source: APXvYqwnVH8Cc1vbzeA4ne3QGetpR/stsomR6ecXZopFNMHkmok8j6S1pod9CcWSL4ygr7yaGs0foA==
X-Received: by 2002:a0c:b897:: with SMTP id y23mr3627494qvf.44.1561644995591; 
 Thu, 27 Jun 2019 07:16:35 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id m5sm968901qke.25.2019.06.27.07.16.34
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 27 Jun 2019 07:16:34 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH] drm/amdgpu: drop copy/paste leftover to fix big endian
Date: Thu, 27 Jun 2019 09:16:28 -0500
Message-Id: <20190627141628.7882-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5svZ0QdVFCVHSqOHEUqGqSvpRwGI3k3Qq/njbRpCG2g=;
 b=R8W2fOouqPVmbKMOMy7isV3WC5bsfFFiZ7wnEkQEUxepFGztaF7X25gWpmZ3clzcuS
 sDX+r2XsSSioOv4KDwLUTOfyzP2nDTQIJkv/5a8AEasNzdQ6cdRfx0pFeor13D4Z72fZ
 tkze7NB0m/4f2BnVoTMhxJPguDHRczbPFi3XaJf+YRp86yfxH1Nb3Tfm94AtB3RXI50y
 55N66/oqNyCiZOwUe6JyxJY3BxXTKKUSNthgxLvJY22mr764d4cpO9mnbMcss1Zd+Hqo
 ytGfNL5nm6ZAkHqHQj/iEd1jHdfn9uLw8PcZbYjcXWqvehPWc9n/VoFh+y9JRifoRLkL
 PcTQ==
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

VGhlIGJ1ZiBzd2FwIGZpZWxkIGRvZXNuJ3QgZXhpc3Qgb24gUkIxLgoKU2lnbmVkLW9mZi1ieTog
QWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2dmeF92MTBfMC5jIHwgMyAtLS0KIDEgZmlsZSBjaGFuZ2VkLCAzIGRl
bGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92
MTBfMC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3YxMF8wLmMKaW5kZXggMDA2
MWEwZThhYjc4Li4yOTMyYWRlN2RiZDAgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2dmeF92MTBfMC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92
MTBfMC5jCkBAIC0yNjI0LDkgKzI2MjQsNiBAQCBzdGF0aWMgaW50IGdmeF92MTBfMF9jcF9nZnhf
cmVzdW1lKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQogCXJiX2J1ZnN6ID0gb3JkZXJfYmFz
ZV8yKHJpbmctPnJpbmdfc2l6ZSAvIDgpOwogCXRtcCA9IFJFR19TRVRfRklFTEQoMCwgQ1BfUkIx
X0NOVEwsIFJCX0JVRlNaLCByYl9idWZzeik7CiAJdG1wID0gUkVHX1NFVF9GSUVMRCh0bXAsIENQ
X1JCMV9DTlRMLCBSQl9CTEtTWiwgcmJfYnVmc3ogLSAyKTsKLSNpZmRlZiBfX0JJR19FTkRJQU4K
LQl0bXAgPSBSRUdfU0VUX0ZJRUxEKHRtcCwgQ1BfUkIxX0NOVEwsIEJVRl9TV0FQLCAxKTsKLSNl
bmRpZgogCVdSRUczMl9TT0MxNShHQywgMCwgbW1DUF9SQjFfQ05UTCwgdG1wKTsKIAkvKiBJbml0
aWFsaXplIHRoZSByaW5nIGJ1ZmZlcidzIHdyaXRlIHBvaW50ZXJzICovCiAJcmluZy0+d3B0ciA9
IDA7Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
