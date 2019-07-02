Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66FE95D760
	for <lists+amd-gfx@lfdr.de>; Tue,  2 Jul 2019 22:29:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA7816E055;
	Tue,  2 Jul 2019 20:29:11 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB12B6E047
 for <amd-gfx@lists.freedesktop.org>; Tue,  2 Jul 2019 20:29:10 +0000 (UTC)
Received: by mail-qk1-x742.google.com with SMTP id r6so15541489qkc.0
 for <amd-gfx@lists.freedesktop.org>; Tue, 02 Jul 2019 13:29:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AbQlPMQJM08V+1DuPIlGye3iJ8WRe5QENOzF/6o6tJc=;
 b=mmFiQaoU4WQvt09QIuqtbtVy98QVw0s9lgaX26CfDV6vRSc0RmHRZXtPLckaFHDbQa
 YO3zrQW1pUwqFs+K4/g9D8Ici/b59tbefxWJPOVo9F8UsZ9Dt1KlsoYyZ3fOnQdW0Byp
 m+6ylAOJ+CmdQByG4klUp1DbReLFg1RB/WDXmdxldFOVaiI944+fcuGEc/+D9KSTidCI
 0V/pCRGaVxkLTZ1ZWPxQyIHwwj9iJRCwVekZO6kIce0s5HZLPh+1oWioN2YIn1UwN1Vq
 xeI4oOzcS5eoiLKUcwCFypkruwMw+wcW3x9uLSuI6JecTykkraEcOppk87maFrGrnFtu
 xDOA==
X-Gm-Message-State: APjAAAWmT2L2jvJQJNdIKmi+5K/UD8rASEXIc38mMWhDAoZFAemivtvB
 HWp5hg+4N/etDnnkqBTh/oeKt8OKbo4=
X-Google-Smtp-Source: APXvYqzD3efMIr0q7KGQS8LrGVqoEmGZS9ZipMeHGu4wDyw+1q5hLhdJxNn0bRJtdLmZfiHCjBKUqQ==
X-Received: by 2002:a37:4ad7:: with SMTP id x206mr28117676qka.85.1562099349748; 
 Tue, 02 Jul 2019 13:29:09 -0700 (PDT)
Received: from localhost.localdomain ([71.219.67.210])
 by smtp.gmail.com with ESMTPSA id h40sm20342qth.4.2019.07.02.13.29.08
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 02 Jul 2019 13:29:09 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 16/53] drm/amdgpu/gfx10: add gfx config for navi14
Date: Tue,  2 Jul 2019 15:28:07 -0500
Message-Id: <20190702202844.17001-17-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190702202844.17001-1-alexander.deucher@amd.com>
References: <20190702202844.17001-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AbQlPMQJM08V+1DuPIlGye3iJ8WRe5QENOzF/6o6tJc=;
 b=UaAa0jWifoWwwoxHKUWy6/9Qqi3sWoaJPs3hGLVWU2k5b2ZKDOUYNPfdbBi29c/DMw
 47tCCxyZUOhFj4VTAO9G8cfNBFXsoA49zVQf5xhFpGGDusvcMz9Pp4Kp9JECOh0oKXHQ
 BfFBZ9g7AX9A/AJ+ynInKrIJE/1aevlEtiCE9qALCuAYeY+3bB9Zfr8EQtUyzDbrS3So
 /2hQeGIjCCX/JCznO0i3xTLCJE7GfZ5n6HH0A8zRyuxWAqa/+nZs+rbH6xWjz6zGdL5F
 08EmpThjPtxLIoRFphk3zutp/NE45GusCEoZQYqc9xen1MD314/QGcY5RJ28E4WUB+Dy
 WlAw==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Jack Xiao <Jack.Xiao@amd.com>,
 Xiaojie Yuan <xiaojie.yuan@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogWGlhb2ppZSBZdWFuIDx4aWFvamllLnl1YW5AYW1kLmNvbT4KCkFkZCBnZnggY29uZmln
IGRldGFpbHMgZm9yIG5hdmkxNC4KClNpZ25lZC1vZmYtYnk6IFhpYW9qaWUgWXVhbiA8eGlhb2pp
ZS55dWFuQGFtZC5jb20+ClJldmlld2VkLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVj
aGVyQGFtZC5jb20+ClJldmlld2VkLWJ5OiBKYWNrIFhpYW8gPEphY2suWGlhb0BhbWQuY29tPgpT
aWduZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Ci0t
LQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3YxMF8wLmMgfCA4ICsrKysrKysrCiAx
IGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvZ2Z4X3YxMF8wLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9n
ZnhfdjEwXzAuYwppbmRleCBkMDQ1YTdkOTAxMDQuLmRkMjQzNDA2ZmNmNCAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3YxMF8wLmMKKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvZ2Z4X3YxMF8wLmMKQEAgLTEwNDIsNiArMTA0MiwxNCBAQCBzdGF0aWMg
dm9pZCBnZnhfdjEwXzBfZ3B1X2Vhcmx5X2luaXQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYp
CiAJCWFkZXYtPmdmeC5jb25maWcuc2NfZWFybHl6X3RpbGVfZmlmb19zaXplID0gMHg0QzA7CiAJ
CWdiX2FkZHJfY29uZmlnID0gUlJFRzMyX1NPQzE1KEdDLCAwLCBtbUdCX0FERFJfQ09ORklHKTsK
IAkJYnJlYWs7CisJY2FzZSBDSElQX05BVkkxNDoKKwkJYWRldi0+Z2Z4LmNvbmZpZy5tYXhfaHdf
Y29udGV4dHMgPSA4OworCQlhZGV2LT5nZnguY29uZmlnLnNjX3ByaW1fZmlmb19zaXplX2Zyb250
ZW5kID0gMHgyMDsKKwkJYWRldi0+Z2Z4LmNvbmZpZy5zY19wcmltX2ZpZm9fc2l6ZV9iYWNrZW5k
ID0gMHgxMDA7CisJCWFkZXYtPmdmeC5jb25maWcuc2NfaGl6X3RpbGVfZmlmb19zaXplID0gMHg4
MDsKKwkJYWRldi0+Z2Z4LmNvbmZpZy5zY19lYXJseXpfdGlsZV9maWZvX3NpemUgPSAweDRDMDsK
KwkJZ2JfYWRkcl9jb25maWcgPSBSUkVHMzJfU09DMTUoR0MsIDAsIG1tR0JfQUREUl9DT05GSUcp
OworCQlicmVhazsKIAlkZWZhdWx0OgogCQlCVUcoKTsKIAkJYnJlYWs7Ci0tIAoyLjIwLjEKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFp
bGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
