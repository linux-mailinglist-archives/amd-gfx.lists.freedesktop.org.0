Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DCF4669E0D
	for <lists+amd-gfx@lfdr.de>; Mon, 15 Jul 2019 23:25:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D331889E2A;
	Mon, 15 Jul 2019 21:25:12 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66F4C89E2A
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 21:25:11 +0000 (UTC)
Received: by mail-qk1-x744.google.com with SMTP id r21so12892517qke.2
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 14:25:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=j1gK+eYc8+VUxeYOLZBmbL25ZM4rEWnRqlIGyMGiAis=;
 b=GwUAMY75IEtokuMrr2PS8eU4VdRXBgaDWRUKc2zz8q2Fpt0TPFq1wL7nJleelTnaXE
 6g/5C8OThHM3XZ3sX8f4AVlbUge+2TF8vnR4n38gZ92AbvdhKBw6erfrIh0hRhHYT1fH
 R2y/coIQhbQJReEKUDCYnsR9sOM2TX3WZMSR/+pPIMYdwMhhD50cxVKCaoEhIVwBbnhS
 yEI72tFwn6v3kAGBqbKDc60xS+1cbtJD9DFEghy+Lqr52NpCdmD5Fei7rMiIsW0ixImO
 WZ+4YVAve145w6f1Hikwflr5UIE4dzQrbSCC8fpi38XDJjAaKK3K9GC8NTwN3Y02kiSy
 MhKg==
X-Gm-Message-State: APjAAAW1upN+a7VobTw95AyFPMk6meW1v4VIlo42yoUn0q97sov2vKVg
 2pKXBwOfN5ENjGXaCf6aW19Hk79D
X-Google-Smtp-Source: APXvYqz5jKoLDMtfhmtnpt9Bd4lSNbZddPPQdqVVCHKk/IYrmAckfFoymjKDP+iEaeG3WatuoDUZ0g==
X-Received: by 2002:a37:c45:: with SMTP id 66mr18290649qkm.31.1563225910224;
 Mon, 15 Jul 2019 14:25:10 -0700 (PDT)
Received: from localhost.localdomain ([71.219.21.119])
 by smtp.gmail.com with ESMTPSA id q56sm10274133qtq.64.2019.07.15.14.25.09
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 15 Jul 2019 14:25:09 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 029/102] drm/amdgpu: skip to get 3D engine clockgating state
 for Arcturus
Date: Mon, 15 Jul 2019 16:23:24 -0500
Message-Id: <20190715212437.31793-27-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190715212437.31793-1-alexander.deucher@amd.com>
References: <20190715212437.31793-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=j1gK+eYc8+VUxeYOLZBmbL25ZM4rEWnRqlIGyMGiAis=;
 b=mngpbKy9a/H8I5mWyO6fcpgSTUX9NwGN6KOZKuHNWD027wtpk8dx8NkEZGzuJ9YBeu
 7mBPbj4OHilL1HAAOZkCeEMaKCbP0KGdKG1aRFTgcAGwZXy9Kf8IQq7AvIkHbmYCfJGH
 5iJ0wBoDUDxDSOHRyR+gNchc6jItAEUSzasQSAghjWyHI8zpKW/DZGgOqawykTvmauN/
 rjmphKIk/w3++jp7zIjqoyNircXz7oU0JRUso5u4HKxIR9W+ppOiHOCHY0LsB1WrlXdZ
 NQSJVk5+XswseKMQWYpMZwHakUfB5r/ijg5XBV2P0g5DuS9tuwHEWlyIouL13fZyTqhk
 NS7g==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Le Ma <le.ma@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogTGUgTWEgPGxlLm1hQGFtZC5jb20+CgpJdCdzIGJlY2F1c2UgQXJjdHVydXMgaGFzIG5v
dCAzRCBlbmdpbmUuCgpTaWduZWQtb2ZmLWJ5OiBMZSBNYSA8bGUubWFAYW1kLmNvbT4KUmV2aWV3
ZWQtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KU2lnbmVkLW9m
Zi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgotLS0KIGRyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92OV8wLmMgfCAxOCArKysrKysrKysrLS0tLS0tLS0K
IDEgZmlsZSBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92OV8wLmMgYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9nZnhfdjlfMC5jCmluZGV4IGM4NDQxOWY3MzUzNi4uZTBkYjBlY2Mz
MzRlIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjlfMC5jCisr
KyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92OV8wLmMKQEAgLTQzMzgsMTQgKzQz
MzgsMTYgQEAgc3RhdGljIHZvaWQgZ2Z4X3Y5XzBfZ2V0X2Nsb2NrZ2F0aW5nX3N0YXRlKHZvaWQg
KmhhbmRsZSwgdTMyICpmbGFncykKIAlpZiAoZGF0YSAmIENQX01FTV9TTFBfQ05UTF9fQ1BfTUVN
X0xTX0VOX01BU0spCiAJCSpmbGFncyB8PSBBTURfQ0dfU1VQUE9SVF9HRlhfQ1BfTFMgfCBBTURf
Q0dfU1VQUE9SVF9HRlhfTUdMUzsKIAotCS8qIEFNRF9DR19TVVBQT1JUX0dGWF8zRF9DR0NHICov
Ci0JZGF0YSA9IFJSRUczMl9TT0MxNShHQywgMCwgbW1STENfQ0dDR19DR0xTX0NUUkxfM0QpOwot
CWlmIChkYXRhICYgUkxDX0NHQ0dfQ0dMU19DVFJMXzNEX19DR0NHX0VOX01BU0spCi0JCSpmbGFn
cyB8PSBBTURfQ0dfU1VQUE9SVF9HRlhfM0RfQ0dDRzsKLQotCS8qIEFNRF9DR19TVVBQT1JUX0dG
WF8zRF9DR0xTICovCi0JaWYgKGRhdGEgJiBSTENfQ0dDR19DR0xTX0NUUkxfM0RfX0NHTFNfRU5f
TUFTSykKLQkJKmZsYWdzIHw9IEFNRF9DR19TVVBQT1JUX0dGWF8zRF9DR0xTOworCWlmIChhZGV2
LT5hc2ljX3R5cGUgIT0gQ0hJUF9BUkNUVVJVUykgeworCQkvKiBBTURfQ0dfU1VQUE9SVF9HRlhf
M0RfQ0dDRyAqLworCQlkYXRhID0gUlJFRzMyX1NPQzE1KEdDLCAwLCBtbVJMQ19DR0NHX0NHTFNf
Q1RSTF8zRCk7CisJCWlmIChkYXRhICYgUkxDX0NHQ0dfQ0dMU19DVFJMXzNEX19DR0NHX0VOX01B
U0spCisJCQkqZmxhZ3MgfD0gQU1EX0NHX1NVUFBPUlRfR0ZYXzNEX0NHQ0c7CisKKwkJLyogQU1E
X0NHX1NVUFBPUlRfR0ZYXzNEX0NHTFMgKi8KKwkJaWYgKGRhdGEgJiBSTENfQ0dDR19DR0xTX0NU
UkxfM0RfX0NHTFNfRU5fTUFTSykKKwkJCSpmbGFncyB8PSBBTURfQ0dfU1VQUE9SVF9HRlhfM0Rf
Q0dMUzsKKwl9CiB9CiAKIHN0YXRpYyB1NjQgZ2Z4X3Y5XzBfcmluZ19nZXRfcnB0cl9nZngoc3Ry
dWN0IGFtZGdwdV9yaW5nICpyaW5nKQotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2FtZC1nZng=
