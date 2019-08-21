Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33DF898736
	for <lists+amd-gfx@lfdr.de>; Thu, 22 Aug 2019 00:24:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D9DB6EA38;
	Wed, 21 Aug 2019 22:24:37 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 332F66EA29
 for <amd-gfx@lists.freedesktop.org>; Wed, 21 Aug 2019 22:24:36 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id y26so5127066qto.4
 for <amd-gfx@lists.freedesktop.org>; Wed, 21 Aug 2019 15:24:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=asQCqzYzFXji/e9C2z/om+xVpWm2jPo+tfjAJAt3XeU=;
 b=OtHI2QK9rIObfr7wi/sxnqMc8Y76sMyUhoborwa2owt4SjAQcWdraycvajmbBfdjNV
 iw6tf+CN2o0fHap66Id4DIjQXWGgMFwxr6CttS27NyXHYInDpUP6Gz51MiAR8/DZQmhA
 UQqszNvoucfYfxlZEY1huyNg/Fj1XOFuvRk+ko1wcnihC6aE+ZJ8hbcrqHjEnXtj8oYm
 6h54Gu+tu3ztViHzqhOPbPBzRxjKF0iKaYrVnGABp8m7uu/dkNxdXjiPpYKbiAvo/Dts
 Bg78orMp0emLlYKR4oiFZqNowbk5HArTjha0bB2w8iOafK44MiNy8RSbMLpOeAdh6lav
 HJ6A==
X-Gm-Message-State: APjAAAWc5tlCEGCzyYyrv9M4ZQaoR0Y4C/GMsD4GO3fSFO9QHRUrZnpW
 HtSuKKgi513ig+r7fyLig8E7d1i9
X-Google-Smtp-Source: APXvYqwy6/s99SvzvViXc1rQqJAdhVc2TUP5Xy0v+6jKRVdul4Ye/IR7le8pjjceVROqATjk4mZRFg==
X-Received: by 2002:ac8:7151:: with SMTP id h17mr34144327qtp.167.1566426274984; 
 Wed, 21 Aug 2019 15:24:34 -0700 (PDT)
Received: from localhost.localdomain ([71.219.73.178])
 by smtp.gmail.com with ESMTPSA id w1sm10853983qte.36.2019.08.21.15.24.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Aug 2019 15:24:34 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 27/37] drm/amdgpu: enable athub clock gating for rn
Date: Wed, 21 Aug 2019 17:23:49 -0500
Message-Id: <20190821222359.13578-28-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190821222359.13578-1-alexander.deucher@amd.com>
References: <20190821222359.13578-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=asQCqzYzFXji/e9C2z/om+xVpWm2jPo+tfjAJAt3XeU=;
 b=U7UD40WUPa89uw00McYuFLIhnRZID6bd2rLwtvP1/YqVjXmy62jYubVgKDeqIFQn+C
 mxDOkzpLf0JqHxGTVR3jNcLPslqUAupeCqbnhMKiiCc2LSI1FtWXL9hMW7NaWRUu8fZI
 exJum3xkFTH35KX5vJyNwVR5V7RGAlS8K9+emelWT/qdheL+eccSqDNBSZYeuaZLVF3O
 8B7u40TkDL3BXE+NL9BpNZ/9pvZA0ZWGviqsLzMCNej8OzjyjZA2cvXy7mbwli3FH/sc
 wmjMqMS/ViXcLLCu2IuL57TP0ZWrTCRrSv+JB4mr+zHwMNTTtktSm3NOM9gd+izlG73v
 0qEA==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Prike Liang <Prike.Liang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogUHJpa2UgTGlhbmcgPFByaWtlLkxpYW5nQGFtZC5jb20+CgpFbmFibGUgYXRodWIgTUcg
YW5kIExTIGNsb2NrIGdhdGluZy4KClNpZ25lZC1vZmYtYnk6IFByaWtlIExpYW5nIDxQcmlrZS5M
aWFuZ0BhbWQuY29tPgpSZXZpZXdlZC1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hl
ckBhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVy
QGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc29jMTUuYyB8IDQgKysr
LQogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NvYzE1LmMgYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9zb2MxNS5jCmluZGV4IDgxZGQxYWM2MDg2ZC4uMDU1Mjk0MmVlNzMyIDEw
MDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zb2MxNS5jCisrKyBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NvYzE1LmMKQEAgLTExNjksNyArMTE2OSw5IEBAIHN0YXRp
YyBpbnQgc29jMTVfY29tbW9uX2Vhcmx5X2luaXQodm9pZCAqaGFuZGxlKQogCQkJCSBBTURfQ0df
U1VQUE9SVF9IRFBfTFMgfAogCQkJCSBBTURfQ0dfU1VQUE9SVF9ST01fTUdDRyB8CiAJCQkJIEFN
RF9DR19TVVBQT1JUX1ZDTl9NR0NHIHwKLQkJCQkgQU1EX0NHX1NVUFBPUlRfSUhfQ0c7CisJCQkJ
IEFNRF9DR19TVVBQT1JUX0lIX0NHIHwKKwkJCQkgQU1EX0NHX1NVUFBPUlRfQVRIVUJfTFMgfAor
CQkJCSBBTURfQ0dfU1VQUE9SVF9BVEhVQl9NR0NHOwogCQlhZGV2LT5wZ19mbGFncyA9IDA7CiAJ
CWFkZXYtPmV4dGVybmFsX3Jldl9pZCA9IGFkZXYtPnJldl9pZCArIDB4OTE7CiAKLS0gCjIuMjAu
MQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdm
eCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
