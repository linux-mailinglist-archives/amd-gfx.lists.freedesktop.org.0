Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E72E1D2991
	for <lists+amd-gfx@lfdr.de>; Thu, 10 Oct 2019 14:34:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 322F26E270;
	Thu, 10 Oct 2019 12:34:39 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-yb1-xb41.google.com (mail-yb1-xb41.google.com
 [IPv6:2607:f8b0:4864:20::b41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B481D6E1EC
 for <amd-gfx@lists.freedesktop.org>; Thu, 10 Oct 2019 10:42:29 +0000 (UTC)
Received: by mail-yb1-xb41.google.com with SMTP id r2so1778047ybg.3
 for <amd-gfx@lists.freedesktop.org>; Thu, 10 Oct 2019 03:42:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tAlGqn4lzKD/pEdaD7aWIt7loTckB30SoanKrD3NvqQ=;
 b=BKnCOPB6MB/AoRI0VciPqDk0tceGCe+lc/QpGaNRUPqHTtMBEr2sPKJVFrQR3DH+I1
 D5gE8WZ/8Th9gKUT+4ELoWkDzOG87COVT8PJ/qIJ234MxgI+p+ghYpWp4/Kzu+jgLoWF
 0e8/QSRiJLu7h5snI4aBU1QavLSpKERK27sJEgfon6lqjrPFOZvd251zpOexXVoKpbfl
 Y4+MrEn10YjXEpxEVg/rrDiZ+ZBZkPhQpejjInZIAgsR3h//Cb3vucTbvxQuRCdJHhpo
 EKqOoU6Pyje6K5E+h24DhjYQKLP98WXjhzlP5QD7wIZv9QjbpWcAYgmvBRkLSlH0sMWb
 JIHQ==
X-Gm-Message-State: APjAAAUsgrk+sD2/1rBbTlAEr7Xigzz3uFpe1YE5S5XYjzsl191mLdg2
 VHo3hiNycxSESfdwqldgO8nVg8Qh8MI=
X-Google-Smtp-Source: APXvYqwbvGVp7ki8KEYkM639KRFOeoPHiFy4fMxctPPIUGA7AOEjksiiY4up7L0ny/0NctFjfJ88Sg==
X-Received: by 2002:a25:bc83:: with SMTP id e3mr5526906ybk.507.1570704148641; 
 Thu, 10 Oct 2019 03:42:28 -0700 (PDT)
Received: from brihaspati.amd.com
 (p200300C58F3140007337B3FCBACE7417.dip0.t-ipconnect.de.
 [2003:c5:8f31:4000:7337:b3fc:bace:7417])
 by smtp.gmail.com with ESMTPSA id g20sm1344469ywe.98.2019.10.10.03.42.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Oct 2019 03:42:28 -0700 (PDT)
From: Nirmoy Das <nirmoy.aiemd@gmail.com>
X-Google-Original-From: Nirmoy Das <nirmoy.das@amd.com>
To: alexander.deucher@amd.com,
	christian.koenig@amd.com
Subject: [RFC PATCH] drm/amdgpu: fix amdgpu_vm_handle_fault return value
Date: Thu, 10 Oct 2019 12:42:14 +0200
Message-Id: <20191010104214.38728-1-nirmoy.das@amd.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 10 Oct 2019 12:34:38 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tAlGqn4lzKD/pEdaD7aWIt7loTckB30SoanKrD3NvqQ=;
 b=S6HSVsp1rhrjlvdSqzdNQR1Na/D3KW8mCCScAtAqfEvaLNu/uoZZYiCe5TjQNytLYP
 Q62KAGgQI2bhurAm5us5hBf/Uf0ZkBJGnUngauDsA6RaZlsbKSt0AIG9zHM6jA/5AZEF
 hE/JpuajgdzoFO0L9VH8+idqXIF4XoD5JIEpfBYR9CyQdq+owAWUzcp80KiZjNBc9+su
 erdPjBMYm4iUeCJJDlzQih+O3ZNzrwxqIYrsIy+/aYc4jSeoH4CywjSTgNtud+R/T2qP
 W9KvEAJlj2M4BT69DJ+JeeZbw6v2/d6Fh6HA0Ffpj2+vlLurp99Bx4jJij99rW4Zgx9K
 UGVg==
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
Cc: nirmoy.das@amd.com, amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

YW1kZ3B1X3ZtX2hhbmRsZV9mYXVsdCBzaG91bGQgcmV0dXJuIHRydWUgb24gc3VjY2VzcwoKU2ln
bmVkLW9mZi1ieTogTmlybW95IERhcyA8bmlybW95LmRhc0BhbWQuY29tPgotLS0KIGRyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92bS5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEg
aW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYW1kZ3B1X3ZtLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfdm0uYwppbmRleCBkOWJlY2U5ODdlNjAuLjZmNDY4YzZmZmVmMiAxMDA2NDQKLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZtLmMKKysrIGIvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYW1kZ3B1X3ZtLmMKQEAgLTMyMTUsNSArMzIxNSw1IEBAIGJvb2wgYW1kZ3B1
X3ZtX2hhbmRsZV9mYXVsdChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwgdW5zaWduZWQgaW50
IHBhc2lkLAogZXJyb3JfdW5yZWY6CiAJYW1kZ3B1X2JvX3VucmVmKCZyb290KTsKIAotCXJldHVy
biBmYWxzZTsKKwlyZXR1cm4gKHIgPT0gMCkgPyB0cnVlIDogZmFsc2U7CiB9Ci0tIAoyLjIzLjAK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZngg
bWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
