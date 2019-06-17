Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EBE2D48F45
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:31:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E04FA89BBD;
	Mon, 17 Jun 2019 19:31:30 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4653189B98
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:31:23 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id s15so12211406qtk.9
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:31:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=M172DYn/pSou9N7GwmpqxKezIjphlnqiWaVNph+E5Iw=;
 b=YXOEjzXoZFnPlh+JHe8NDz4YpqokCR4gbENbEabkC9ANGVuD6g8ljvDvUiEuzAHpxq
 kiBtYIFveAwwlCrrCVuDpD+vCL4E983EApmpwaCvnqjPRvt5Edy2nLP+mXOaUWutn5dK
 3wDeI3BqNKkXEf5YkkZU4Dx8S/zbmoLFDlnSyzD2xQvSwvu7LIosR0U0KTvxQaTnxT7t
 9iyeOVbhY0hvTOOpX5S7UV4vhSHZBjWnimS5u+1FG5WA6ZLHLS2tbhp4z+HNps3Xc6e2
 givC23JvgLbO10N4+ep0PtJliSMJb9mbKZ8vEaD5YXE/qX8beqiKF+/lZiE4OqSzAysU
 JGxw==
X-Gm-Message-State: APjAAAVWKIo8fULO61jWRvXw1TzkLoAhT9MMC+xW9WkDP96pMLncbO/o
 HPY1EIFvRk5hnz/IlWzG8Vwuw5loDvc=
X-Google-Smtp-Source: APXvYqzDfC7Pj0ZqhDiAxR0wx1nCAoPz8EK/guXXuyuUcmnXS3Mt9I5PB77VfPy9lUp2po/M6hLKtA==
X-Received: by 2002:ac8:18fa:: with SMTP id o55mr37523224qtk.275.1560799881225; 
 Mon, 17 Jun 2019 12:31:21 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id u2sm7474875qtj.97.2019.06.17.12.31.20
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:31:20 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 208/459] drm/amdgpu/mes10.1: add mes firmware info fields
Date: Mon, 17 Jun 2019 14:29:35 -0500
Message-Id: <20190617193106.18231-9-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617193106.18231-1-alexander.deucher@amd.com>
References: <20190617193106.18231-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=M172DYn/pSou9N7GwmpqxKezIjphlnqiWaVNph+E5Iw=;
 b=KDcR672agVzbg9Udxz1/az5to09WVyj02HW7w508RWbl7y2HV6OI//NQ7M6O4SvOaj
 G0zanJFJiuWk9g+YSCi7HjinhSwCoBdyJK52yZj5IDwnzKhjwfslGDK2ULvgHQKyYLdn
 xi5PrHIxhAivA2qZYD01+CkOxrV/YBP8PF/7YHpXkR92cXUwuHSRdFHXbrivnheaH/nt
 9e6y/rBJQfTd0SgBkxwzdhfUNUoAYLJ8FKRzcMMHUBx26vIkc5kjWvGVyA5P8DXSWzlK
 ttnSR11DxUMWlSog+DMlpeGwZt32IzWhcp20ZLQHAHoILZjpc0G5Uyxx8/Oh2QBsFiT8
 zZew==
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
 Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSmFjayBYaWFvIDxKYWNrLlhpYW9AYW1kLmNvbT4KClRoZSBuZXdseSBhZGRlZCBmaWVs
ZHMgaXMgdG8gc3RvcmUgbWVzIGZpcm13YXJlIHJlbGF0ZWQgaW5mb3JtYXRpb24uCgpTaWduZWQt
b2ZmLWJ5OiBKYWNrIFhpYW8gPEphY2suWGlhb0BhbWQuY29tPgpSZXZpZXdlZC1ieTogSGF3a2lu
ZyBaaGFuZyA8SGF3a2luZy5aaGFuZ0BhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBBbGV4IERldWNo
ZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1X21lcy5oIHwgMTYgKysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQs
IDE2IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfbWVzLmggYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfbWVzLmgK
aW5kZXggNzg4MDg0MzEwZGQ1Li43OGZlNDkwMzM1NDMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9tZXMuaAorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHVfbWVzLmgKQEAgLTI5LDYgKzI5LDIyIEBAIHN0cnVjdCBhbWRncHVfbWVzX2Z1
bmNzOwogc3RydWN0IGFtZGdwdV9tZXMgewogCXN0cnVjdCBhbWRncHVfYWRldiAqYWRldjsKIAor
CWNvbnN0IHN0cnVjdCBmaXJtd2FyZSAgICAgICAgICAgKmZ3OworCisJLyogbWVzIHVjb2RlICov
CisJc3RydWN0IGFtZGdwdV9ibwkJKnVjb2RlX2Z3X29iajsKKwl1aW50NjRfdAkJCXVjb2RlX2Z3
X2dwdV9hZGRyOworCXVpbnQzMl90CQkJKnVjb2RlX2Z3X3B0cjsKKwl1aW50MzJfdCAgICAgICAg
ICAgICAgICAgICAgICAgIHVjb2RlX2Z3X3ZlcnNpb247CisJdWludDY0X3QgICAgICAgICAgICAg
ICAgICAgICAgICB1Y19zdGFydF9hZGRyOworCisJLyogbWVzIHVjb2RlIGRhdGEgKi8KKwlzdHJ1
Y3QgYW1kZ3B1X2JvCQkqZGF0YV9md19vYmo7CisJdWludDY0X3QJCQlkYXRhX2Z3X2dwdV9hZGRy
OworCXVpbnQzMl90CQkJKmRhdGFfZndfcHRyOworCXVpbnQzMl90ICAgICAgICAgICAgICAgICAg
ICAgICAgZGF0YV9md192ZXJzaW9uOworCXVpbnQ2NF90ICAgICAgICAgICAgICAgICAgICAgICAg
ZGF0YV9zdGFydF9hZGRyOworCiAJLyogaXAgc3BlY2lmaWMgZnVuY3Rpb25zICovCiAJc3RydWN0
IGFtZGdwdV9tZXNfZnVuY3MgKmZ1bmNzOwogfTsKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1k
LWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
