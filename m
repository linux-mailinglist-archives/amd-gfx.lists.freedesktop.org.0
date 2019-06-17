Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC1A048EC9
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:28:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C63F8999A;
	Mon, 17 Jun 2019 19:28:01 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAFE18994A
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:27:56 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id x47so12178537qtk.11
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:27:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YXRtVWrfRC1zaTVrzgsdeyzrBzb3Q1obUgzOi+baUmQ=;
 b=il/o+SNYdvwqWa2fYUvJ9nKOWkk2rIWe9GXp+yJCVXa4mTB3P1WR7p83gI4aDY1YzP
 A+edz0ApBlUI+9jpeEOgLxfirEV4UdHNpJEsfDlbQajPSU7a/J+vt8ncYkfjlW6TfX5Z
 OwU6qGXi1QveVGaj91iPrIAj4LCbdQ52vGSojymEcQJIMQ6aD/cKN4ASfyO2Rf+HZ3Ul
 EjQF+KO6IxhLmTNl+lU1wvcvPQU/TxP8Iw3e45YMjgKR5LWs17kg79y0DnElCYYzvYmw
 2pXytc11kOCiErxg+E7C5FGVYL82z3AZxU8Fyna/DuszeBT+fTy4MRPElLMGGX8KVKUo
 1oaw==
X-Gm-Message-State: APjAAAV5OcTyHvrjqLxnd5r4/m+NhjutSgfzkBwVvE+NECn0za+Ih/Tz
 VTDxCJTaxNhaYQXHjmkU/7+yzcHPITA=
X-Google-Smtp-Source: APXvYqyPwUmOpqn4pTCLNOQEkQ76T+rpTMsto00z6jMy3gLPkoTnm9Zkmv//nHWcCA4eB9XYGE1fGQ==
X-Received: by 2002:ac8:488f:: with SMTP id i15mr71109335qtq.32.1560799675721; 
 Mon, 17 Jun 2019 12:27:55 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id p37sm7715622qtc.35.2019.06.17.12.27.54
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:27:55 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 145/459] drm/amd/powerplay: set smu v11 funcs for navi10
Date: Mon, 17 Jun 2019 14:26:10 -0500
Message-Id: <20190617192704.18038-46-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617192704.18038-1-alexander.deucher@amd.com>
References: <20190617192704.18038-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YXRtVWrfRC1zaTVrzgsdeyzrBzb3Q1obUgzOi+baUmQ=;
 b=EmFDZgJtsakiiagzWILIeqBK+s9SX4d7RyoOvknIU2ph53w8JOzdCcyYFd8TGHzy1L
 +Ih6TDCqSFAJJo5FwNEIrdyPY1k6ICm2u9kb2YcuKJ93vq5nW8Umx4p8cWdLIScv0QlR
 C/uShXOuIMKlw2k0ibVcbWPYyqQrChbEGdicP7hrdSJcHFWqL2+Qhki7nkP72zutG2uz
 6Ma2z4FuFEof0Vamv++6mEztMrpXVMsaViIx7sY9emEfMxRUGECzSpNWefMn3zMlpXgW
 WcxjjM0mp2VNFMjZO9mM00spY3LP1izBc+dBxOHvASAlZTlFrzU4UNeXvfRozf5kX0TK
 DOtw==
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
 Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSHVhbmcgUnVpIDxyYXkuaHVhbmdAYW1kLmNvbT4KCk5haXYxMCBhbHNvIHVzZXMgc211
IHYxMSBmdW5jdGlvbnMuCgpTaWduZWQtb2ZmLWJ5OiBIdWFuZyBSdWkgPHJheS5odWFuZ0BhbWQu
Y29tPgpSZXZpZXdlZC1ieTogSGF3a2luZyBaaGFuZyA8SGF3a2luZy5aaGFuZ0BhbWQuY29tPgpT
aWduZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Ci0t
LQogZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvYW1kZ3B1X3NtdS5jIHwgMSArCiAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL3Bvd2VycGxheS9hbWRncHVfc211LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxh
eS9hbWRncHVfc211LmMKaW5kZXggMzAyNmM3ZTJkM2VhLi5hM2E2MDk5YWI4Y2QgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2FtZGdwdV9zbXUuYworKysgYi9kcml2
ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9hbWRncHVfc211LmMKQEAgLTMzMCw2ICszMzAsNyBA
QCBzdGF0aWMgaW50IHNtdV9zZXRfZnVuY3Moc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCiAK
IAlzd2l0Y2ggKGFkZXYtPmFzaWNfdHlwZSkgewogCWNhc2UgQ0hJUF9WRUdBMjA6CisJY2FzZSBD
SElQX05BVkkxMDoKIAkJYWRldi0+cG0ucHBfZmVhdHVyZSAmPSB+UFBfR0ZYT0ZGX01BU0s7CiAJ
CWlmIChhZGV2LT5wbS5wcF9mZWF0dXJlICYgUFBfT1ZFUkRSSVZFX01BU0spCiAJCQlzbXUtPm9k
X2VuYWJsZWQgPSB0cnVlOwotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2FtZC1nZng=
