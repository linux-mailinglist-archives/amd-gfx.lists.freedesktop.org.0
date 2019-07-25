Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DFF5754C3
	for <lists+amd-gfx@lfdr.de>; Thu, 25 Jul 2019 18:58:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE7B06E7A0;
	Thu, 25 Jul 2019 16:58:08 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4880B6E7A0
 for <amd-gfx@lists.freedesktop.org>; Thu, 25 Jul 2019 16:58:07 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id w17so5445761qto.10
 for <amd-gfx@lists.freedesktop.org>; Thu, 25 Jul 2019 09:58:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=p7KaadvlK/r7X7owKzUQb7LBGVZTF1qPKf7be8e2gsA=;
 b=QTpIiPLKNKewBND12i8MsBJRpfdYrFUjTGGDSHy61qIaKi+TeVUpybaY0lFuBdzAph
 FE3P/z1UEmamPWpOxauhhbevB/i6S35wfguhZBBSFPn39QVxTqKeccM7m9M42GYY0q6W
 Gj1TY1Fm4+wWrCE0FFQGCNiE7GOjoetdSNShxfwS5CQoN9qiHkD8Il1y6Y6BW8tD0IdP
 UVGJzOiUJxY5LhBapLySyJoQj/OhVyywJLBGJQepd2p54GLvbM5LYcmA1VHhiTa4xt+9
 Gnru7q94+gEE6wpag5T4mco2WXkw26fQcIEvGkuXiK6CTT+sJDke9R7we0yIcpyWWrKD
 pHTw==
X-Gm-Message-State: APjAAAXCHWOVutbUQlUU7hJAFQsIHEd32i6RF1nOJYgZu4/+KbxRBM+i
 E3qO3DH4rZtzNK1ytpp+hhdcir6N
X-Google-Smtp-Source: APXvYqxBaXDx/S82Jl3Qb0+2ew/BZ5JrqbTEJyKn2VOACj4IpGURY9RYw19tTTxTyMJcBVv1WyUMyw==
X-Received: by 2002:ac8:26c8:: with SMTP id 8mr62633000qtp.308.1564073886227; 
 Thu, 25 Jul 2019 09:58:06 -0700 (PDT)
Received: from localhost.localdomain ([71.51.160.180])
 by smtp.gmail.com with ESMTPSA id l6sm21157625qkc.89.2019.07.25.09.58.05
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 25 Jul 2019 09:58:05 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 02/12] drm/amdgpu: add reset_method asic callback for si
Date: Thu, 25 Jul 2019 11:57:48 -0500
Message-Id: <20190725165758.16928-2-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190725165758.16928-1-alexander.deucher@amd.com>
References: <20190725165758.16928-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=p7KaadvlK/r7X7owKzUQb7LBGVZTF1qPKf7be8e2gsA=;
 b=SupAo/t0FD6F44OkMXDsctT7EvdfBdH7+6fGAzIGDYLyudKXRk15yfyoh5xCnlnWAh
 IkE02f/R4UYkJDeKLpkCgWT0LIcHhVbBsOGIsxqgdkLESSQFVFd4BTsmcwEmSNQLX0l+
 B5o8kU2WldirhG96ZdndaMmkcFFuNerAGE1KJbfPpoMz3aFMUYrNr/sb5dXHmmSx2AJ0
 Wig4uBvUBj3PniuYlmtDHeBqUBG3rbeF8P9oMAboXO7CQxer4DtqsmBes7sS3bjjgXmC
 Gk9G9eZ+NAh/ird+tnkD20by1AJKMyKDRw9pQ13f9H5MfWKEaHhRCbVvenJiszxuZU4h
 2fvQ==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Evan Quan <evan.quan@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

U0kgYWx3YXlzIHVzZXMgdGhlIGxlZ2FjeSBwY2kgYmFzZWQgcmVzZXQuCgpSZXZpZXdlZC1ieTog
RXZhbiBRdWFuIDxldmFuLnF1YW5AYW1kLmNvbT4KU2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVy
IDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L3NpLmMgfCA3ICsrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKykKCmRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zaS5jIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvc2kuYwppbmRleCA0YjFlMGMxNmFjNDEuLjkwNDM2MTQ1MTY1MCAxMDA2
NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc2kuYworKysgYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9zaS5jCkBAIC0xMTg1LDYgKzExODUsMTIgQEAgc3RhdGljIGludCBz
aV9hc2ljX3Jlc2V0KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQogCXJldHVybiAwOwogfQog
CitzdGF0aWMgZW51bSBhbWRfcmVzZXRfbWV0aG9kCitzaV9hc2ljX3Jlc2V0X21ldGhvZChzdHJ1
Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKK3sKKwlyZXR1cm4gQU1EX1JFU0VUX01FVEhPRF9MRUdB
Q1k7Cit9CisKIHN0YXRpYyB1MzIgc2lfZ2V0X2NvbmZpZ19tZW1zaXplKHN0cnVjdCBhbWRncHVf
ZGV2aWNlICphZGV2KQogewogCXJldHVybiBSUkVHMzIobW1DT05GSUdfTUVNU0laRSk7CkBAIC0x
MzkzLDYgKzEzOTksNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGFtZGdwdV9hc2ljX2Z1bmNzIHNp
X2FzaWNfZnVuY3MgPQogCS5yZWFkX2Jpb3NfZnJvbV9yb20gPSAmc2lfcmVhZF9iaW9zX2Zyb21f
cm9tLAogCS5yZWFkX3JlZ2lzdGVyID0gJnNpX3JlYWRfcmVnaXN0ZXIsCiAJLnJlc2V0ID0gJnNp
X2FzaWNfcmVzZXQsCisJLnJlc2V0X21ldGhvZCA9ICZzaV9hc2ljX3Jlc2V0X21ldGhvZCwKIAku
c2V0X3ZnYV9zdGF0ZSA9ICZzaV92Z2Ffc2V0X3N0YXRlLAogCS5nZXRfeGNsayA9ICZzaV9nZXRf
eGNsaywKIAkuc2V0X3V2ZF9jbG9ja3MgPSAmc2lfc2V0X3V2ZF9jbG9ja3MsCi0tIAoyLjIwLjEK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZngg
bWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
