Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F38BA48E12
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:18:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F6E48952F;
	Mon, 17 Jun 2019 19:18:25 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7016895C4
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:18:20 +0000 (UTC)
Received: by mail-qk1-x744.google.com with SMTP id s22so6906531qkj.12
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:18:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Wq3gdk6SaAYlAnaHTaUfIBzvZVFVtx3kavCVet3vlps=;
 b=ufC6sb/N+Ddtkl9XeYGFHvnIebqIrxhTy43f3ld3wB+tqBFUBB7kYOXUqeSpu4GpcY
 jtzE2OyYfG+pWPyewD42ubcPAFQNDTM22FHTxymFqvhveHxPPVT+ygRorrjdipHrPF4k
 ypaoOMOFIPiPSRyBgs5y86PTd8GmTrj1ACT1vizz0b0uiLtj79xUaXkYHGn34R4HQa8c
 Yfj5opnPlEF174vH7l+dvzE/OGGSXzbGsqbv/VbTJ1R0I+1p35rwc+Nw1beKsYIhM97V
 Ht0dcN13PmycXdS620Rwxv9IrQsM+rcUHF9io6y8FMbeqBsSPWuxeULijNGk0gaxActS
 fm8Q==
X-Gm-Message-State: APjAAAVoWr8345aN35JPX/6gicffOnPYar/Z8TRGVEXsemr3W006zuF+
 gJP7WhHfJ8OR/XyqIdlVVy/2k1uGzSU=
X-Google-Smtp-Source: APXvYqx5fV3Kk/CPFyNU/4l9+miwlhcUpFabbm6OtgivbCiZOLq29YYwifd2DFUo7aC7k+uZU4KQUQ==
X-Received: by 2002:a37:be41:: with SMTP id o62mr79996595qkf.356.1560799099515; 
 Mon, 17 Jun 2019 12:18:19 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id s35sm7754876qth.79.2019.06.17.12.18.18
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:18:19 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 080/459] drm/amd/amdgpu: add flag to mark whether autoload is
 supported or not
Date: Mon, 17 Jun 2019 14:10:41 -0500
Message-Id: <20190617191700.17899-69-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617191700.17899-1-alexander.deucher@amd.com>
References: <20190617191700.17899-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Wq3gdk6SaAYlAnaHTaUfIBzvZVFVtx3kavCVet3vlps=;
 b=Wjd+BX7ZiefMpZ6URHLk9i2TqiULm6IJe+4vP1o3c1tLFknUCq8x4LSHEqH88ekRbI
 4RgBTTBFIo1H8MBjAY3YBfiXfPt1TYILpjLKVujmTYBLSdG3Kd6DkeqQMw/ne5CGZNmF
 pVn9RODqH3F97FD5gPImlxT1FsrJypx6NWeU1aq5KtPXk4gTzjEEyneHrgnHDftR7O+D
 H8J91EEcxbMIccNUQL4CINwVeat+wMla/A44DuOdLgNES3U1sKz5CD78pGGk6M4d3+ln
 GJaoI02SSAJU08KJhOyqZ+KJ+GatUJonoxQbAn+c/Uz1+TrAdFGIbOKM7iMs6/A7kGVH
 gEZw==
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
 Jack Xiao <Jack.Xiao@amd.com>, Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSGF3a2luZyBaaGFuZyA8SGF3a2luZy5aaGFuZ0BhbWQuY29tPgoKcmxjIGF1dG9sb2Fk
IGlzIHN1cHBvcnRlZCBzaW5jZSBuYXZpMTAKClNpZ25lZC1vZmYtYnk6IEhhd2tpbmcgWmhhbmcg
PEhhd2tpbmcuWmhhbmdAYW1kLmNvbT4KQWNrZWQtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVy
LmRldWNoZXJAYW1kLmNvbT4KUmV2aWV3ZWQtYnk6IEphY2sgWGlhbyA8SmFjay5YaWFvQGFtZC5j
b20+ClJldmlld2VkLWJ5OiBMZSBNYSA8TGUuTWFAYW1kLmNvbT4KU2lnbmVkLW9mZi1ieTogQWxl
eCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2FtZGdwdV9wc3AuaCB8IDIgKysKIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2Vy
dGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
cHNwLmggYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcHNwLmgKaW5kZXggZmJm
MzI4NTJjZjljLi5hYTU2NjhkZjAzYjYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV9wc3AuaAorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfcHNwLmgKQEAgLTE4Nyw2ICsxODcsOCBAQCBzdHJ1Y3QgcHNwX2NvbnRleHQKIAogCS8qIGZl
bmNlIHZhbHVlIGFzc29jaWF0ZWQgd2l0aCBjbWQgYnVmZmVyICovCiAJYXRvbWljX3QJCQlmZW5j
ZV92YWx1ZTsKKwkvKiBmbGFnIHRvIG1hcmsgd2hldGhlciBnZnggZncgYXV0b2xvYWQgaXMgc3Vw
cG9ydGVkIG9yIG5vdCAqLworCWJvb2wJCQkJYXV0b2xvYWRfc3VwcG9ydGVkOwogCiAJLyogeGdt
aSB0YSBmaXJtd2FyZSBhbmQgYnVmZmVyICovCiAJY29uc3Qgc3RydWN0IGZpcm13YXJlCQkqdGFf
Znc7Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
