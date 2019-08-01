Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 870047E436
	for <lists+amd-gfx@lfdr.de>; Thu,  1 Aug 2019 22:30:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE5FB6E7FD;
	Thu,  1 Aug 2019 20:30:34 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com
 [IPv6:2607:f8b0:4864:20::72b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61CF16E7F5
 for <amd-gfx@lists.freedesktop.org>; Thu,  1 Aug 2019 20:30:32 +0000 (UTC)
Received: by mail-qk1-x72b.google.com with SMTP id g18so53100506qkl.3
 for <amd-gfx@lists.freedesktop.org>; Thu, 01 Aug 2019 13:30:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=l82U4tB3ErAVx6k5xcfKxk7vjTPt+TJmhH8qoS0PMZw=;
 b=uVI4L4goxwiEsw+L1yS3AIYR2mg9opZVgKEvBvf8GXOACOonzqMS0YGT6aaEjnvtn6
 EB2H/8s2KFsy6hwlFuFU/tNOw22Z1VVPng6MHgvX4R01dfE/1OjxeuEVyM7mQ44w535E
 qhFkJKhMF+sDj6OQn6eXfCvkUK24nQdAaxW0t15I8L3ooVErA3m8QiZJ59QOlsoLnCEn
 yuHLUDChxnFcsE/KYOFzgsA0eTI2NU+CPz13B6FlCuidjJJ4HktKnxGyDxlwqq7VaOsq
 BUBrR8RrVBwLoqaKhNyKO11r5g9Q3HBHXNwPcvCH8GWJ30fRl9tXf8MF0hzjsgKDu2yT
 J7IQ==
X-Gm-Message-State: APjAAAWJFSyyIyGTrXgxCrzpfG/j6sxzjpBN/8+A8cbRs8K3ZheeASIK
 it0Oz8RDhw0AidWbEaIRuwmJdwod
X-Google-Smtp-Source: APXvYqx3lUn+o7wN//9aeuh/erMZiEGg1PocoM4oufKqQgNuDq6oxcN3G6C9jvpwAz6uQ9xWbt40RQ==
X-Received: by 2002:a37:b86:: with SMTP id 128mr86029417qkl.43.1564691431275; 
 Thu, 01 Aug 2019 13:30:31 -0700 (PDT)
Received: from localhost.localdomain ([71.219.6.100])
 by smtp.gmail.com with ESMTPSA id c20sm25129315qkk.69.2019.08.01.13.30.30
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 01 Aug 2019 13:30:30 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 29/36] drm/amdgpu: add psp ip block for navi12
Date: Thu,  1 Aug 2019 15:29:50 -0500
Message-Id: <20190801202957.29791-30-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190801202957.29791-1-alexander.deucher@amd.com>
References: <20190801202957.29791-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=l82U4tB3ErAVx6k5xcfKxk7vjTPt+TJmhH8qoS0PMZw=;
 b=MfPzYnlma0QONzc+FktNrcQkzYlXjnQyviZ/EC43KGpuxRO/YLpheh+m6GcTI7TbgK
 WuO5z/Joa8jMW2cTCdid8JRN/VuhEAKZuMum2IjSMTI7p4QphgRhLVKuJgRU4L5Uwbz0
 CLSTXfhUogRebcfA0VnxSR+sdvczyWHVS31ourPkztsCJvUdsyv/cTigJgHKTRfQ/L9u
 aQB8C536NESpMUhZ2BFf5miqKQk3wIxtTJPva+Zp1azqZUqT72orCWlZXe2+mPwH+YyD
 rMIkzWogtAsAvlSF+E/HkMe5KaCdJHL8goH69FlBzP9hYKJMyYqKeBadSHInhJxYVCVd
 cEcQ==
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
 Xiaojie Yuan <xiaojie.yuan@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogWGlhb2ppZSBZdWFuIDx4aWFvamllLnl1YW5AYW1kLmNvbT4KClNpZ25lZC1vZmYtYnk6
IFhpYW9qaWUgWXVhbiA8eGlhb2ppZS55dWFuQGFtZC5jb20+ClJldmlld2VkLWJ5OiBKYWNrIFhp
YW8gPEphY2suWGlhb0BhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhh
bmRlci5kZXVjaGVyQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvbnYu
YyB8IDEgKwogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCgpkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvbnYuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L252LmMKaW5kZXggODdkYzU5NTQ2NzcxLi5lNTAzYjIyNmNjZGIgMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L252LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvbnYuYwpAQCAtNDI1LDYgKzQyNSw3IEBAIGludCBudl9zZXRfaXBfYmxvY2tzKHN0cnVjdCBh
bWRncHVfZGV2aWNlICphZGV2KQogCQlhbWRncHVfZGV2aWNlX2lwX2Jsb2NrX2FkZChhZGV2LCAm
bnZfY29tbW9uX2lwX2Jsb2NrKTsKIAkJYW1kZ3B1X2RldmljZV9pcF9ibG9ja19hZGQoYWRldiwg
JmdtY192MTBfMF9pcF9ibG9jayk7CiAJCWFtZGdwdV9kZXZpY2VfaXBfYmxvY2tfYWRkKGFkZXYs
ICZuYXZpMTBfaWhfaXBfYmxvY2spOworCQlhbWRncHVfZGV2aWNlX2lwX2Jsb2NrX2FkZChhZGV2
LCAmcHNwX3YxMV8wX2lwX2Jsb2NrKTsKIAkJaWYgKGFkZXYtPmZpcm13YXJlLmxvYWRfdHlwZSA9
PSBBTURHUFVfRldfTE9BRF9QU1AgJiYKIAkJICAgIGlzX3N1cHBvcnRfc3dfc211KGFkZXYpKQog
CQkJYW1kZ3B1X2RldmljZV9pcF9ibG9ja19hZGQoYWRldiwgJnNtdV92MTFfMF9pcF9ibG9jayk7
Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
