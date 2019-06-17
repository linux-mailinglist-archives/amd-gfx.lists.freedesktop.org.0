Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE92348DE5
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:17:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7839989310;
	Mon, 17 Jun 2019 19:17:44 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CF8F892EA
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:17:39 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id n11so12171305qtl.5
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:17:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VWiOeKWxOsOqoDyrOsUt1/fp9sdy3jy0YknUL0xmhoA=;
 b=KeD372FE/rP5QoA+GlmMmZyBH/CtPLaFVFucr7+Z5nxrs8f4fy6L9L14Plk7MDoUtF
 89IfB6XqxJuWiJFJ0Za8PUhkESdzilX65PAatCz9EhdoUZjKjgAra0IsJJO3ZZ2sT7iP
 TJn0bGu+vWJ4SWpiWkx+zR2VnQbd6bCxncmVHbT5X1kUf9i1I4SaimP0OMdZK7MCOBBT
 QB5W1mAxWv3Im+PE25s6QwHcT8IgFwXVHXUIhvfuYgonUfHC1wNrkVmIKJ6VciZyj1j9
 P6MTfePLhUPhIl0WrvlKnBChMhuwUMHHY+lkpsORfN2J1vKWw46fupUR77z9eQRWIdZc
 t4VQ==
X-Gm-Message-State: APjAAAVZj3za3h0UsB8eLZZbUuHHcwuibe7TrMsnPbii3n+I/hw3LVqp
 mDvxUyB7FqN2G2ODbvycfR3rlcD5fXQ=
X-Google-Smtp-Source: APXvYqyFIAyPt9343QcevYbWS27f8I433ocQ1BLdJusi9Ab2hgDcJ4XZmxY2ykXOBBhCE2sGYDXQUw==
X-Received: by 2002:a0c:9230:: with SMTP id a45mr22904707qva.188.1560799058637; 
 Mon, 17 Jun 2019 12:17:38 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id s35sm7754876qth.79.2019.06.17.12.17.37
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:17:38 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 035/459] drm/amdgpu/gfx10: new approach to load gfx10 me fw
 (v4)
Date: Mon, 17 Jun 2019 14:09:56 -0500
Message-Id: <20190617191700.17899-24-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617191700.17899-1-alexander.deucher@amd.com>
References: <20190617191700.17899-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VWiOeKWxOsOqoDyrOsUt1/fp9sdy3jy0YknUL0xmhoA=;
 b=bbMF/TNNG3+5hQbRl5r+9wnX1c6YkFu9yLgxG+Ebp7htrRVhScrO6X4JWaGip3haNu
 3Ws/U6XHxdqMt2Sy5bGKaVwZu+r3O1PXDbQ9Mx7nfM73U7n8sgEtOMfTg5R5MEjbPfLX
 nKKoQEfiVYsPSeA5pe8QTU+3ttl5Zrb+91o2LSziWrzc6mhshmq9MlbCB9MVKnzs2pd4
 8nTgvA6Wni/fxWj32UX35u2MYRo6TE6RZl/KXp9+VeKtpTAQq35JMQQWRx9ZkvWHoUfP
 aY4U3ZtfgzfmRGFYoOu3IKPQABPtlZXxmHFdA60SeNQHE0WiBTxxm2mP8HUA5LXXWdSo
 oe5w==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Huang Rui <ray.huang@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Evan Quan <evan.quan@amd.com>, Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSGF3a2luZyBaaGFuZyA8SGF3a2luZy5aaGFuZ0BhbWQuY29tPgoKZ2Z4MTAgYWxsb3dz
IHRvIG9ubHkgdXBsb2FkIG1lIGp1bXB0YWJsZSB3aGlsZSBzYXZlIHRoZSB3aG9sZQptZSBpbWFn
ZSBhdCBndHQgbWVtb3J5LgoKdjI6IHByb2dyYW0gQ1BfTUVfSUNfQkFTRV9DTlRMIHRvIGRlZmF1
bHQgdmFsdWUKdjM6IHN3aXRjaCB0byB1c2UgYW1kZ3B1X2JvX2NyZWF0ZV9yZXNlcnZlZCB0byBj
cmVhdGUgbWUgZncgYm8KdjQ6IHNwbGl0IGNvbW1vbiBjb2RlIGZyb20gZ2Z4MTAgY29kZQoKU2ln
bmVkLW9mZi1ieTogSGF3a2luZyBaaGFuZyA8SGF3a2luZy5aaGFuZ0BhbWQuY29tPgpSZXZpZXdl
ZC1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgpBY2tlZC1ieTog
SHVhbmcgUnVpIDxyYXkuaHVhbmdAYW1kLmNvbT4KUmV2aWV3ZWQtYnk6IEV2YW4gUXVhbiA8ZXZh
bi5xdWFuQGFtZC5jb20+CkFja2VkLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29l
bmlnQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNo
ZXJAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZ2Z4Lmgg
fCA3ICsrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZ2Z4LmggYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfZ2Z4LmgKaW5kZXggODVjYjBlMDc1NWJiLi45ZDBlZjZhNmFh
YjYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9nZnguaAor
KysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZ2Z4LmgKQEAgLTIwNywxMiAr
MjA3LDE5IEBAIHN0cnVjdCBhbWRncHVfY2UgewogCXVpbnQzMl90CQkJKmNlX2Z3X3B0cjsKIH07
CiAKK3N0cnVjdCBhbWRncHVfbWUgeworCXN0cnVjdCBhbWRncHVfYm8JCSptZV9md19vYmo7CisJ
dWludDY0X3QJCQltZV9md19ncHVfYWRkcjsKKwl1aW50MzJfdAkJCSptZV9md19wdHI7Cit9Owor
CiBzdHJ1Y3QgYW1kZ3B1X2dmeCB7CiAJc3RydWN0IG11dGV4CQkJZ3B1X2Nsb2NrX211dGV4Owog
CXN0cnVjdCBhbWRncHVfZ2Z4X2NvbmZpZwljb25maWc7CiAJc3RydWN0IGFtZGdwdV9ybGMJCXJs
YzsKIAlzdHJ1Y3QgYW1kZ3B1X3BmcAkJcGZwOwogCXN0cnVjdCBhbWRncHVfY2UJCWNlOworCXN0
cnVjdCBhbWRncHVfbWUJCW1lOwogCXN0cnVjdCBhbWRncHVfbWVjCQltZWM7CiAJc3RydWN0IGFt
ZGdwdV9raXEJCWtpcTsKIAlzdHJ1Y3QgYW1kZ3B1X3NjcmF0Y2gJCXNjcmF0Y2g7Ci0tIAoyLjIw
LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1n
ZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
