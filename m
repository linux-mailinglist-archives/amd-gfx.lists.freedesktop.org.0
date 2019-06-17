Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EEB0B48E99
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:27:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC10D89862;
	Mon, 17 Jun 2019 19:27:26 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 163158982A
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:27:22 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id x47so12176239qtk.11
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:27:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=81hBQdxuQldfacSBhbjbwEcksOyNw2DmF6RVQBYWUlY=;
 b=Nk24fAJAJMC3AYFg1+8jyOD5l+4Phdzhd8ts9b+RTrAAO7zNiJgpC37fPPJF5O3EY3
 QpvpRMN6u+yfbFbGKCFw36AikoEilpHJthdal8/I4a/2f7iorPaiLmNsd6M717gGSz29
 /HNjtZEA/y8JqC1niD69XkOwCgaJvdxSnpuim6X1d3I2bthG7Dx30mp/9kCO5Q7ojbVi
 A2KCH4dmoI9AOnGZRIDKYjpEfVxR+OLGhh2BcfPG+L4Qc9j1yaey2smNwhoHwutS4CX2
 t95XsRP10JgwMdSv4WYWzjXmyxpDOBqw2RNff/o0E2vDyT1WQDMX8Jzp/fPjvSS8OwlR
 FlVw==
X-Gm-Message-State: APjAAAX8C9n3qKQkCy47tnuZuCEjX5dfBy/ilcedVMilfmgSulCP8C6o
 9es9TIDZJLfSiuql5OaM/o+5Mp44j7s=
X-Google-Smtp-Source: APXvYqzYEVDhquF+Q68o0iM8V8mEXmC8jE9719gNdL52u0XV2nrU93FyygqHeUjhbu9LsAL6TyRWgQ==
X-Received: by 2002:ac8:685:: with SMTP id f5mr21839233qth.9.1560799641060;
 Mon, 17 Jun 2019 12:27:21 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id p37sm7715622qtc.35.2019.06.17.12.27.20
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:27:20 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 110/459] drm/amdgpu: set the default value of
 pa_sc_tile_steering_override
Date: Mon, 17 Jun 2019 14:25:35 -0500
Message-Id: <20190617192704.18038-11-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617192704.18038-1-alexander.deucher@amd.com>
References: <20190617192704.18038-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=81hBQdxuQldfacSBhbjbwEcksOyNw2DmF6RVQBYWUlY=;
 b=vdM2SZ/jbYfQ/hAOigA/1sxwf4MOTTuBqnCIsMRz81Q2uFk4vxTEU3qosdGxyLpS5C
 ZDokB+lXbrdOjZMmOCVv+61VkH52RRaSX8B3FvX4FaBvOHU1yeOguiC0jGu+M8W4xzUu
 aqJ3juWAOycsB86rXMyNZDjL7OV4sGr9w5jTIkfQSHJTH+zmZR5kHkrgz2rHYE6lc1jH
 oeVwZ/kk7gonmmhPysd8G6X3FKP5uxnV0ZuYpoDXky4pDJN28nhMMZRn/DdJ2hX+3oL3
 GqPeSSe3wtZscWqfGGopb3OAq2qWek+b0hdqTF2j7hu3dd89Bk3V1YbhuoyQvDZ03wVy
 JIww==
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSGF3a2luZyBaaGFuZyA8SGF3a2luZy5aaGFuZ0BhbWQuY29tPgoKU28gdXNlcnNwYWNl
IGNhbiBhY2Nlc3MgaXQuCgpTaWduZWQtb2ZmLWJ5OiBIYXdraW5nIFpoYW5nIDxIYXdraW5nLlpo
YW5nQGFtZC5jb20+ClJldmlld2VkLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVy
QGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJA
YW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfa21zLmMgfCA0
ICsrKysKIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfa21zLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHVfa21zLmMKaW5kZXggZTU2NzA0ZGQ4NDFiLi5lZDA1MWZkYjUwOWYgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9rbXMuYworKysgYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfa21zLmMKQEAgLTc2Miw2ICs3NjIsMTAg
QEAgc3RhdGljIGludCBhbWRncHVfaW5mb19pb2N0bChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LCB2
b2lkICpkYXRhLCBzdHJ1Y3QgZHJtX2ZpbGUKIAkJZGV2X2luZm8uZ3NfcHJpbV9idWZmZXJfZGVw
dGggPSBhZGV2LT5nZnguY29uZmlnLmdzX3ByaW1fYnVmZmVyX2RlcHRoOwogCQlkZXZfaW5mby5t
YXhfZ3Nfd2F2ZXNfcGVyX3ZndCA9IGFkZXYtPmdmeC5jb25maWcubWF4X2dzX3RocmVhZHM7CiAK
KwkJaWYgKGFkZXYtPmZhbWlseSA+PSBBTURHUFVfRkFNSUxZX05WKQorCQkJZGV2X2luZm8ucGFf
c2NfdGlsZV9zdGVlcmluZ19vdmVycmlkZSA9CisJCQkJYWRldi0+Z2Z4LmNvbmZpZy5wYV9zY190
aWxlX3N0ZWVyaW5nX292ZXJyaWRlOworCiAJCXJldHVybiBjb3B5X3RvX3VzZXIob3V0LCAmZGV2
X2luZm8sCiAJCQkJICAgIG1pbigoc2l6ZV90KXNpemUsIHNpemVvZihkZXZfaW5mbykpKSA/IC1F
RkFVTFQgOiAwOwogCX0KLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9hbWQtZ2Z4
