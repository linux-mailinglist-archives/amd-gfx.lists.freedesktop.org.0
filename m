Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA44F5D762
	for <lists+amd-gfx@lfdr.de>; Tue,  2 Jul 2019 22:29:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD74B6E05A;
	Tue,  2 Jul 2019 20:29:14 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D3D26E056
 for <amd-gfx@lists.freedesktop.org>; Tue,  2 Jul 2019 20:29:12 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id p144so15463558qke.11
 for <amd-gfx@lists.freedesktop.org>; Tue, 02 Jul 2019 13:29:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TNsiZ0S5rqnMOxQLd/531rucCPdROam4NZCrVoCkjWg=;
 b=rYrOXi7XTIdjg7h/b3l1t3+vGGx/++lLhiiiDRzKYZYJGc9opKsqqnAXVfLjI7URLs
 qC7LnOSrL0vMcuuocEp5JxvqQNv3agRQjfHgvTYMudAd+DqNozMnLG1zyxyUtn1HuQyl
 7vr1fQs+/wyEWPrLOAWClUKEU+ixefg+IwE2I3aIHJ/u2XOv3ZMr8toRvIVcTI3PulI9
 mm9Cp7EIG/WP298mip+nuP5iM5a9RRCf5F+DBPhNQMcP4j+hQ9n3811guLM91SHgK5OG
 C6Js/6YZXTkCwqFW5KWRqW3963rlQwb1bW39pR9uN00m2wZSkySBAJt7pQ9M6VEQ0Zzl
 rsag==
X-Gm-Message-State: APjAAAXE1iH68VS4gcBy+C2l9S5gdjSQhE4hIdgYf+OHUgwoVBC1D09i
 HAr84/QXmKaK29B5bc9FLUUrGZc5/gM=
X-Google-Smtp-Source: APXvYqzDY/tinPe4o7oawFYDKaVmRP/0fMrowPRvvGY78PuNtzgL330SpofJCsjlpK8mpgkARshblg==
X-Received: by 2002:a37:e316:: with SMTP id y22mr1106271qki.493.1562099351647; 
 Tue, 02 Jul 2019 13:29:11 -0700 (PDT)
Received: from localhost.localdomain ([71.219.67.210])
 by smtp.gmail.com with ESMTPSA id h40sm20342qth.4.2019.07.02.13.29.10
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 02 Jul 2019 13:29:11 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 18/53] drm/amdgpu: add me/mec configurations for navi14
Date: Tue,  2 Jul 2019 15:28:09 -0500
Message-Id: <20190702202844.17001-19-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190702202844.17001-1-alexander.deucher@amd.com>
References: <20190702202844.17001-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TNsiZ0S5rqnMOxQLd/531rucCPdROam4NZCrVoCkjWg=;
 b=aLOdJFqVfLSRAUQ9PW1omaQ9sZf86Q8Q7tx6qimiBq8Ffei9zzC+jY6rMrPZ7yXsoO
 CnuvGeQMUWsLkQJ8CnyoiNLiPOd1oFlGChlfn9eUZABYjW//AjVQfjDN9TDaeYR5GNu1
 gQKVUJDMdvvSnfTobmkoR4oyAD0UOl0MzQE2tBLeFCU+qXgcR9lUxBuR77IsgfjbyWfB
 SB3rcyExBawzAisO11DM78CKSEy3Y4WtM3x3ezhh1KHVpNeWB9CUBQjAYGpctwFjpeQT
 ktZSvXhnBGkiiVxS88IAlGqm9azGGSb3KCPjO+iXEYKJjaL4t4YJ4ZqEEGvNUr6kG586
 MPZw==
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

RnJvbTogWGlhb2ppZSBZdWFuIDx4aWFvamllLnl1YW5AYW1kLmNvbT4KCkFkZCBuYXZpMTQgdG8g
YXBwcm9wcmlhdGUgY2FzZXMuCgpTaWduZWQtb2ZmLWJ5OiBYaWFvamllIFl1YW4gPHhpYW9qaWUu
eXVhbkBhbWQuY29tPgpSZXZpZXdlZC1ieTogSGF3a2luZyBaaGFuZyA8SGF3a2luZy5aaGFuZ0Bh
bWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFt
ZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3YxMF8wLmMgfCAxICsK
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2dmeF92MTBfMC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
Z2Z4X3YxMF8wLmMKaW5kZXggNmY3YTc1MTM3YWMxLi5iODM5MDgzZTRiODYgMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92MTBfMC5jCisrKyBiL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2dmeF92MTBfMC5jCkBAIC0xMTUwLDYgKzExNTAsNyBAQCBzdGF0aWMg
aW50IGdmeF92MTBfMF9zd19pbml0KHZvaWQgKmhhbmRsZSkKIAogCXN3aXRjaCAoYWRldi0+YXNp
Y190eXBlKSB7CiAJY2FzZSBDSElQX05BVkkxMDoKKwljYXNlIENISVBfTkFWSTE0OgogCQlhZGV2
LT5nZngubWUubnVtX21lID0gMTsKIAkJYWRldi0+Z2Z4Lm1lLm51bV9waXBlX3Blcl9tZSA9IDI7
CiAJCWFkZXYtPmdmeC5tZS5udW1fcXVldWVfcGVyX3BpcGUgPSAxOwotLSAKMi4yMC4xCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxp
bmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
