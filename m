Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D86DDBE683
	for <lists+amd-gfx@lfdr.de>; Wed, 25 Sep 2019 22:35:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5988F6F79D;
	Wed, 25 Sep 2019 20:35:15 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com
 [IPv6:2607:f8b0:4864:20::d43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FC2E6FB2C
 for <amd-gfx@lists.freedesktop.org>; Wed, 25 Sep 2019 20:35:14 +0000 (UTC)
Received: by mail-io1-xd43.google.com with SMTP id u8so426278iom.5
 for <amd-gfx@lists.freedesktop.org>; Wed, 25 Sep 2019 13:35:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QotRNwcW4nRwZDEDMYMPZSiPDEQAgD+sYPIJkjuqVWc=;
 b=DyGsw7lLE58GDNvsttwbm5+5CxbPu5kax4uTnxdMX8wLlXQdb/ygLbMlEBUka7fU/K
 J8lkmwz/XP/5fCFURNQ3XcsaDiQR87tEforAhG6yREvGqRNXMXpjv/pEa9MAWImK/dLz
 7NxdWny2rgQdHbUQPoegmZjDFHo9igdboTjE4bb302MuYplleqT33oVD9K6qKLbAA8vp
 B1BmLxxfHrEW1vujJZ1r9tKm8FtwizXZ0OypDh5j9WnBa6mhvkV/0qi7cOc/ODm2qTUz
 eJVGO5pGe1ThCzNUle77sQSplY/rVxMlsOc7QeNxJEA2Dk6CnW0bC/phUS4fbo8BgFin
 tzeQ==
X-Gm-Message-State: APjAAAUd3Mbg0iTENFsQ+/BAOliOheiv4WfVvdAzxREZlRE1uya2N5gr
 nQvO5zNewMaiEfBVHK5unn7cz2oW
X-Google-Smtp-Source: APXvYqzt1jARC8raGFIxogRYwg4zUYg6dBgK/kh3a0PCoLi3gK8c2gMRKIYrJ8jVHGMyKS4/UAi9vg==
X-Received: by 2002:a05:6e02:4d0:: with SMTP id
 f16mr1698982ils.17.1569443713198; 
 Wed, 25 Sep 2019 13:35:13 -0700 (PDT)
Received: from crimson.amd.com ([165.204.55.251])
 by smtp.gmail.com with ESMTPSA id t16sm358036iol.12.2019.09.25.13.35.12
 for <amd-gfx@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Sep 2019 13:35:12 -0700 (PDT)
From: =?UTF-8?q?Marek=20Ol=C5=A1=C3=A1k?= <maraeo@gmail.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH] drm/amdgpu: simplify gds_compute_max_wave_id computation
Date: Wed, 25 Sep 2019 16:35:02 -0400
Message-Id: <20190925203502.30996-1-maraeo@gmail.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QotRNwcW4nRwZDEDMYMPZSiPDEQAgD+sYPIJkjuqVWc=;
 b=cCqhP6ZytRBzwonelasu8jeqoLyXP7k5spsIROfh9m/SZdWXNfSW+GldfZxnRlNGtE
 HAN2G/3j/Wg8ZY8gsFfe8JzlQyEXvAZd83YR92UTFl/KAxJJpgK2d8bSy8cS5ZRRFSdF
 qVNQE2IKfKUQXt4u7iK2HN/dCDIsG14KHVqrU9XQgPEZGZMl9ApMok6qJg4RnUXH7qHs
 eb3Vd7j5RXzUKTks7N6KOAjUHnrQe635LJmAhvYACv445HOoDWTnqOvVP1cb0zD/8exv
 g5EFcW1Y/wIDrxmrXyoHpisJMETvmRDrllSm1QvuMMwvurARN5wPcq4RJc6zBwCGwnWY
 vI5g==
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

RnJvbTogTWFyZWsgT2zFocOhayA8bWFyZWsub2xzYWtAYW1kLmNvbT4KClNpZ25lZC1vZmYtYnk6
IE1hcmVrIE9sxaHDoWsgPG1hcmVrLm9sc2FrQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvZ2Z4X3YxMF8wLmMgfCAxMyArKysrKy0tLS0tLS0tCiAxIGZpbGUgY2hhbmdl
ZCwgNSBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92MTBfMC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvZ2Z4X3YxMF8wLmMKaW5kZXggY2EwMTY0M2ZhMGM4Li43M2NkMjU0NDQ5YjMgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92MTBfMC5jCisrKyBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92MTBfMC5jCkBAIC01Mjc1LDI5ICs1Mjc1LDI2IEBAIHN0
YXRpYyB2b2lkIGdmeF92MTBfMF9zZXRfcmxjX2Z1bmNzKHN0cnVjdCBhbWRncHVfZGV2aWNlICph
ZGV2KQogCWNhc2UgQ0hJUF9OQVZJMTI6CiAJCWFkZXYtPmdmeC5ybGMuZnVuY3MgPSAmZ2Z4X3Yx
MF8wX3JsY19mdW5jczsKIAkJYnJlYWs7CiAJZGVmYXVsdDoKIAkJYnJlYWs7CiAJfQogfQogCiBz
dGF0aWMgdm9pZCBnZnhfdjEwXzBfc2V0X2dkc19pbml0KHN0cnVjdCBhbWRncHVfZGV2aWNlICph
ZGV2KQogewotCS8qIGluaXQgYXNpYyBnZHMgaW5mbyAqLwotCXN3aXRjaCAoYWRldi0+YXNpY190
eXBlKSB7Ci0JY2FzZSBDSElQX05BVkkxMDoKLQlkZWZhdWx0OgotCQlhZGV2LT5nZHMuZ2RzX3Np
emUgPSAweDEwMDAwOwotCQlhZGV2LT5nZHMuZ2RzX2NvbXB1dGVfbWF4X3dhdmVfaWQgPSAweDRm
ZjsKLQkJYnJlYWs7Ci0JfQorCXVuc2lnbmVkIHRvdGFsX2N1ID0gYWRldi0+Z2Z4LmNvbmZpZy5t
YXhfY3VfcGVyX3NoICoKKwkJCSAgICBhZGV2LT5nZnguY29uZmlnLm1heF9zaF9wZXJfc2UgKgor
CQkJICAgIGFkZXYtPmdmeC5jb25maWcubWF4X3NoYWRlcl9lbmdpbmVzOwogCisJYWRldi0+Z2Rz
Lmdkc19zaXplID0gMHgxMDAwMDsKKwlhZGV2LT5nZHMuZ2RzX2NvbXB1dGVfbWF4X3dhdmVfaWQg
PSB0b3RhbF9jdSAqIDMyIC0gMTsKIAlhZGV2LT5nZHMuZ3dzX3NpemUgPSA2NDsKIAlhZGV2LT5n
ZHMub2Ffc2l6ZSA9IDE2OwogfQogCiBzdGF0aWMgdm9pZCBnZnhfdjEwXzBfc2V0X3VzZXJfd2dw
X2luYWN0aXZlX2JpdG1hcF9wZXJfc2goc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsCiAJCQkJ
CQkJICB1MzIgYml0bWFwKQogewogCXUzMiBkYXRhOwogCiAJaWYgKCFiaXRtYXApCi0tIAoyLjE3
LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1n
ZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
