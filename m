Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46BEAB56D0
	for <lists+amd-gfx@lfdr.de>; Tue, 17 Sep 2019 22:20:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4DC86ED46;
	Tue, 17 Sep 2019 20:20:57 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52C2D6ED45
 for <amd-gfx@lists.freedesktop.org>; Tue, 17 Sep 2019 20:20:56 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id c21so6019352qtj.12
 for <amd-gfx@lists.freedesktop.org>; Tue, 17 Sep 2019 13:20:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PoPw0ByOuN7jBZw5V7vLk2fszd4mAmWEdMx+EGQ/dag=;
 b=Fo8uhoXwc033BZv2Q4V0yAhR2EK8O/2f3MWl2VFYr9qJvBcBGGYf7ghqm/LTXtpTsV
 YHhzchtSxQxsNTk7a/YXJNYgOxD7MuIC/fpGmEr/eG77ar99pV0sudjXVa388pwVbWhn
 SQ9f9DbtggLkQIufDilABiGgfvLcKifYQtmESNLNixK6SVfkd3bPlSOPkxxLQKUJxLYa
 vXjE0RJmzDUMyGVItKryv24o6zzggXcuV42cp90Aq37vlsxKMbOWEseec3jWgvYJM6C2
 SWL1UYBWosO8TbbdFNcNZxCt7SgffeHfYkZmfYQkZF8rpVcLkCPI0Z1zpfF4wMnV/nD4
 LYgw==
X-Gm-Message-State: APjAAAUvx3OzUo77whwuIJUxYfd/0WbgL1gwPbfBOWkOyxp9REdw17hL
 gLyf8KzI0EfK3hzp1bz81/CW+z5R
X-Google-Smtp-Source: APXvYqz+AakcueosUzk6BpzISGmKixhajGYPhxFICBPCjPy+Mkqft6Xd4PPJAapKJsW4vFjSXn9EZg==
X-Received: by 2002:ac8:160d:: with SMTP id p13mr714658qtj.189.1568751655219; 
 Tue, 17 Sep 2019 13:20:55 -0700 (PDT)
Received: from localhost.localdomain ([71.219.73.178])
 by smtp.gmail.com with ESMTPSA id l23sm2755325qta.53.2019.09.17.13.20.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Sep 2019 13:20:54 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 2/2] drm/amdgpu/psp: invalidate the hdp read cache before
 reading the psp response
Date: Tue, 17 Sep 2019 15:20:46 -0500
Message-Id: <20190917202046.26634-2-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190917202046.26634-1-alexander.deucher@amd.com>
References: <20190917202046.26634-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PoPw0ByOuN7jBZw5V7vLk2fszd4mAmWEdMx+EGQ/dag=;
 b=LBh7agxxOPI17MRG6eo17Ipkg9OuXEDl8QCY+dl+P2D/XwolpkNM5k0KUHGCEYPIVh
 VVmOBhZdVQpdFL5fY47UdTnOzvgZObdhHf+v0uYw6wr+6VB35Rml5MOQD1VRbSoi9pFl
 UKiBL8L/h4HXN4CT4grEDd3c7cEkus1B2UR6O9NadSgKjaLMiDWTnBBvMdBceFBHvzsj
 7LC4L44rnGsvIrPhLH9xlnMTEsVJGK7pdy627P40IKjZ08hzlSl61z2VwK6/3x2fezGw
 Bu85nbXZ1+2pEbJ2hMgusm7Q+NS2tPgIsGmU/nNtbq2lyZVJ6ZzL/ZS0wq06ZeixMuWQ
 fujA==
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
Cc: Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T3RoZXJ3aXNlIHdlIG1heSBnZXQgc3RhbGUgZGF0YS4KClNpZ25lZC1vZmYtYnk6IEFsZXggRGV1
Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHVfcHNwLmMgfCAyICsrCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25z
KCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3BzcC5j
IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3BzcC5jCmluZGV4IGJjNDZhNDI5
YjRkYy4uNzk5MWVkZjU4MTIzIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfcHNwLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Bz
cC5jCkBAIC0xNTEsMTAgKzE1MSwxMiBAQCBwc3BfY21kX3N1Ym1pdF9idWYoc3RydWN0IHBzcF9j
b250ZXh0ICpwc3AsCiAJCXJldHVybiByZXQ7CiAJfQogCisJYW1kZ3B1X2FzaWNfaW52YWxpZGF0
ZV9oZHAocHNwLT5hZGV2LCBOVUxMKTsKIAl3aGlsZSAoKigodW5zaWduZWQgaW50ICopcHNwLT5m
ZW5jZV9idWYpICE9IGluZGV4KSB7CiAJCWlmICgtLXRpbWVvdXQgPT0gMCkKIAkJCWJyZWFrOwog
CQltc2xlZXAoMSk7CisJCWFtZGdwdV9hc2ljX2ludmFsaWRhdGVfaGRwKHBzcC0+YWRldiwgTlVM
TCk7CiAJfQogCiAJLyogSW4gc29tZSBjYXNlcywgcHNwIHJlc3BvbnNlIHN0YXR1cyBpcyBub3Qg
MCBldmVuIHRoZXJlIGlzIG5vCi0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vYW1kLWdmeA==
