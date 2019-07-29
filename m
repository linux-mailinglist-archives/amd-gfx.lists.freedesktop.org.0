Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E299479973
	for <lists+amd-gfx@lfdr.de>; Mon, 29 Jul 2019 22:15:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3018589DDF;
	Mon, 29 Jul 2019 20:15:31 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-vs1-xe44.google.com (mail-vs1-xe44.google.com
 [IPv6:2607:f8b0:4864:20::e44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 310F489D6C
 for <amd-gfx@lists.freedesktop.org>; Mon, 29 Jul 2019 20:15:24 +0000 (UTC)
Received: by mail-vs1-xe44.google.com with SMTP id u3so41838557vsh.6
 for <amd-gfx@lists.freedesktop.org>; Mon, 29 Jul 2019 13:15:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xCXQNIpK08AkHDeu/fOQ1MVLxDsbXYdmWvFElel+Pvk=;
 b=SGV16Y58T72e3/Zsi5IC6LYSZwH2Ba0mCdyWjHVdMK6lexjkmSZaP0bXrTlQZtXXt3
 YRlb7YzDYqMUfgex4SO86kCg40//zpboyJeQqbbAoWldRrXC739GXBcKVCA1HsOOl5GQ
 S/JZ9D4qvOqH7quxwjJ9v+2RatvpYCksZ80HViVwdtDriDtdBPaBeGnMcv6lqHEGiko3
 4peoXGlTMrxLZdicdAZriJgp2VXU0eS1AWXj3GTbSAokZ7+V09gAovHKyyS2Lvxpm/QX
 wEe3w5abL3Qy9vaLCzAYZ3JLmk2IWHvosotoIhX+hEXFeYvWGxgFGGOsdISNjg4dWP3d
 +Yig==
X-Gm-Message-State: APjAAAV57C3r9Pun1IjWHKFl+SBJgvoS2E72NzFd/8nA74kqysTZpRL1
 LcErMV3X3HE2h0glcvSB0/eJsIMG
X-Google-Smtp-Source: APXvYqxJ6wkNnm9Q5Zxyg8Fl7hjChsk4hFM8OvXHXc5KMdC5bJq8kDXUnhHYbpY6Gjoe1HVseU/ZNw==
X-Received: by 2002:a67:6bc1:: with SMTP id g184mr20719035vsc.70.1564431323116; 
 Mon, 29 Jul 2019 13:15:23 -0700 (PDT)
Received: from localhost.localdomain ([71.51.160.180])
 by smtp.gmail.com with ESMTPSA id e3sm11384263vsp.6.2019.07.29.13.15.22
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 29 Jul 2019 13:15:22 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 04/30] drm/amd/powerplay: update arcturus_ppsmc.h
Date: Mon, 29 Jul 2019 15:14:42 -0500
Message-Id: <20190729201508.16136-5-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190729201508.16136-1-alexander.deucher@amd.com>
References: <20190729201508.16136-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xCXQNIpK08AkHDeu/fOQ1MVLxDsbXYdmWvFElel+Pvk=;
 b=PF/zGSFbBKmP3tS1lwWDL3tCjYPmKGeW4eyZEGZQlaCBiuZPUyd3NuVv1u6Y6rnUHr
 Dm2fICAxmmvulsFPLGpd4RIMiJ5w/1y6j/RD29Q/URwwhjznAtN2njELGFg287hnwtJy
 c8G9jR0WGsUGoSuw5PmCyS3gBVSTKRKFWhVjYMYiNxmcFhKr4bugiiwG2KJ39Dhe80Xr
 V5PeqQ0PkZv1rpm3tYLU5uIcygopX6zUAzT/hYN2gM+sYBW88j7WAjXdXsIlQwGgMLqL
 WTYua6ehAYfgf4/Z8R9HY9YDoeW3jsH0nDXZCqdgCh5KJB/cUnL+PHfX3p5dMXehpBeb
 DmZw==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Le Ma <Le.Ma@amd.com>,
 Evan Quan <evan.quan@amd.com>, Kenneth Feng <kenneth.feng@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogRXZhbiBRdWFuIDxldmFuLnF1YW5AYW1kLmNvbT4KCkNvcnJlY3QgaGVhZGVyIGFuZCBm
aXggdHlwby4KClNpZ25lZC1vZmYtYnk6IEV2YW4gUXVhbiA8ZXZhbi5xdWFuQGFtZC5jb20+ClJl
dmlld2VkLWJ5OiBMZSBNYSA8TGUuTWFAYW1kLmNvbT4KUmV2aWV3ZWQtYnk6IEtlbm5ldGggRmVu
ZyA8a2VubmV0aC5mZW5nQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxl
eGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxh
eS9pbmMvYXJjdHVydXNfcHBzbWMuaCB8IDQgKystLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0
aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L3Bvd2VycGxheS9pbmMvYXJjdHVydXNfcHBzbWMuaCBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93
ZXJwbGF5L2luYy9hcmN0dXJ1c19wcHNtYy5oCmluZGV4IGI4NmJiMmJjOGEzMS4uNzhlNTkyN2I3
NzExIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9pbmMvYXJjdHVy
dXNfcHBzbWMuaAorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9pbmMvYXJjdHVy
dXNfcHBzbWMuaApAQCAtMSw1ICsxLDUgQEAKIC8qCi0gKiBDb3B5cmlnaHQgMjAxOCBBZHZhbmNl
ZCBNaWNybyBEZXZpY2VzLCBJbmMuCisgKiBDb3B5cmlnaHQgMjAxOSBBZHZhbmNlZCBNaWNybyBE
ZXZpY2VzLCBJbmMuCiAgKgogICogUGVybWlzc2lvbiBpcyBoZXJlYnkgZ3JhbnRlZCwgZnJlZSBv
ZiBjaGFyZ2UsIHRvIGFueSBwZXJzb24gb2J0YWluaW5nIGEKICAqIGNvcHkgb2YgdGhpcyBzb2Z0
d2FyZSBhbmQgYXNzb2NpYXRlZCBkb2N1bWVudGF0aW9uIGZpbGVzICh0aGUgIlNvZnR3YXJlIiks
CkBAIC04Myw3ICs4Myw3IEBACiAKIC8vUG93ZXIgR2F0aW5nCiAjZGVmaW5lIFBQU01DX01TR19Q
b3dlclVwVmNuMCAgICAgICAgICAgICAgICAgICAgMHgyOAotI2RlZmluZSBQUFNNQ19NU0dfUG93
ZXJEb3duVmNuMDEgICAgICAgICAgICAgICAgIDB4MjkKKyNkZWZpbmUgUFBTTUNfTVNHX1Bvd2Vy
RG93blZjbjAgICAgICAgICAgICAgICAgICAweDI5CiAjZGVmaW5lIFBQU01DX01TR19Qb3dlclVw
VmNuMSAgICAgICAgICAgICAgICAgICAgMHgyQQogI2RlZmluZSBQUFNNQ19NU0dfUG93ZXJEb3du
VmNuMSAgICAgICAgICAgICAgICAgIDB4MkIKIAotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQt
Z2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
