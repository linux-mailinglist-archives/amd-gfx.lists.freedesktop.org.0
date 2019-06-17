Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4937248ED0
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:28:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 613B4899D6;
	Mon, 17 Jun 2019 19:28:06 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EA0F899C7
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:28:04 +0000 (UTC)
Received: by mail-qk1-x744.google.com with SMTP id l128so6962136qke.2
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:28:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vSSseUGXnTtiD6LhY2FwTpZ3DxDpLPTSNklk+Lik/H8=;
 b=ae3+kXr6m+zTfu9HRUB7su64zMXKo2hNySvzIORtJLTYIUckkKcFdNFW7uRUAa6Ox7
 oHEn1G6fhnyGtnEYUlYmWR9+uFB/ZPF3I1RQgZwaFdJlDLCAO5WQBImJZUnz01201cCj
 XcNcjZxP6JNlA+gV+WXhgednk1lXeuI/0peWtQvWQg6Kn/ByOPCbO2CoT5r6kFYkqqrT
 dioKnHqd8uVVCcAAjIjvTKAedHUrpfhvN3HBTp8aVrIx2L63rSrXhdZlgog42RiRBU5o
 FbNzxs/8/mbkF6rrShfJLSysOsSmBwqQSDmwGcjRTy6s/LkceRuWEs7jCbMaMm3XviN0
 r/hQ==
X-Gm-Message-State: APjAAAWfpXrT5SZTbW9SHKGhjmnzV0FpejzObtApSQNyh05YmuzKpdBt
 NVpWBnV0uo/2Yokco0jW7WwvMzXpl0I=
X-Google-Smtp-Source: APXvYqyx8XIbKXju7Z+AXDPVhymXpFk/qDGnGQrCVj9hNOncX9hL/NLwOeD6N5dxP5G9iynTabGYiQ==
X-Received: by 2002:a05:620a:16b2:: with SMTP id
 s18mr84218017qkj.323.1560799683308; 
 Mon, 17 Jun 2019 12:28:03 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id p37sm7715622qtc.35.2019.06.17.12.28.02
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:28:02 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 154/459] drm/amd/powerplay: modify the feature mask to enable
 gfx/soc dpm
Date: Mon, 17 Jun 2019 14:26:19 -0500
Message-Id: <20190617192704.18038-55-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617192704.18038-1-alexander.deucher@amd.com>
References: <20190617192704.18038-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vSSseUGXnTtiD6LhY2FwTpZ3DxDpLPTSNklk+Lik/H8=;
 b=DW3q+rHyB0JtHm5Jm+VgV6KZzis2+TK3s/Y4knMYVPwLqIulx1HJREGxWXbzbezPfX
 qy3OaGOZaw10q65wK64KmMvFhSMlnev9PQGCx2oe/HrjH35GLXnpTpdotYC/iIiRwTuY
 tBO8xQazLoQdhEddmINO2OuZoVEH7C/iXpeAUDmXQSQjrHowmBK7MzLyKpfuwaa1TKHS
 rTQ4CCr7bvzTQpvBWik4VTMFLmu4p2G/0of9A6QvRoMe+yBGQvAj5AL74WjlvRiOXvMg
 EbZbWJYmSEY00nrAbS4whRqyZjNofb98lro3bgobfW2ebZ1bPRLgVn1dlKOhbguRphnf
 tp8w==
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

RnJvbTogSHVhbmcgUnVpIDxyYXkuaHVhbmdAYW1kLmNvbT4KClNvIGZhciwgdGhlIGdmeC9zb2Mg
ZHBtIGlzIGVuYWJsZWQgd2l0aCBmZWF0dXJlIG1hc2sgc2V0LgoKU2lnbmVkLW9mZi1ieTogSHVh
bmcgUnVpIDxyYXkuaHVhbmdAYW1kLmNvbT4KUmV2aWV3ZWQtYnk6IEhhd2tpbmcgWmhhbmcgPEhh
d2tpbmcuWmhhbmdAYW1kLmNvbT4KU2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5k
ZXIuZGV1Y2hlckBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L25h
dmkxMF9wcHQuYyB8IDQgKystLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBk
ZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9u
YXZpMTBfcHB0LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9uYXZpMTBfcHB0LmMK
aW5kZXggYTk3MDcyY2MwMzk2Li4zMzI3YWYyMzc2ZDcgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvcG93ZXJwbGF5L25hdmkxMF9wcHQuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1k
L3Bvd2VycGxheS9uYXZpMTBfcHB0LmMKQEAgLTExOSw4ICsxMTksOCBAQCBuYXZpMTBfZ2V0X3Vu
YWxsb3dlZF9mZWF0dXJlX21hc2soc3RydWN0IHNtdV9jb250ZXh0ICpzbXUsCiAJaWYgKG51bSA+
IDIpCiAJCXJldHVybiAtRUlOVkFMOwogCi0JZmVhdHVyZV9tYXNrWzBdID0gMHgwQzY3Nzg0NDsK
LQlmZWF0dXJlX21hc2tbMV0gPSAweEZGRkZGRjI4OyAvKiBiaXQzMn5iaXQ2MyBpcyBVbnN1cHBv
cnRlZCAqLworCWZlYXR1cmVfbWFza1swXSA9IDB4ZmZmZmZmZTQ7CisJZmVhdHVyZV9tYXNrWzFd
ID0gMHhmZmZmZmZmZjsJLyogYml0MzJ+Yml0NjMgaXMgVW5zdXBwb3J0ZWQgKi8KIAogCXJldHVy
biAwOwogfQotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1n
Zng=
