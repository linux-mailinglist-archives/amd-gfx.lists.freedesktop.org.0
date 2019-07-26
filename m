Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DE5D76E9B
	for <lists+amd-gfx@lfdr.de>; Fri, 26 Jul 2019 18:09:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5FFE6EDBC;
	Fri, 26 Jul 2019 16:09:16 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEB9A6EDBC
 for <amd-gfx@lists.freedesktop.org>; Fri, 26 Jul 2019 16:09:15 +0000 (UTC)
Received: by mail-qk1-x742.google.com with SMTP id g18so39409624qkl.3
 for <amd-gfx@lists.freedesktop.org>; Fri, 26 Jul 2019 09:09:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dDslxaZQMQ9/RwohY2O54YbzaydRwIhPWWNncoL/WWk=;
 b=nYWX4oGLnULogvI9dGPs5s3Yy9EWGH92NliXyjgnY1i0sJQfCUkTjFBUa/V1SbCcUu
 pvgjZy53Knm8bwppSIONAG2MSpSQVz2801/06EH4zPgGs+3l/C1GLzfwr0V1m6BDwZbo
 S33SOYZyXtrjSlE0x9vLvm/aSMo7MDwMtJ7FmD9HXC2XGWPNclee0jr8wV0aPzmrxJt0
 S8fM8Ay+seUd0pGpmIEsM9KYwtlEbKPQf448vf/L26keyYtrCcCbjZt3qmWc+OFaHF2J
 zAGDkMXX0uASXSS5uOBykMhOQ6BY7oh9AqHpwWeAXEiMUb53yut113Wju91ic8itx6ok
 gNkA==
X-Gm-Message-State: APjAAAUdFXwaTKDamD+mxTxBm8MplvlYnzwvdqypbr4LHzt2drFif0Up
 5oX2mE+Sr7mTlR2pkUQL81JhqCmQ
X-Google-Smtp-Source: APXvYqy8vSA/gTAGsxpqz+0+rJcT2MG5x5IFDjmfhHersaKIx9aBUxy+H80qd8bWdGKdNu02TzWZFg==
X-Received: by 2002:a37:7704:: with SMTP id s4mr63286372qkc.310.1564157354692; 
 Fri, 26 Jul 2019 09:09:14 -0700 (PDT)
Received: from localhost.localdomain ([71.51.160.180])
 by smtp.gmail.com with ESMTPSA id 39sm29327066qts.41.2019.07.26.09.09.13
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 26 Jul 2019 09:09:14 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH] drm/amdgpu/display: fix the build without
 CONFIG_DRM_AMD_DC_DSC_SUPPORT
Date: Fri, 26 Jul 2019 11:09:06 -0500
Message-Id: <20190726160906.6705-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dDslxaZQMQ9/RwohY2O54YbzaydRwIhPWWNncoL/WWk=;
 b=RU0k0w/XA0rj/AU5JN5L6U64xtK84GJrlA030lwbICCnwCHPvp3pmSSTGhDAeSgkuP
 XX8FZa4wPdPZ6HBkQAYJVbev7Kh/u3muzL1EM4UEMRyGuCSSrXJSn3tSPQXnToYR3rxL
 VEqmSy0/aP6S4TaPjIhY+HSuvMwBqn6VZRIQnK+JipbEH29yDnCJRdt9x/bLkDAKKqVo
 4lqZ8MGPDmIWx0YGYK3KgppZD89xlZAz9EUwwaVd1WI/XP1bu2tYAj4O5RklpgxyAv0B
 sqyLFx1bR+OIz+Cwt4eLnhlTfy4G3Imd8fNlE5+wuJC4cANToTaVoHC9/HEOfbgP1Wda
 leEw==
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

U29tZSBjb2RlIHdhcyBtaXNzaW5nIHRoZSBDT05GSUdfRFJNX0FNRF9EQ19EU0NfU1VQUE9SVCBn
dWFyZC4KClNpZ25lZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1k
LmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjAvZGNuMjBfaHdz
ZXEuYyB8IDIgKysKIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjAvZGNuMjBfaHdzZXEuYyBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9kY24yMF9od3NlcS5jCmluZGV4IDY5
ZTRkMGQ5NmM3Zi4uMzhiM2M4OWIyYTU5IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2Rpc3BsYXkvZGMvZGNuMjAvZGNuMjBfaHdzZXEuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1k
L2Rpc3BsYXkvZGMvZGNuMjAvZGNuMjBfaHdzZXEuYwpAQCAtNjMwLDkgKzYzMCwxMSBAQCBzdGF0
aWMgdm9pZCBkY24yMF9pbml0X2h3KHN0cnVjdCBkYyAqZGMpCiAJCX0KIAl9CiAKKyNpZmRlZiBD
T05GSUdfRFJNX0FNRF9EQ19EU0NfU1VQUE9SVAogCS8qIFBvd2VyIGdhdGUgRFNDcyAqLwogCWZv
ciAoaSA9IDA7IGkgPCByZXNfcG9vbC0+cmVzX2NhcC0+bnVtX2RzYzsgaSsrKQogCQlkY24yMF9k
c2NfcGdfY29udHJvbChod3MsIHJlc19wb29sLT5kc2NzW2ldLT5pbnN0LCBmYWxzZSk7CisjZW5k
aWYKIAogCS8qIEJsYW5rIHBpeGVsIGRhdGEgd2l0aCBPUFAgRFBHICovCiAJZm9yIChpID0gMDsg
aSA8IGRjLT5yZXNfcG9vbC0+dGltaW5nX2dlbmVyYXRvcl9jb3VudDsgaSsrKSB7Ci0tIAoyLjIw
LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1n
ZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
