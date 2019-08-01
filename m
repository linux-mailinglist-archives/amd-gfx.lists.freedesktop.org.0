Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 91D1F7E380
	for <lists+amd-gfx@lfdr.de>; Thu,  1 Aug 2019 21:50:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 200906E79D;
	Thu,  1 Aug 2019 19:50:57 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEABD6E79B
 for <amd-gfx@lists.freedesktop.org>; Thu,  1 Aug 2019 19:50:55 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id 44so40506403qtg.11
 for <amd-gfx@lists.freedesktop.org>; Thu, 01 Aug 2019 12:50:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EeE+VwPO20j9QA4uCX432Vb42MOv8IQjalLBF/j9iN4=;
 b=E0mHmlWB+TIV0w9+skHCFe+L+RfX32GIyXXYbfv7uJcjwJbme1ES1kk+qxaQbWi2ia
 NgfmRQxy4/1T2FDHENYffWzrGohf+9WjuDW8Y1N7yBaZst507ouKM5lvsLNKKb+zzwF3
 gDWOEnvka0xL8ZYnK0ZbXToZFBTqgaImz56x46AreCIAFoILVt5aeyl3qUrO2qALV3Qr
 sWO9ezIOwszGraKwDV2mvVugSitFFmiV0doklEFGpHA0wq272qcar3goKc7ddFJ+tZHN
 aqmJCwhZsjFgmxl9xj4onlhiySA4TYhJMMmaJtUl29kX3VVW8qUhu7/hrMGOtVmBQCro
 VNWg==
X-Gm-Message-State: APjAAAUOmAINv1X7MAPkX2AGTXRAy3EuYJa7KcN1bPUkb1Y2d4nobsnX
 qD9kR1JhjIN2gEhLs3+2mG595oGC
X-Google-Smtp-Source: APXvYqxNFLlQL9Ip5hThkzgVltyBRbbJ5yZa5d7uxsYe4fTntNERvUJMVWhtM/xGHw5DKOKXKyfxFQ==
X-Received: by 2002:a0c:d0f6:: with SMTP id b51mr90841527qvh.225.1564689054825; 
 Thu, 01 Aug 2019 12:50:54 -0700 (PDT)
Received: from localhost.localdomain ([71.219.6.100])
 by smtp.gmail.com with ESMTPSA id f26sm39941602qtf.44.2019.08.01.12.50.53
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 01 Aug 2019 12:50:54 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 4/7] drm/amdgpu: update PSP CMD fail response status print
Date: Thu,  1 Aug 2019 14:50:41 -0500
Message-Id: <20190801195044.10331-4-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190801195044.10331-1-alexander.deucher@amd.com>
References: <20190801195044.10331-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EeE+VwPO20j9QA4uCX432Vb42MOv8IQjalLBF/j9iN4=;
 b=OSA5zd8/Mp1ldVjsThuCcJJjqwomldoE3jm1jCeGmF7i+ZG4aAC8UO5yrw0ym7qPyR
 atYupnlL5MQLUL/hLa1ZDuCeVd4aWIJahDF/7XVtG3Ws4TLPisTa3W1GwgR7T7/4xCW0
 phbdm21YTBUXugKO2Sm0yjUMm9IkvJILmWYA5wOMBduehWjqZ2qVWZ/6Uj5h1rAHQh9O
 vBOzMtbH6J50m+vWhJT0FiZPx/AhPf3XFycgNjlVPlyT9csSjUNZYBmd8bq8NSTPeq4i
 57NXFYIEVzM5Cthq03RaDw8Pbuxde8I3dhNfEN6+tntNHMs+1zjU7j7c+loIA2QIufl8
 ZzFg==
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
 John Clements <john.clements@amd.com>, Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSm9obiBDbGVtZW50cyA8Sm9obi5DbGVtZW50c0BhbWQuY29tPgoKUHJpbnQgdGhlIHJl
c3BvbnNlIGluIGhleCB3aXRoIHRoZSBhcHBycHJpYXRlIG1hc2suCgpTaWduZWQtb2ZmLWJ5OiBK
b2huIENsZW1lbnRzIDxqb2huLmNsZW1lbnRzQGFtZC5jb20+ClJldmlld2VkLWJ5OiBIYXdraW5n
IFpoYW5nIDxIYXdraW5nLlpoYW5nQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IEFsZXggRGV1Y2hl
ciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHVfcHNwLmMgfCA0ICsrLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMo
KyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X3BzcC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3BzcC5j
CmluZGV4IDRiMTM4NTQ1N2Y4Mi4uZmY3NTgwYWU0ZWU2IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcHNwLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1X3BzcC5jCkBAIC0xNjQsOCArMTY0LDggQEAgcHNwX2NtZF9zdWJtaXRfYnVm
KHN0cnVjdCBwc3BfY29udGV4dCAqcHNwLAogCQlpZiAodWNvZGUpCiAJCQlEUk1fV0FSTigiZmFp
bGVkIHRvIGxvYWQgdWNvZGUgaWQgKCVkKSAiLAogCQkJCSAgdWNvZGUtPnVjb2RlX2lkKTsKLQkJ
RFJNX1dBUk4oInBzcCBjb21tYW5kIGZhaWxlZCBhbmQgcmVzcG9uc2Ugc3RhdHVzIGlzICglZClc
biIsCi0JCQkgIHBzcC0+Y21kX2J1Zl9tZW0tPnJlc3Auc3RhdHVzKTsKKwkJRFJNX1dBUk4oInBz
cCBjb21tYW5kIGZhaWxlZCBhbmQgcmVzcG9uc2Ugc3RhdHVzIGlzICgweCVYKVxuIiwKKwkJCSAg
cHNwLT5jbWRfYnVmX21lbS0+cmVzcC5zdGF0dXMgJiBHRlhfQ01EX1NUQVRVU19NQVNLKTsKIAkJ
aWYgKCF0aW1lb3V0KSB7CiAJCQltdXRleF91bmxvY2soJnBzcC0+bXV0ZXgpOwogCQkJcmV0dXJu
IC1FSU5WQUw7Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1k
LWdmeA==
