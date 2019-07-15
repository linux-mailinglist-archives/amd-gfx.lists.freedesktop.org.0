Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 432CA69DF7
	for <lists+amd-gfx@lfdr.de>; Mon, 15 Jul 2019 23:24:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B997889DBD;
	Mon, 15 Jul 2019 21:24:49 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D38089DB8
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 21:24:48 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id r21so12891778qke.2
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 14:24:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wvqklVroowXEhJr4P4lZd/P0/8R/8rMKcmHkxt5wRqs=;
 b=PQaIQjyhKke6lQhuVrgvEOQ/8rgBHKz1oMH/poneBaWuCtpTY5oHnKQR4UUao7a49X
 Cgdgzx0iZIjJLE2A7hW0O2+K7sAEQWi8QdfS8awADAQcNYnz+jywXR03Eyexy8gszlPP
 rH7ACXp7DZ8zvEwCIURGhJ637ptMXjSwNZbSLuICInYr3Afb+O+lsmd72K+IWdBBpE40
 tkoaU4+jhnKS3h+/SmSW7GlulmQg8PtVTR9j9/9mfrzYkBlPpfHzhw+MUEiu2VMA3BS+
 AFb0ZS8KQI/t1sCczySJTb003tA9iSUOTk2kSk7sMnX/goKuhxYR3S2ORL8enXI4pEOd
 CSzA==
X-Gm-Message-State: APjAAAW0j3WHhtyEzitji28opjChC38jx5d1fG3v/s6e2xX1UowbCNFx
 ePNI85VVk0Tbv8GgiJl8BLPYi3Or
X-Google-Smtp-Source: APXvYqwQEqhH+IvTbowwoC/fkDKA2FS7adc9sd8eZX7CCyrAxnjGcTUIpAVxnbyrNzxrGhiCpXoi1g==
X-Received: by 2002:a37:e30b:: with SMTP id y11mr19533358qki.100.1563225887629; 
 Mon, 15 Jul 2019 14:24:47 -0700 (PDT)
Received: from localhost.localdomain ([71.219.21.119])
 by smtp.gmail.com with ESMTPSA id q56sm10274133qtq.64.2019.07.15.14.24.46
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 15 Jul 2019 14:24:47 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 005/102] drm/amdgpu: add Arcturus asic type
Date: Mon, 15 Jul 2019 16:23:00 -0500
Message-Id: <20190715212437.31793-3-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190715212437.31793-1-alexander.deucher@amd.com>
References: <20190715212437.31793-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wvqklVroowXEhJr4P4lZd/P0/8R/8rMKcmHkxt5wRqs=;
 b=NZLzQ5G4V4CLuYp/7ql94TsxppqUASCmqF4TZvLEdQHEfrtAXk9jSlAfQXVMxGFdvE
 3fwj0+XWCWz5AF8dVrQZJ4QcJfzgDiiUsJXrQAfOvf+w1sCHmCrC8u4KIh0JYDUSCXfJ
 WVr1f9iIFPgStAxozYFJO/Gp204KTLAloa+uf4ElKVUYSDO80VcisTvYac9FA424KL+L
 vFm7OUuKG13iHpue8M/YY3jfgiQKAehoZlLoie6OorngkFbR4O29UaBmx2kTOxUxybWT
 EDKo+vwUF/ECbnQPEsfprEH20BdQ5sDYo3h/wk66CvoOaOUzUjKMY48Yxs7YDlkb/5Y3
 SWjg==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Le Ma <le.ma@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogTGUgTWEgPGxlLm1hQGFtZC5jb20+CgpBZGQgYXNpYyB0eXBlIGZvciBBcmN0dXJ1cy4K
ClNpZ25lZC1vZmYtYnk6IExlIE1hIDxsZS5tYUBhbWQuY29tPgpSZXZpZXdlZC1ieTogSGF3a2lu
ZyBaaGFuZyA8SGF3a2luZy5aaGFuZ0BhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBBbGV4IERldWNo
ZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1X2RldmljZS5jIHwgMSArCiBpbmNsdWRlL2RybS9hbWRfYXNpY190eXBlLmgg
ICAgICAgICAgICAgICAgfCAxICsKIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCgpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jCmluZGV4IDA4NmQyZjNi
MGRiMy4uZjgyNTBhNzc2YjkzIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfZGV2aWNlLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
X2RldmljZS5jCkBAIC05OCw2ICs5OCw3IEBAIHN0YXRpYyBjb25zdCBjaGFyICphbWRncHVfYXNp
Y19uYW1lW10gPSB7CiAJIlZFR0ExMiIsCiAJIlZFR0EyMCIsCiAJIlJBVkVOIiwKKwkiQVJDVFVS
VVMiLAogCSJOQVZJMTAiLAogCSJOQVZJMTQiLAogCSJMQVNUIiwKZGlmZiAtLWdpdCBhL2luY2x1
ZGUvZHJtL2FtZF9hc2ljX3R5cGUuaCBiL2luY2x1ZGUvZHJtL2FtZF9hc2ljX3R5cGUuaAppbmRl
eCAwYzQ3NjZhZjA0YWYuLjBmNWExMmE5OTk0OCAxMDA2NDQKLS0tIGEvaW5jbHVkZS9kcm0vYW1k
X2FzaWNfdHlwZS5oCisrKyBiL2luY2x1ZGUvZHJtL2FtZF9hc2ljX3R5cGUuaApAQCAtNDksNiAr
NDksNyBAQCBlbnVtIGFtZF9hc2ljX3R5cGUgewogCUNISVBfVkVHQTEyLAogCUNISVBfVkVHQTIw
LAogCUNISVBfUkFWRU4sCisJQ0hJUF9BUkNUVVJVUywKIAlDSElQX05BVkkxMCwKIAlDSElQX05B
VkkxNCwKIAlDSElQX0xBU1QsCi0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vYW1kLWdmeA==
