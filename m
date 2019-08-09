Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F7CA87E94
	for <lists+amd-gfx@lfdr.de>; Fri,  9 Aug 2019 17:53:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C424A6EE3E;
	Fri,  9 Aug 2019 15:53:19 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1076B6EE3C
 for <amd-gfx@lists.freedesktop.org>; Fri,  9 Aug 2019 15:53:18 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id d23so96298867qto.2
 for <amd-gfx@lists.freedesktop.org>; Fri, 09 Aug 2019 08:53:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PMxK/wiV34jDp0ctlNTfRHdQa/7FL77ICLEkCWR2g0g=;
 b=T59nrcf+tXJqAammb/SYq1nJn6DrT31M1mdxq/erd9DdCIIMI03idZkbNBgQloYmUO
 VOM1MyI3484pKbCSAdKG9JWqqdLBKrbdJbmuxdXia3zCka0BhS3VmEh27S4LOTDE3Hc2
 0jDtP0kXaR71rx8zq8GrdL0ve1UHzamWKb8B9y7SlSJhXOH/Q0EAY87lkh+9ER5grZws
 ZIB7m+lPSYTSN86dSxSSYar++/rjBba1R/RAX6OUqn55FyAaApeC0p7MR+y27Y0g5UQp
 9MOUFUYhC5QmqkLuAOtf/WGL5JASlQl8g9zj0fFIw0b8++ExQ/rMznCGfcdwqWbUhWM7
 7Vzw==
X-Gm-Message-State: APjAAAWo73aPkE+j2tb9ac1xEEzkbGB6pCeewwJiHKuKSivv/Ix/RQkx
 QB1jKGkiyenGWzObnakyyFBVBt/1
X-Google-Smtp-Source: APXvYqz4ky3B6F5xDHIpRLB9NQZ+7xFk2Qzxl+C6EXo8IpZUohPZPoKxjFClKrjOK4sb0TJEWrgMmQ==
X-Received: by 2002:ac8:117:: with SMTP id e23mr3790179qtg.18.1565365996875;
 Fri, 09 Aug 2019 08:53:16 -0700 (PDT)
Received: from localhost.localdomain ([71.51.170.6])
 by smtp.gmail.com with ESMTPSA id o5sm42672066qkf.10.2019.08.09.08.53.16
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 09 Aug 2019 08:53:16 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 08/27] drm/amdgpu: add sdma support for renoir
Date: Fri,  9 Aug 2019 10:52:43 -0500
Message-Id: <20190809155302.4733-8-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190809155302.4733-1-alexander.deucher@amd.com>
References: <20190809155302.4733-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PMxK/wiV34jDp0ctlNTfRHdQa/7FL77ICLEkCWR2g0g=;
 b=g4iOm4tFfNfa0TCJ/i6iWZ3dr0dE+jPKIpeqEXmQw/F8KuiMlr4/pk7QPpqSpZ7x1Z
 bHBXhIR7o/QrfGDYmz0klRVQxqvYfk23LgcBdC8WykpGtQC9w2sE4L28+t3xH2Sa/ujV
 SWZGfOquyRuV+dia85gT3S7966yWqppHxQcgFzy9ZCBzBzUVIMqW79cbkZRs6z0bhknb
 1XwIKqQiUGtxHODGkZIxC/mrKjrwD2VOClGLwqh7CXgxgf5gWO66u7haE/cnjy1HwCyV
 bnGHSJf/UHpcafsAUOH42ycnksrNTJT444zs3b7dRvD3zr6ZszGiYeLr/bqqlabPnul8
 KZhw==
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

RnJvbTogSHVhbmcgUnVpIDxyYXkuaHVhbmdAYW1kLmNvbT4KCkFkZCByZW5vaXIgY2hlY2tzIHRv
IGFwcHJvcHJpYXRlIHBsYWNlcy4KClNpZ25lZC1vZmYtYnk6IEh1YW5nIFJ1aSA8cmF5Lmh1YW5n
QGFtZC5jb20+ClJldmlld2VkLWJ5OiBIYXdraW5nIFpoYW5nIDxIYXdraW5nLlpoYW5nQGFtZC5j
b20+ClNpZ25lZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNv
bT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zZG1hX3Y0XzAuYyB8IDYgKysrKyst
CiAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc2RtYV92NF8wLmMgYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9zZG1hX3Y0XzAuYwppbmRleCA2NWVjZGQxMWJjNTkuLmVmMzBmODc3
NDc3ZSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc2RtYV92NF8wLmMK
KysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc2RtYV92NF8wLmMKQEAgLTY1LDYgKzY1
LDcgQEAgTU9EVUxFX0ZJUk1XQVJFKCJhbWRncHUvcmF2ZW5fc2RtYS5iaW4iKTsKIE1PRFVMRV9G
SVJNV0FSRSgiYW1kZ3B1L3BpY2Fzc29fc2RtYS5iaW4iKTsKIE1PRFVMRV9GSVJNV0FSRSgiYW1k
Z3B1L3JhdmVuMl9zZG1hLmJpbiIpOwogTU9EVUxFX0ZJUk1XQVJFKCJhbWRncHUvYXJjdHVydXNf
c2RtYS5iaW4iKTsKK01PRFVMRV9GSVJNV0FSRSgiYW1kZ3B1L3Jlbm9pcl9zZG1hLmJpbiIpOwog
CiAjZGVmaW5lIFNETUEwX1BPV0VSX0NOVExfX09OX09GRl9DT05ESVRJT05fSE9MRF9USU1FX01B
U0sgIDB4MDAwMDAwRjhMCiAjZGVmaW5lIFNETUEwX1BPV0VSX0NOVExfX09OX09GRl9TVEFUVVNf
RFVSQVRJT05fVElNRV9NQVNLIDB4RkMwMDAwMDBMCkBAIC00NDksNiArNDUwLDkgQEAgc3RhdGlj
IGludCBzZG1hX3Y0XzBfaW5pdF9taWNyb2NvZGUoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYp
CiAJY2FzZSBDSElQX0FSQ1RVUlVTOgogCQljaGlwX25hbWUgPSAiYXJjdHVydXMiOwogCQlicmVh
azsKKwljYXNlIENISVBfUkVOT0lSOgorCQljaGlwX25hbWUgPSAicmVub2lyIjsKKwkJYnJlYWs7
CiAJZGVmYXVsdDoKIAkJQlVHKCk7CiAJfQpAQCAtMTYzNyw3ICsxNjQxLDcgQEAgc3RhdGljIGlu
dCBzZG1hX3Y0XzBfZWFybHlfaW5pdCh2b2lkICpoYW5kbGUpCiAJc3RydWN0IGFtZGdwdV9kZXZp
Y2UgKmFkZXYgPSAoc3RydWN0IGFtZGdwdV9kZXZpY2UgKiloYW5kbGU7CiAJaW50IHI7CiAKLQlp
ZiAoYWRldi0+YXNpY190eXBlID09IENISVBfUkFWRU4pCisJaWYgKGFkZXYtPmFzaWNfdHlwZSA9
PSBDSElQX1JBVkVOIHx8IGFkZXYtPmFzaWNfdHlwZSA9PSBDSElQX1JFTk9JUikKIAkJYWRldi0+
c2RtYS5udW1faW5zdGFuY2VzID0gMTsKIAllbHNlIGlmIChhZGV2LT5hc2ljX3R5cGUgPT0gQ0hJ
UF9BUkNUVVJVUykKIAkJYWRldi0+c2RtYS5udW1faW5zdGFuY2VzID0gODsKLS0gCjIuMjAuMQoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
