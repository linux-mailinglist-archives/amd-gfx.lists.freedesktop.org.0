Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CE26B7E422
	for <lists+amd-gfx@lfdr.de>; Thu,  1 Aug 2019 22:30:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EC4C6E7BC;
	Thu,  1 Aug 2019 20:30:17 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE5746E7C8
 for <amd-gfx@lists.freedesktop.org>; Thu,  1 Aug 2019 20:30:15 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id h18so71689780qtm.9
 for <amd-gfx@lists.freedesktop.org>; Thu, 01 Aug 2019 13:30:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HB8gycHv7kRcnnR9Lo1xKdhHiTmf/t72xUGzi0DKdj0=;
 b=i2GsDPz+CyZajRTe3de9/LumIa52d5cQLbC50Lo5qB8sFM9x+PYWQhOb8ybjezedmC
 emgABW83Vw529yia6nVhVSbKZHZJrfksdTxB5YE1Gpkx22pDjfKQ8Qxs895evu8dGUKj
 EaKpoq5Ggmb7mzHMuMRyR+4ZWgo293iNo3XFp5VkDzKXSsoDUczeNt92rPgyaw7sO4zR
 /Y3si2SHdFqMO9UYjfNHZLJLNKdb2M5W04uGDZd+n2zJ8i0dmPKdzlTRF1O/tmAAs+gi
 IXO2Aab6GA9i2pnnvq18H4707xB+x1VDW3N5/USOqqqqmn3hgoxCmYGhsgxqbZ1nceb4
 qG1g==
X-Gm-Message-State: APjAAAXiC5tstxQy5i85PTloSkTIqy5lZtiDBnEPj6cq2LKg2LfQ9Mqc
 jRD7+hR4JWZxe6j6drpPS8KGk7gc
X-Google-Smtp-Source: APXvYqwJ3EXw6JgtNwRiz04qjQxUfN3TTnuzuBx51XXb0C9DM8OOzFI253/zXEdD6u289K7UobprBw==
X-Received: by 2002:ac8:354d:: with SMTP id z13mr95291272qtb.340.1564691414613; 
 Thu, 01 Aug 2019 13:30:14 -0700 (PDT)
Received: from localhost.localdomain ([71.219.6.100])
 by smtp.gmail.com with ESMTPSA id c20sm25129315qkk.69.2019.08.01.13.30.13
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 01 Aug 2019 13:30:14 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 10/36] drm/amdgpu/gfx10: add gfx config for navi12
Date: Thu,  1 Aug 2019 15:29:31 -0500
Message-Id: <20190801202957.29791-11-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190801202957.29791-1-alexander.deucher@amd.com>
References: <20190801202957.29791-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HB8gycHv7kRcnnR9Lo1xKdhHiTmf/t72xUGzi0DKdj0=;
 b=IzNeuGgYXO8O4s4ShUYgTf3KDKVkcY3yjpIJT0KfObrZGEFboOC+f5GuU2mUCBvKMZ
 VCNN/DAhopoRTKSChV0fQLS87c1mmEUjdwN2PniUGhcH/YkeKghSQ+GA6QQLxr1vWRtS
 VNiHgzgnb6mqQkj8FkNSvr8hXHRnsKYnkbSh7iXqv8EAkv4LmLxsqgxXMXxSPUAHaZcY
 g7kDLtYBgKJztGsIwsntUkljRLuUl4YbrpVJ64YdtWyYYiO1j8I4XdrfqYOq4jJEUU9P
 Q/A5OfelH1pPAURzDJ/aU5b0sWZXPjAA5hXpECcMaNntBiMXv0PbCuuswYkZANYOcbpG
 s4uQ==
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
 Hawking Zhang <Hawking.Zhang@amd.com>, Xiaojie Yuan <xiaojie.yuan@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogWGlhb2ppZSBZdWFuIDx4aWFvamllLnl1YW5AYW1kLmNvbT4KCmdvdCBmcm9tIG1tQ1Bf
TUFYX0NPTlRFWFQgYW5kIG1tUEFfU0NfRklGT19TSVpFCgp2Mjogc3F1YXNoIGFsbCBuYXZpIGFz
aWNzIHRvZ2V0aGVyIGJlY2F1c2UgdGhlCnNldHRpbmdzIGFyZSB0aGUgc2FtZS4KClNpZ25lZC1v
ZmYtYnk6IFhpYW9qaWUgWXVhbiA8eGlhb2ppZS55dWFuQGFtZC5jb20+ClJldmlld2VkLWJ5OiBI
YXdraW5nIFpoYW5nIDxIYXdraW5nLlpoYW5nQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IEFsZXgg
RGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9nZnhfdjEwXzAuYyB8IDEwICsrLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAy
IGluc2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvZ2Z4X3YxMF8wLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9n
ZnhfdjEwXzAuYwppbmRleCBlNmMwZmQ2N2EwZjkuLmE0NTk4MmY1NmUyOSAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3YxMF8wLmMKKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvZ2Z4X3YxMF8wLmMKQEAgLTEwOTEsMTggKzEwOTEsMTIgQEAgc3RhdGlj
IHZvaWQgZ2Z4X3YxMF8wX2dwdV9lYXJseV9pbml0KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2
KQogCiAJc3dpdGNoIChhZGV2LT5hc2ljX3R5cGUpIHsKIAljYXNlIENISVBfTkFWSTEwOgotCQlh
ZGV2LT5nZnguY29uZmlnLm1heF9od19jb250ZXh0cyA9IDg7Ci0JCWFkZXYtPmdmeC5jb25maWcu
c2NfcHJpbV9maWZvX3NpemVfZnJvbnRlbmQgPSAweDIwOwotCQlhZGV2LT5nZnguY29uZmlnLnNj
X3ByaW1fZmlmb19zaXplX2JhY2tlbmQgPSAweDEwMDsKLQkJYWRldi0+Z2Z4LmNvbmZpZy5zY19o
aXpfdGlsZV9maWZvX3NpemUgPSAwOwotCQlhZGV2LT5nZnguY29uZmlnLnNjX2Vhcmx5el90aWxl
X2ZpZm9fc2l6ZSA9IDB4NEMwOwotCQlnYl9hZGRyX2NvbmZpZyA9IFJSRUczMl9TT0MxNShHQywg
MCwgbW1HQl9BRERSX0NPTkZJRyk7Ci0JCWJyZWFrOwogCWNhc2UgQ0hJUF9OQVZJMTQ6CisJY2Fz
ZSBDSElQX05BVkkxMjoKIAkJYWRldi0+Z2Z4LmNvbmZpZy5tYXhfaHdfY29udGV4dHMgPSA4Owog
CQlhZGV2LT5nZnguY29uZmlnLnNjX3ByaW1fZmlmb19zaXplX2Zyb250ZW5kID0gMHgyMDsKIAkJ
YWRldi0+Z2Z4LmNvbmZpZy5zY19wcmltX2ZpZm9fc2l6ZV9iYWNrZW5kID0gMHgxMDA7Ci0JCWFk
ZXYtPmdmeC5jb25maWcuc2NfaGl6X3RpbGVfZmlmb19zaXplID0gMHgwOworCQlhZGV2LT5nZngu
Y29uZmlnLnNjX2hpel90aWxlX2ZpZm9fc2l6ZSA9IDA7CiAJCWFkZXYtPmdmeC5jb25maWcuc2Nf
ZWFybHl6X3RpbGVfZmlmb19zaXplID0gMHg0QzA7CiAJCWdiX2FkZHJfY29uZmlnID0gUlJFRzMy
X1NPQzE1KEdDLCAwLCBtbUdCX0FERFJfQ09ORklHKTsKIAkJYnJlYWs7Ci0tIAoyLjIwLjEKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFp
bGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
