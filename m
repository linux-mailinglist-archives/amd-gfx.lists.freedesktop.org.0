Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 979AACAB77
	for <lists+amd-gfx@lfdr.de>; Thu,  3 Oct 2019 19:30:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D74506E2A3;
	Thu,  3 Oct 2019 17:30:05 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9C646E2A3
 for <amd-gfx@lists.freedesktop.org>; Thu,  3 Oct 2019 17:30:03 +0000 (UTC)
Received: by mail-qk1-x742.google.com with SMTP id u186so3175100qkc.5
 for <amd-gfx@lists.freedesktop.org>; Thu, 03 Oct 2019 10:30:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zkk/fll2VvpZrD+qokQJESIIXD61mTEOXOsPo+NYqyI=;
 b=N6f8Zhyc6f7IcUrm2+4pwV+7jJBwiHfUnNNoJYmwbBrkeHylVpmo/Q835lCHxCq2Cz
 wlg1yZaVsT5duCHvIG9GjGV56i8sithoaulxuH7U3lBEwVQ2DfErbcZw3vY9aHZ0GyYF
 MFkOaDM7oQZ/aU2jQch9gc9GDh9IMNEGRaK0+9WDYiisjiIz/q4n9gc3RYaW8dGD4eQJ
 +r6Zu7AxgW0nUSDyVujHNQN1tNjJQRH22fUaA/dx3Jw6PK6r9vsS1In1E+mAy6LzMO7y
 W5fSvIPKZCDIp1nb+QBiKPlKT9zSHcH/X9N53m5WnvjNZ/7qjMv0xqjaRwcz5E+6CquD
 rWZQ==
X-Gm-Message-State: APjAAAUglG4+3dw7nGyWHYvw2oEYhI5Th4bFld4UdIr2nEXcL3PChX4O
 JxT115ApaKzvGcYyfPYF/UccUGPv
X-Google-Smtp-Source: APXvYqx0lG5GdsUaBR6cL+jmVUAK4qB1L8Do9AZYNu8g3MqrXNwvGdkyvgZUWEpGwngeB/G/DDnF6w==
X-Received: by 2002:a37:498f:: with SMTP id w137mr5422017qka.419.1570123802421; 
 Thu, 03 Oct 2019 10:30:02 -0700 (PDT)
Received: from localhost.localdomain ([71.219.73.178])
 by smtp.gmail.com with ESMTPSA id y4sm1717704qkl.107.2019.10.03.10.30.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Oct 2019 10:30:01 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH] drm/amdgpu: improve MSI-X handling (v3)
Date: Thu,  3 Oct 2019 12:29:51 -0500
Message-Id: <20191003172951.15866-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zkk/fll2VvpZrD+qokQJESIIXD61mTEOXOsPo+NYqyI=;
 b=g0rmtkEQRfLO4xq78iIqvOcEQ2Jhv8nVt5b6AgyXJ4pz+fvRpq1wjc1huiocPc9FQq
 yMtyTUp1doCSnjRLQjeZN+gC7eseQ2eZbZICRLPUCj4kssAThho1G31FbykcGW+tIbnk
 DxcEBFrkx2GvDuAW61QX9emEdVTj34w00hVSvnJ6yWdP9KRwvUa3LzKJzp5hijqa7Byj
 C88IEPSuFqDFHAZbrYFtM+NfByv2Z6HgruMP6mXX+QODGArGIF2l2pBJXI4243E8v5He
 aRXlfRveBmHGxm6pRRzjK6ijVbNkZkzGeImBoLbHAWPU4BbuS2uDMgDMTRU898XuTPuh
 bdiw==
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

Q2hlY2sgdGhlIG51bWJlciBvZiBzdXBwb3J0ZWQgdmVjdG9ycyBhbmQgZmFsbCBiYWNrIHRvIE1T
SSBpZgp3ZSByZXR1cm4gb3IgZXJyb3Igb3IgMCBNU0ktWCB2ZWN0b3JzLgoKdjI6IG9ubHkgYWxs
b2NhdGUgb25lIHZlY3Rvci4gIFdlIGNhbid0IGN1cnJlbnRseSB1c2UgbW9yZSB0aGFuCm9uZSBh
bnl3YXkuCgp2MzogaW5zdGFsbCB0aGUgaXJxIG9uIHZlY3RvciAwLgoKU2lnbmVkLW9mZi1ieTog
QWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9pcnEuYyB8IDE3ICsrKysrKysrKysrKystLS0tCiAxIGZp
bGUgY2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfaXJxLmMgYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfaXJxLmMKaW5kZXggNTA3NzFiMjc1N2RjLi42ZjNiMDNmNjIy
NGYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9pcnEuYwor
KysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfaXJxLmMKQEAgLTI0NSwxMSAr
MjQ1LDE5IEBAIGludCBhbWRncHVfaXJxX2luaXQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYp
CiAJYWRldi0+aXJxLm1zaV9lbmFibGVkID0gZmFsc2U7CiAKIAlpZiAoYW1kZ3B1X21zaV9vayhh
ZGV2KSkgewotCQlpbnQgbnZlYyA9IHBjaV9hbGxvY19pcnFfdmVjdG9ycyhhZGV2LT5wZGV2LCAx
LCBwY2lfbXNpeF92ZWNfY291bnQoYWRldi0+cGRldiksCi0JCQkJCVBDSV9JUlFfTVNJIHwgUENJ
X0lSUV9NU0lYKTsKKwkJaW50IG52ZWMgPSBwY2lfbXNpeF92ZWNfY291bnQoYWRldi0+cGRldik7
CisJCXVuc2lnbmVkIGludCBmbGFnczsKKworCQlpZiAobnZlYyA8PSAwKSB7CisJCQlmbGFncyA9
IFBDSV9JUlFfTVNJOworCQl9IGVsc2UgeworCQkJZmxhZ3MgPSBQQ0lfSVJRX01TSSB8IFBDSV9J
UlFfTVNJWDsKKwkJfQorCQkvKiB3ZSBvbmx5IG5lZWQgb25lIHZlY3RvciAqLworCQludmVjID0g
cGNpX2FsbG9jX2lycV92ZWN0b3JzKGFkZXYtPnBkZXYsIDEsIDEsIGZsYWdzKTsKIAkJaWYgKG52
ZWMgPiAwKSB7CiAJCQlhZGV2LT5pcnEubXNpX2VuYWJsZWQgPSB0cnVlOwotCQkJZGV2X2RiZyhh
ZGV2LT5kZXYsICJhbWRncHU6IHVzaW5nIE1TSS5cbiIpOworCQkJZGV2X2RiZyhhZGV2LT5kZXYs
ICJhbWRncHU6IHVzaW5nIE1TSS9NU0ktWC5cbiIpOwogCQl9CiAJfQogCkBAIC0yNzIsNyArMjgw
LDggQEAgaW50IGFtZGdwdV9pcnFfaW5pdChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKIAlJ
TklUX1dPUksoJmFkZXYtPmlycS5paDJfd29yaywgYW1kZ3B1X2lycV9oYW5kbGVfaWgyKTsKIAog
CWFkZXYtPmlycS5pbnN0YWxsZWQgPSB0cnVlOwotCXIgPSBkcm1faXJxX2luc3RhbGwoYWRldi0+
ZGRldiwgYWRldi0+ZGRldi0+cGRldi0+aXJxKTsKKwkvKiBVc2UgdmVjdG9yIDAgZm9yIE1TSS1Y
ICovCisJciA9IGRybV9pcnFfaW5zdGFsbChhZGV2LT5kZGV2LCBwY2lfaXJxX3ZlY3RvcihhZGV2
LT5wZGV2LCAwKSk7CiAJaWYgKHIpIHsKIAkJYWRldi0+aXJxLmluc3RhbGxlZCA9IGZhbHNlOwog
CQlpZiAoIWFtZGdwdV9kZXZpY2VfaGFzX2RjX3N1cHBvcnQoYWRldikpCi0tIAoyLjIwLjEKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFp
bGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
