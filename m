Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2554A48EE6
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:28:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6407C89A86;
	Mon, 17 Jun 2019 19:28:23 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0ED5589A72
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:28:19 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id x2so12260795qtr.0
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:28:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mOAy+dsUpmsYt2oURGpBkQtvGA4uV+f0TTmP7+qO9bo=;
 b=nobOF4PddJdLyZNH3QNyMrHvJ5zqbQjmD7Pd7iunw9DSzO35QF9tPeYV0a2qd0ifMR
 olgVyNLXy73AkrLdA813jyn/E5u34vmpQBR4KTEi7ajOKhVnB6jcUHC6e5jJHrszu+pg
 cTgWENscDOsOG5p1hu+T6ASWYw68tsdHoEBG0TgO3TG9SCq5FCMmyMtAYcRIE8TCNRhc
 r74VgjaiPfkjkk/IAH3dpZGX4MLszrPxEU6A6iNJusuvFBSdb1SrImkuDX9isrWvstuJ
 vXwE1E9PmFlyEnuLbenr2CWZUaLk+2HCRg/mtHMefnyCQ+/NUuYIoMU4Wz0ljmKud0SQ
 a+5A==
X-Gm-Message-State: APjAAAWWTeSJK4fRiTA8Tu1c/wjRzGsFjLhxHyo+bUsKogpCokJw4fAq
 0irky0lCOf53QDXWuMoLng8SN/VUUys=
X-Google-Smtp-Source: APXvYqxjHQmFZDQgHoVkcwuxsiAekqOtJnUtx8Ismvr3Yn0EOp9S+hzt24hZIjiZd4PqHgoogDR9Hw==
X-Received: by 2002:ac8:38a8:: with SMTP id f37mr95646952qtc.150.1560799697812; 
 Mon, 17 Jun 2019 12:28:17 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id p37sm7715622qtc.35.2019.06.17.12.28.16
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:28:17 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 170/459] drm/amd/powerplay: enable DCEFCLK dpm support
Date: Mon, 17 Jun 2019 14:26:35 -0500
Message-Id: <20190617192704.18038-71-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617192704.18038-1-alexander.deucher@amd.com>
References: <20190617192704.18038-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mOAy+dsUpmsYt2oURGpBkQtvGA4uV+f0TTmP7+qO9bo=;
 b=MN1Z+qVj62ach+RSxWCd2oo08+OK/CkUJsKdOVgtbEIZLA6u/6vzBnLVvKEi8xL0Fq
 yMZTHVmIFdwwOUXmvbL2Hwn+ywfTRzgr1m2MDValvl7ixXploFqGG19ogHavTKPZiIpw
 Op6JV4dD08a0IFc9OE5nNUurlt6IQASMrHFeNGtQhbggkMlCYntExFwyB4jMRSHxB95H
 5R8WeO4T/y47ouk3SjVbJSu9KZsItZwfjvHquxxL0bIoAhTL0UMnvwkCW9HeqGiwEqFz
 zT4gtZh+u1kVtkJfhzHm7kMUf+zR9VdRmgiGxozTMSL4TFNwaFfTvHmXPoo23P+7ElPT
 KWrQ==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Kevin Wang <kevin1.wang@amd.com>,
 Kenneth Feng <kenneth.feng@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogS2VubmV0aCBGZW5nIDxrZW5uZXRoLmZlbmdAYW1kLmNvbT4KCkVuYWJhbGUgRENFRkNM
SyBkcG0gb24gbmF2aTEwCgpTaWduZWQtb2ZmLWJ5OiBLZW5uZXRoIEZlbmcgPGtlbm5ldGguZmVu
Z0BhbWQuY29tPgpSZXZpZXdlZC1ieTogS2V2aW4gV2FuZyA8a2V2aW4xLndhbmdAYW1kLmNvbT4K
U2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgot
LS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L25hdmkxMF9wcHQuYyB8IDMgKystCiAx
IGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvbmF2aTEwX3BwdC5jIGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9wb3dlcnBsYXkvbmF2aTEwX3BwdC5jCmluZGV4IGI3OGZhN2ZjMDYyMy4uOTYx
ZjQ0ZTU1ZjM1IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9uYXZp
MTBfcHB0LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvbmF2aTEwX3BwdC5j
CkBAIC0xMzksNyArMTM5LDggQEAgbmF2aTEwX2dldF9hbGxvd2VkX2ZlYXR1cmVfbWFzayhzdHJ1
Y3Qgc211X2NvbnRleHQgKnNtdSwKIAkJCQl8IEZFQVRVUkVfTUFTSyhGRUFUVVJFX1RIRVJNQUxf
QklUKQogCQkJCXwgRkVBVFVSRV9NQVNLKEZFQVRVUkVfTEVEX0RJU1BMQVlfQklUKQogCQkJCXwg
RkVBVFVSRV9NQVNLKEZFQVRVUkVfTU1IVUJfUEcpCi0JCQkJfCBGRUFUVVJFX01BU0soRkVBVFVS
RV9BVEhVQl9QRyk7CisJCQkJfCBGRUFUVVJFX01BU0soRkVBVFVSRV9BVEhVQl9QRykKKwkJCQl8
IEZFQVRVUkVfTUFTSyhGRUFUVVJFX0RQTV9EQ0VGQ0xLX0JJVCk7CiAKIAlpZiAoYWRldi0+cG0u
cHBfZmVhdHVyZSAmIFBQX0dGWE9GRl9NQVNLKQogCQkqKHVpbnQ2NF90ICopZmVhdHVyZV9tYXNr
IHw9IEZFQVRVUkVfTUFTSyhGRUFUVVJFX0dGWF9TU19CSVQpCi0tIAoyLjIwLjEKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBs
aXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
