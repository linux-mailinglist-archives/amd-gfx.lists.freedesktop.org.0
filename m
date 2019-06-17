Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7CE448F37
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:31:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F33E89B96;
	Mon, 17 Jun 2019 19:31:28 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0E8989BA9
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:31:26 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id y57so12270337qtk.4
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:31:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5U4n9BDDVsx9tFv3OAeweZkx9n/VP5d6iJKyqQ5xuVo=;
 b=EGAiOGwK0CDqd/VMqUr33h3Rk9xItPFsGxTlEuqqqLop13l1o+f597bOw/zWVKyMoh
 trMGTZTkSDOwfRltSg+Gwzv5XYy7WHjh7qYApPHNN1aJVY8m8zsQK6V/Hpwdmg6iiwDN
 gnzsqE+RFqKKeMtfmjkSnFHI43wbfGhmZeSoddQmMnSqgIM23oWhKaX3RC2ZqN8qG+nq
 RMNwEQ5sJxy/XoA/5SCJJFrmutC98jY08H3vXnoJlN9WaXGpptNtOLxmZ115abS0ATFi
 +kzautxYhWbZcphYOyUsUNyJgMq8K/mfYOLl5AH1xzT3QMrUbzYK9ZY9c2Gk5JAb4x6h
 LVPA==
X-Gm-Message-State: APjAAAWvYLHfKkhQUfYCiarjR2EUN++dKhInQjfSMC1/rAWBLk0rdEMi
 QdoR/p9oTjV1F4J/aAuBRTzgJ39XxMc=
X-Google-Smtp-Source: APXvYqz8mZlnfbcomr9mxy4CW4uEkjiWzGhQ6C78qxJ2yRoZmbtYM86j8XEN2mqm8rB/jpRDIusqCA==
X-Received: by 2002:ac8:26c8:: with SMTP id 8mr38811395qtp.308.1560799885698; 
 Mon, 17 Jun 2019 12:31:25 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id u2sm7474875qtj.97.2019.06.17.12.31.24
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:31:25 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 213/459] drm/amdgpu/mes10.1: implement ucode buffers
 destruction
Date: Mon, 17 Jun 2019 14:29:40 -0500
Message-Id: <20190617193106.18231-14-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617193106.18231-1-alexander.deucher@amd.com>
References: <20190617193106.18231-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5U4n9BDDVsx9tFv3OAeweZkx9n/VP5d6iJKyqQ5xuVo=;
 b=p8Va41+1LuUNN6rL1Hn1Jjj5lkYCUZYSEh87PBKOEFUxAmV/tUcLgl/SBUppFFWPzC
 EVmS4piJVcNbY/URZDc2sls81JJLYpDZ99+ALomr+T02dHzRZTZWQvOo+QuJPh+xTqtp
 AIJM5QZsMKeS/+1PajaKryElbfimlaqD20JL2J8Yod4BU5MsZSdCy6iKJBvVFHKhNZVr
 PePrOjVjFCsfwneINdEGC+2E6Lgc84wuPNDlJc8Q6usuya9t1dioeS8DO6mtkPVDLniM
 3aOw/zw90Eyk33Qa1Kex1Xv7dfX6hTBpZpD7f4gOSzPOK9UiqexaTjQdBuRtAAsDEd8m
 Ndvg==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Jack Xiao <Jack.Xiao@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSmFjayBYaWFvIDxKYWNrLlhpYW9AYW1kLmNvbT4KCkZyZWUgdWNvZGUgR1BVIGJ1ZmZl
cnMuCgpTaWduZWQtb2ZmLWJ5OiBKYWNrIFhpYW8gPEphY2suWGlhb0BhbWQuY29tPgpSZXZpZXdl
ZC1ieTogSGF3a2luZyBaaGFuZyA8SGF3a2luZy5aaGFuZ0BhbWQuY29tPgpTaWduZWQtb2ZmLWJ5
OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Ci0tLQogZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvbWVzX3YxMF8xLmMgfCAxMSArKysrKysrKysrKwogMSBmaWxlIGNo
YW5nZWQsIDExIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9tZXNfdjEwXzEuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L21lc192MTBf
MS5jCmluZGV4IDc2NDk2N2IyMGM0MC4uZWRmMWZiYzFkMDJkIDEwMDY0NAotLS0gYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9tZXNfdjEwXzEuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9tZXNfdjEwXzEuYwpAQCAtMTY5LDYgKzE2OSwxNyBAQCBzdGF0aWMgaW50IG1lc192
MTBfMV9hbGxvY2F0ZV91Y29kZV9kYXRhX2J1ZmZlcihzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRl
dikKIAlyZXR1cm4gMDsKIH0KIAorc3RhdGljIHZvaWQgbWVzX3YxMF8xX2ZyZWVfdWNvZGVfYnVm
ZmVycyhzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKK3sKKwlhbWRncHVfYm9fZnJlZV9rZXJu
ZWwoJmFkZXYtPm1lcy5kYXRhX2Z3X29iaiwKKwkJCSAgICAgICZhZGV2LT5tZXMuZGF0YV9md19n
cHVfYWRkciwKKwkJCSAgICAgICh2b2lkICoqKSZhZGV2LT5tZXMuZGF0YV9md19wdHIpOworCisJ
YW1kZ3B1X2JvX2ZyZWVfa2VybmVsKCZhZGV2LT5tZXMudWNvZGVfZndfb2JqLAorCQkJICAgICAg
JmFkZXYtPm1lcy51Y29kZV9md19ncHVfYWRkciwKKwkJCSAgICAgICh2b2lkICoqKSZhZGV2LT5t
ZXMudWNvZGVfZndfcHRyKTsKK30KKwogc3RhdGljIGludCBtZXNfdjEwXzFfc3dfaW5pdCh2b2lk
ICpoYW5kbGUpCiB7CiAJcmV0dXJuIDA7Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vYW1kLWdmeA==
