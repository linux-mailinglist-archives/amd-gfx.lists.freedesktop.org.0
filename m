Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DFCD48DD0
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:17:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23D1C89286;
	Mon, 17 Jun 2019 19:17:30 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FAC9892B9
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:17:22 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id n11so12170057qtl.5
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:17:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SbdlDSERbXHSs2Xndy7+GOgS4CBnzKaw+g5A7MubLgw=;
 b=P7Td31aM6rMguyD3V1QwyAPl/5AoJh4Fa8yXj5ZS5tu4DvK1dmPcBG9wY1jfDBt832
 wGu7/iFHd+FJzC/J2FNDHZU5U/7RR3l46vUfCzq4NgucwP2AOdXx5LsemmSxIW9OiJLu
 5zgaYgsBiyL8P5OhdGs2olj74V+ZKkxX6WuxDr0rrRSpJLob+87NrtWhqIHhKpPXQcro
 yKt/Z+5HHtfaUG/2TVZY0WP+IG7sXB4aqds7uPnl/tcI+xU3te08ko2I9HEbQphDkRqw
 8pmeRrgkNqAoIlv3r9rlM56Je+x6hTPvCrTGn40VNe0rSmwBy20igl9Sz5IwQVhWMWqo
 m14Q==
X-Gm-Message-State: APjAAAV0mQ///TNAIfKe7RuSmfoN1Y/g2ynjfqLq5+JG8tShjtyjytEQ
 Dmuq4YMTcc8JhcJ7eob7GDldm4Fo2e8=
X-Google-Smtp-Source: APXvYqymGE/IelJM44qbHKd//zRwcOQawkb+2rV6HHFJ0EQB+FmSFT/r2dvNYyyJ8ESbWnquhcl0IA==
X-Received: by 2002:ac8:197a:: with SMTP id g55mr58439394qtk.320.1560799041203; 
 Mon, 17 Jun 2019 12:17:21 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id s35sm7754876qth.79.2019.06.17.12.17.20
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:17:20 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 019/459] drm/amdgpu: Add GDDR6 in vram_name arrary
Date: Mon, 17 Jun 2019 14:09:40 -0500
Message-Id: <20190617191700.17899-8-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617191700.17899-1-alexander.deucher@amd.com>
References: <20190617191700.17899-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SbdlDSERbXHSs2Xndy7+GOgS4CBnzKaw+g5A7MubLgw=;
 b=H6FVxWt39P7RRauyq93sO7E6/LtSA8VaJdlCvTHbIz7Si8eiCY6C+9f2efibhCzRSV
 TEMRwzu9IsqD3KPN7B6juqMMs6N92K2B0zkCHr214+BPLyVZRBIiPxDc8ZZTBAFbcgxr
 ubdvZskxpWJd4aatA/n7x8JPvBl6dwwtSHYGvj2n5gZvkGc2sE/xpOWZCc0/2QN9Lgh3
 ErU08HZ3ZzsWWRO/cQUWY4+uHIvjMG+V4QoCHKa0xEjMJTUnMkAoJBtFcvG8hra1+a64
 6PORqr+Kl18xeCAWULclgUrTx/ZZo6C/6WvwaRNFs79pu3ewnf7DTfd+EryIYV80NOYZ
 30dA==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Tao Zhou <Tao.Zhou1@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSGF3a2luZyBaaGFuZyA8SGF3a2luZy5aaGFuZ0BhbWQuY29tPgoKRm9yIHByaW50aW5n
IHZyYW0gdHlwZS4KClNpZ25lZC1vZmYtYnk6IEhhd2tpbmcgWmhhbmcgPEhhd2tpbmcuWmhhbmdA
YW1kLmNvbT4KUmV2aWV3ZWQtYnk6IFRhbyBaaG91IDxUYW8uWmhvdTFAYW1kLmNvbT4KU2lnbmVk
LW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgotLS0KIGRy
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9vYmplY3QuYyB8IDEgKwogMSBmaWxlIGNo
YW5nZWQsIDEgaW5zZXJ0aW9uKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1X29iamVjdC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
X29iamVjdC5jCmluZGV4IDMwNDkzNDI5ODUxZS4uOTg5YjdiNTVjYjJlIDEwMDY0NAotLS0gYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfb2JqZWN0LmMKKysrIGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X29iamVjdC5jCkBAIC05NzksNiArOTc5LDcgQEAgc3Rh
dGljIGNvbnN0IGNoYXIgKmFtZGdwdV92cmFtX25hbWVzW10gPSB7CiAJIkhCTSIsCiAJIkREUjMi
LAogCSJERFI0IiwKKwkiR0REUjYiLAogfTsKIAogLyoqCi0tIAoyLjIwLjEKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0
CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
