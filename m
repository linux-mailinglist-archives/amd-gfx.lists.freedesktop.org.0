Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E0AF69DFB
	for <lists+amd-gfx@lfdr.de>; Mon, 15 Jul 2019 23:24:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F54B89DC1;
	Mon, 15 Jul 2019 21:24:54 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A494F89DBC
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 21:24:49 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id d23so17286082qto.2
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 14:24:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cNnpmG4R3ASrnd6azfQ1rUOWhpY1iG1wjs1rOcaMsu4=;
 b=FECG/jVjTwxMC4JCDTC2+nOJ68efhm/PmZbpjf+NYAWWaeKPH873X408axj7dowsHC
 +2zb9pCNQgUDmnyOorKCKU3hQChFdr8vDttsdVc4rsf96H5MbaSndwysE2H3f3MUOejQ
 grd4J2+YNEIPb4NjamIJ+Lm6VM5YDUiSWriZZeLb+Yt51M2gY6pFD6g0EHGq/74R5Je2
 aActec5vmx63ypm3Mlww1fkm8WVXnG3Sg/Q9q8f/gcbAHnlj1b+2BWrSPYjRbb8CIv2U
 E0bbGSo9sBRG01hxgvymsNcJCUYl98odFeE/1ZhzRmL+vlkmATPkRAc+jDqKh+XB6QQ+
 8Vgg==
X-Gm-Message-State: APjAAAVlxl1g5VxrjeDVT3FUzrf4xLaLW4cI38/VHeap8/0zA+41jDZ1
 kCbZ5Ep1dSjUb97uQdtVVuGi6wuv
X-Google-Smtp-Source: APXvYqzwMgKIKyA4fAWkhS5AftAchbkk4xBcJUP/NKpKacKzaaXx0c9k1ABQ/Q6r+Vjhef2OTQhwjw==
X-Received: by 2002:ac8:74cb:: with SMTP id j11mr15995091qtr.67.1563225888609; 
 Mon, 15 Jul 2019 14:24:48 -0700 (PDT)
Received: from localhost.localdomain ([71.219.21.119])
 by smtp.gmail.com with ESMTPSA id q56sm10274133qtq.64.2019.07.15.14.24.47
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 15 Jul 2019 14:24:48 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 006/102] drm/amdgpu: add gmc basic support for Arcturus
Date: Mon, 15 Jul 2019 16:23:01 -0500
Message-Id: <20190715212437.31793-4-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190715212437.31793-1-alexander.deucher@amd.com>
References: <20190715212437.31793-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cNnpmG4R3ASrnd6azfQ1rUOWhpY1iG1wjs1rOcaMsu4=;
 b=q+UGtDYsUVeulMBDw52EwJWS10TUkGyLeflQmkOySUt1yJjGP/lrJp4M/Hlmhx6Fa9
 0Dlfd5LQCvLVD1kn9eQt3Iz4JRCA8foqz9Sk+qFGp41QUYRWKgfKSLUMqWJZk5TIgImF
 T12wdWQ9WfUUJqm4P7wPsfSM6zDl9FIgVmP5rsNQ+f+2Z4TnHKlgpDH06tuPHO79Nmdj
 RUXxZzQ0PUVUbERmGfEIVuNj0tmnV88VxvO7WdgXDpzoZvh+EgmY32oJdMGUhJ/NdiZ2
 TAORnDvWO8Ghsw2i1UTjMFDJHn1iCac97+N9EaP6Uw9YtXiNmfyqmEFYRH+kBhQdaFDj
 X+WA==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Le Ma <le.ma@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogTGUgTWEgPGxlLm1hQGFtZC5jb20+CgpBZGQgaW5pdGlhbCBHTUMgc3VwcG9ydCBmb3Ig
QXJjdHVydXMKClNpZ25lZC1vZmYtYnk6IExlIE1hIDxsZS5tYUBhbWQuY29tPgpSZXZpZXdlZC1i
eTogSGF3a2luZyBaaGFuZyA8SGF3a2luZy5aaGFuZ0BhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBB
bGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvZ21jX3Y5XzAuYyB8IDUgKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA1IGlu
c2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNf
djlfMC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3Y5XzAuYwppbmRleCBiZDVk
MzY5NDQ0ODEuLmU3OGJlOTYwMDhlNiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvZ21jX3Y5XzAuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjlf
MC5jCkBAIC04ODMsNiArODgzLDcgQEAgc3RhdGljIGludCBnbWNfdjlfMF9tY19pbml0KHN0cnVj
dCBhbWRncHVfZGV2aWNlICphZGV2KQogCQljYXNlIENISVBfVkVHQTEwOiAgLyogYWxsIGVuZ2lu
ZXMgc3VwcG9ydCBHUFVWTSAqLwogCQljYXNlIENISVBfVkVHQTEyOiAgLyogYWxsIGVuZ2luZXMg
c3VwcG9ydCBHUFVWTSAqLwogCQljYXNlIENISVBfVkVHQTIwOgorCQljYXNlIENISVBfQVJDVFVS
VVM6CiAJCWRlZmF1bHQ6CiAJCQlhZGV2LT5nbWMuZ2FydF9zaXplID0gNTEyVUxMIDw8IDIwOwog
CQkJYnJlYWs7CkBAIC05OTgsNiArOTk5LDEwIEBAIHN0YXRpYyBpbnQgZ21jX3Y5XzBfc3dfaW5p
dCh2b2lkICpoYW5kbGUpCiAJCWVsc2UKIAkJCWFtZGdwdV92bV9hZGp1c3Rfc2l6ZShhZGV2LCAy
NTYgKiAxMDI0LCA5LCAzLCA0OCk7CiAJCWJyZWFrOworCWNhc2UgQ0hJUF9BUkNUVVJVUzoKKwkJ
LyogS2VlcCB0aGUgdm0gc2l6ZSBzYW1lIHdpdGggVmVnYTIwICovCisJCWFtZGdwdV92bV9hZGp1
c3Rfc2l6ZShhZGV2LCAyNTYgKiAxMDI0LCA5LCAzLCA0OCk7CisJCWJyZWFrOwogCWRlZmF1bHQ6
CiAJCWJyZWFrOwogCX0KLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9hbWQtZ2Z4
