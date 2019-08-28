Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A308A060B
	for <lists+amd-gfx@lfdr.de>; Wed, 28 Aug 2019 17:19:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF05D891B3;
	Wed, 28 Aug 2019 15:19:54 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B543891B3
 for <amd-gfx@lists.freedesktop.org>; Wed, 28 Aug 2019 15:19:53 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id y26so3438020qto.4
 for <amd-gfx@lists.freedesktop.org>; Wed, 28 Aug 2019 08:19:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QSAWwKhSI5fW6td7pjwg9ze8kGkamo4IM5IZDzYHCQs=;
 b=XL9oIGdXAgoyPaUS3zt4VFSXIFvtRip01XFXZKwIbvWp+FXEcZEfOd85ICnXMvubM8
 uqP1KSYeQ2K+HqYBcrJbWydyY9EgPX63ALzj/OrxGTZpYsP1N0EA5/5pa3k7ZK9rGKhG
 dPLXxCn3tfObUiNo2MznMPa2yUjVypZBW+aZ5jrwdhsB6j1M10QvkhmN42q1MZIsdLuF
 GotceJ6Ij+UaBaZE3zD5O/g5BxvnzX6mjC66SAREH1k+H4TFZBW1hGJTx7n5be6g82RA
 M3b7/mbhBgjxEERW7mG4DQe+T8DdSi32WBJ0erIIs9PMaTQqJvwJGghnVLMWU6rkOjX1
 Pvdg==
X-Gm-Message-State: APjAAAVr0tyBQIXA1fxIdXLwfGrrN4+3stRpPwsBRFGWKEsd3d2PTJxJ
 j3A3VakFPYfjUGIOA1//Jv+h5C/Z
X-Google-Smtp-Source: APXvYqzL3UUWRlU4XVB+pT9AFFxq+yJjiVFG5w7qxWMrY3wDewRFkym2Q+ITPfNmCtEPvkEAPrSx1Q==
X-Received: by 2002:aed:2e02:: with SMTP id j2mr4563607qtd.89.1567005592354;
 Wed, 28 Aug 2019 08:19:52 -0700 (PDT)
Received: from localhost.localdomain ([71.219.73.178])
 by smtp.gmail.com with ESMTPSA id n20sm1259429qtp.69.2019.08.28.08.19.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Aug 2019 08:19:51 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 1/4] drm/amdgpu: Initialize and update SDMA power gating
Date: Wed, 28 Aug 2019 10:19:40 -0500
Message-Id: <20190828151943.3619-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QSAWwKhSI5fW6td7pjwg9ze8kGkamo4IM5IZDzYHCQs=;
 b=Q5FxjQA5K4x1HFitwMt4S0SwyNuCkuFfEto/oTaObDxyeLiv9Nq2Vd1tcJyhN6blW9
 B6RIKH0RjQLMkQYftEV03Se+3WighM0REOquJYrRjZKGZGgrg8rBJIpm7fzLXeUEboFN
 /mnLPYELtcJmSSor492OTbn0H/wHwezD2LXGxRbIAtfC8sIKjKjrNsJ4NRyaGzw6pWR0
 /h3C1IsRBxu1FfU7tjr3HcqqgSFIi+QfA42p8gslpMNXVp84rkaXXJkY2bp/wggulwG1
 UP1r+35ET5YhXwEGgF31ENZzd0ERxzM382uEJ6nloNBzmmnQt7z44fHjrfBtmQQBq30Z
 m8dg==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Prike Liang <Prike.Liang@amd.com>,
 Aaron Liu <aaron.liu@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogUHJpa2UgTGlhbmcgPFByaWtlLkxpYW5nQGFtZC5jb20+CgpJbml0IFNETUEgSFcgYmFz
ZSBjb25maWd1cmF0aW9uIGFuZCBlbmFibGUgaWRsZSBJTlQgZm9yIHJuLgoKU2lnbmVkLW9mZi1i
eTogUHJpa2UgTGlhbmcgPFByaWtlLkxpYW5nQGFtZC5jb20+ClJldmlld2VkLWJ5OiBBYXJvbiBM
aXUgPGFhcm9uLmxpdUBhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhh
bmRlci5kZXVjaGVyQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc2Rt
YV92NF8wLmMgfCAxICsKIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQoKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NkbWFfdjRfMC5jIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvc2RtYV92NF8wLmMKaW5kZXggNzc1MGIzNzU3MzNiLi44OGIzOWI4YmY1
MzYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NkbWFfdjRfMC5jCisr
KyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NkbWFfdjRfMC5jCkBAIC0xMjAzLDYgKzEy
MDMsNyBAQCBzdGF0aWMgdm9pZCBzZG1hX3Y0XzBfaW5pdF9wZyhzdHJ1Y3QgYW1kZ3B1X2Rldmlj
ZSAqYWRldikKIAogCXN3aXRjaCAoYWRldi0+YXNpY190eXBlKSB7CiAJY2FzZSBDSElQX1JBVkVO
OgorCWNhc2UgQ0hJUF9SRU5PSVI6CiAJCXNkbWFfdjRfMV9pbml0X3Bvd2VyX2dhdGluZyhhZGV2
KTsKIAkJc2RtYV92NF8xX3VwZGF0ZV9wb3dlcl9nYXRpbmcoYWRldiwgdHJ1ZSk7CiAJCWJyZWFr
OwotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
