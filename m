Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7530C49017
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:47:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5E0C89F38;
	Mon, 17 Jun 2019 19:47:02 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 243AC89F08
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:46:58 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id p144so6959658qke.11
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:46:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rNt9ZxLueXHxULtHVv3xHdcqzRol5RkCVkA3tX9uITI=;
 b=C/hvzqDMenm1hrNXt5/OiCaxX/gdyMiMtk0qBJZeaSug3lvDEtiOME0HL1cdsZg5Vn
 uFA8snx+jreflIbSgu+SFE1ahTju51DiIdtsuCkKd4U9XaArLo12spi2rHYAbK+jKGWB
 fEtbImDhMSmiBF5/lfVe+j5ajkbxD65/OGtUygwabujU8gb5GqPj/Q05fglJtaMDx/NN
 fHDCwic9Fltr7pmm3ys5GfOAoFQUgkNV20vfUsglnJISN9qvOkYQod6l/Yat+y7irhMF
 2sVk3Rp294q+MBvOBe5t0PpbCXkMHe9/QdfXaTwuJMHE0vBI6nv1BcYdMnZyroPBG484
 LYog==
X-Gm-Message-State: APjAAAVFi7YeohdoYwHu/6REr9jmESkvANzHnkY+iP0QVao9bTXLqlsf
 lr0pbvK5SbCLUPKXFVf1a+yEkDB0ulKB2A==
X-Google-Smtp-Source: APXvYqxeJMBzmPiXPfigajjYHcL/xIfGgdwezCFElJoJtuNXKiO+EtIqyxK/ndMsXWk4LB1Z7aNUqw==
X-Received: by 2002:a05:620a:14a1:: with SMTP id
 x1mr90624776qkj.164.1560800817165; 
 Mon, 17 Jun 2019 12:46:57 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id u4sm6559420qkb.16.2019.06.17.12.46.56
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:46:56 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 360/459] drm/amd/display: enable DSC support by default
Date: Mon, 17 Jun 2019 14:45:01 -0500
Message-Id: <20190617194540.18497-61-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617194540.18497-1-alexander.deucher@amd.com>
References: <20190617194540.18497-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rNt9ZxLueXHxULtHVv3xHdcqzRol5RkCVkA3tX9uITI=;
 b=RAyIbT7zj4Z0JwJun2tCYdXA/d3ZIT9lrHTW/dpfZT3+Lsq6Fqbx5/w5k9YHn0jqxV
 tGQ9WtGI/ktfvDOj3Lkqm0fP/Rngzn11bqXfplyda5SvqbJH7dBnzt5T1xejG9i10SOs
 +x4t7Lh4p0EP7QxwJRVy5KKmOuUujG8vRxPfFd//Dm50B9NR3MX4aRoe4qt6AMOx9IQ/
 K53rVhs7YWGz8bm0OzrAEzX/S+vMSPoPLV/iuHgire0x8uUfCkcYj7sC3wjD6R5WZIJ4
 uJ8Osqq5hpf+jYMFhwBCDPG3mgkBMHrd3J6F2EmXDe7R2w82zIfAzrcxCA1qe/DahZey
 JVBQ==
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

RnJvbTogSGF3a2luZyBaaGFuZyA8SGF3a2luZy5aaGFuZ0BhbWQuY29tPgoKU2lnbmVkLW9mZi1i
eTogSGF3a2luZyBaaGFuZyA8SGF3a2luZy5aaGFuZ0BhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBB
bGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUv
ZHJtL2FtZC9kaXNwbGF5L0tjb25maWcgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRp
b24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rp
c3BsYXkvS2NvbmZpZyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9LY29uZmlnCmluZGV4
IDljYjIyMTFlZGY0Yy4uMzNlN2VmYmI0ZWY0IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL2Rpc3BsYXkvS2NvbmZpZworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvS2Nv
bmZpZwpAQCAtMjYsNyArMjYsNyBAQCBjb25maWcgRFJNX0FNRF9EQ19EQ04yXzAKIAogY29uZmln
IERSTV9BTURfRENfRFNDX1NVUFBPUlQKIAlib29sICJEU0Mgc3VwcG9ydCIKLQlkZWZhdWx0IG4K
KwlkZWZhdWx0IHkKIAlkZXBlbmRzIG9uIERSTV9BTURfREMgJiYgWDg2CiAJZGVwZW5kcyBvbiBE
Uk1fQU1EX0RDX0RDTjFfMAogCWRlcGVuZHMgb24gRFJNX0FNRF9EQ19EQ04yXzAKLS0gCjIuMjAu
MQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdm
eCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
