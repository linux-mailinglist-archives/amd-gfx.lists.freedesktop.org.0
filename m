Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 683DB219C3
	for <lists+amd-gfx@lfdr.de>; Fri, 17 May 2019 16:27:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1178892CC;
	Fri, 17 May 2019 14:26:59 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB63F892CC
 for <amd-gfx@lists.freedesktop.org>; Fri, 17 May 2019 14:26:58 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id a39so8214490qtk.2
 for <amd-gfx@lists.freedesktop.org>; Fri, 17 May 2019 07:26:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pwbw/p1FQ9WZpF9OwRbP/MyJ0X5N5nXOMniefooZyZE=;
 b=a16dK2SBew5qFwbDZbAZufbqW8mHKFSt+mjkE6FbAIRbDIUbluvrte1vgQE/I/cqeC
 hiMbsFUqgirdvQkkoAmkk4KR2NceUe+9v8BhAxyFPg3/YmqlnJqd92hrVt74JDP0l2id
 VyKiG430vVdUltbOR4yRVi+Hd+0VwqTSnkUR2HQXmdHIRnZgknPnvEeKNBI1ptAFEIhc
 HtmGuQOMqcKkCdwsTIPwctp88MGscIwUIhVsVlqzeN8uV+HHBXfZjHzY9iRL+poSrVHy
 /knKds21oCuJmdOlpU80DrD6aNvMYkDYnUk4TxrRr7lmGsVMtpLnmiYXQDQskdnoUbRx
 ORvg==
X-Gm-Message-State: APjAAAXRnjv4twtQ6Pc0cdt+eFbg9IL65j8qwng3fCw76YxDXcHeUqmc
 25NUtxRLAWmxYkklmbYxY26TAJAk
X-Google-Smtp-Source: APXvYqyuhgEwWqKhPi4N7jgCM9xkrA/eTLlvLZatnGZxdBPCLjKtwPixaDihNPmAHsyAoMsUhm8P2w==
X-Received: by 2002:ac8:30f3:: with SMTP id w48mr47053075qta.90.1558103217571; 
 Fri, 17 May 2019 07:26:57 -0700 (PDT)
Received: from localhost.localdomain ([71.219.84.143])
 by smtp.gmail.com with ESMTPSA id r129sm4129209qkb.9.2019.05.17.07.26.56
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 17 May 2019 07:26:56 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH] drm/amdgpu/soc15: skip reset on init
Date: Fri, 17 May 2019 09:26:47 -0500
Message-Id: <20190517142647.26034-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pwbw/p1FQ9WZpF9OwRbP/MyJ0X5N5nXOMniefooZyZE=;
 b=vg4DAV/rf5w+2cPP1BbVKnJQaxOCod/wgOb9yGnmQbj7H3AahQ6RnuA/Aqmwszzc9V
 nbaG6onbkkiUO8FkWqTfOcN8Q+5ADab3cUWTbNZ9PgT5pt53+9wLxxpvL33Xfz7PHzuL
 NYH6GKnq16e3HBr/0E9TAafuq62rvMtvuUbYMcPQh+nGlkRyLKbkd05Y+eywSe0301m7
 5uu982AkrXn6xD7bTrtGQhCYNuLV9k4DuvZwf+UwSq/Qmkvqc6LQipk8SDgYrxSlQhC7
 nCjTmHlxpTx5x0mplhpsAq/GwNWmw3QoVnnFPUAqsv/LkJpgJkDNYoVth4VbgRFo8ZGF
 zmBg==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Tm90IG5lY2Vzc2FyeSBvbiBzb2MxNSBhbmQgYnJlYWtzIGRyaXZlciByZWxvYWQgb24gc2VydmVy
IGNhcmRzLgoKU2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBh
bWQuY29tPgpDYzogc3RhYmxlQHZnZXIua2VybmVsLm9yZwotLS0KIGRyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L3NvYzE1LmMgfCA1ICsrKysrCiAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25z
KCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc29jMTUuYyBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NvYzE1LmMKaW5kZXggMzJkYzVhMTI4MjQ5Li43OGJk
NGZjMDdiYWIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NvYzE1LmMK
KysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc29jMTUuYwpAQCAtNzYxLDYgKzc2MSwx
MSBAQCBzdGF0aWMgYm9vbCBzb2MxNV9uZWVkX3Jlc2V0X29uX2luaXQoc3RydWN0IGFtZGdwdV9k
ZXZpY2UgKmFkZXYpCiB7CiAJdTMyIHNvbF9yZWc7CiAKKwkvKiBKdXN0IHJldHVybiBmYWxzZSBm
b3Igc29jMTUgR1BVcy4gIFJlc2V0IGRvZXMgbm90IHNlZW0gdG8KKwkgKiBiZSBuZWNlc3Nhcnku
CisJICovCisJcmV0dXJuIGZhbHNlOworCiAJaWYgKGFkZXYtPmZsYWdzICYgQU1EX0lTX0FQVSkK
IAkJcmV0dXJuIGZhbHNlOwogCi0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vYW1kLWdmeA==
