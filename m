Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 261E6550F9
	for <lists+amd-gfx@lfdr.de>; Tue, 25 Jun 2019 15:58:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6FFA6E103;
	Tue, 25 Jun 2019 13:58:46 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52B046E100
 for <amd-gfx@lists.freedesktop.org>; Tue, 25 Jun 2019 13:58:43 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id x47so18421951qtk.11
 for <amd-gfx@lists.freedesktop.org>; Tue, 25 Jun 2019 06:58:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lFaUx/xPconXGNgyUXSIKOXfRKb6/mgIhyRGjaCsZHM=;
 b=UT+GZvm1PLO44nYF3TS1toeCyrwygLoZggZrLIUmHkNePJxwpbjZVq2Lh9fBY4i87k
 ldiGmKSVOuvmhyq/sM3BsdrzQ9N9co5MpSvWwtKKutK9fZ7UTDuwr9xlDonhuSjFiz50
 J5vcB5PThiwo2rjOvtGScOn+RHZdI55OpOojevlRSkRetpbTj3W6ZJ3fVenICoXeTr8/
 jwLqP+YNIecWspfAvGkfD6B9DYadLGNcntLWtevxRSr6Nd0H6vCnQfz2p5r8QnPzs1ZK
 /yHjpN5lK8CUuxTvTk8YGZ9CriEe4tyn9GdISUkcDAryk0ksDPEUosvUqw0bSiD4stGf
 eV0w==
X-Gm-Message-State: APjAAAViTY/k/iI/+zWub494bIyCMKmkzB5E01wstiwJuu2Z92PBw+/r
 Z+8FvZQC7veNlDWL0psTci3ic3k6gLY=
X-Google-Smtp-Source: APXvYqyiuS/WJC4k8EP60dM7nva+HnywRA3RNKDQF4PCZLw/rGj+DMGjE5ooD8OdY0ytSTZu4KOhCg==
X-Received: by 2002:aed:3ac1:: with SMTP id o59mr51650628qte.260.1561471122281; 
 Tue, 25 Jun 2019 06:58:42 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id p23sm6473632qkm.55.2019.06.25.06.58.41
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 25 Jun 2019 06:58:41 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 2/2] drm/amdgpu/display: switch udelay to msleep
Date: Tue, 25 Jun 2019 08:58:30 -0500
Message-Id: <20190625135830.26173-2-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190625135830.26173-1-alexander.deucher@amd.com>
References: <20190625135830.26173-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lFaUx/xPconXGNgyUXSIKOXfRKb6/mgIhyRGjaCsZHM=;
 b=BStv91hknP5ijJ110qbiQP6Y/jhOxVROVjn9tictqQNIaAzQZzb/iE9Ozpt4gQehsR
 r+fmrIbbelKtzp+KqAcpy0a8w7JK8lLSqXzM/aVPik98ajn+UKzI5LkXd9prJ9cL6FrC
 1LguChklhWj0fzjrwnW9UonnA8JHiY0zYmyBzpvHo/Chk7vlfoFNgUOI6Xruq6jne854
 utJUYj0EbMs5z9Hl7T++/6Yz369BM6/Lqk+IIPuVhlgI0tKpBP3aAcIkioi+8NY6eL4c
 C5jYzuSx2BLOfu+cjuGd9F+FRAnregdE/0YP8+TaLAUKli/u9nSc8C2mGzKOGqh7Ub+N
 wF0Q==
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

V2UgbWF5IG5lZWQgdG8gc2xlZXAgZm9yIHVwIHRvIDgwbXM6CgovKiBGaXJzdCBEUENEIHJlYWQg
YWZ0ZXIgVkREIE9OIGNhbiBmYWlsIGlmIHRoZSBwYXJ0aWN1bGFyIGJvYXJkCiAqIGRvZXMgbm90
IGhhdmUgSFBEIHBpbiB3aXJlZCBjb3JyZWN0bHkuIFNvIGlmIERQQ0QgcmVhZCBmYWlscywKICog
d2hpY2ggaXQgc2hvdWxkIG5ldmVyIGhhcHBlbiwgcmV0cnkgYSBmZXcgdGltZXMuIFRhcmdldCB3
b3JzdAogKiBjYXNlIHNjZW5hcmlvIG9mIDgwIG1zLgogKi8KClN3aXRjaCB1ZGVsYXkgdG8gbXNs
ZWVwIHRvIGF2b2lkIGxpbWl0cyBvbiBhcm0uCgpTaWduZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIg
PGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNw
bGF5L2RjL2NvcmUvZGNfbGluay5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9u
KCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNw
bGF5L2RjL2NvcmUvZGNfbGluay5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2Nv
cmUvZGNfbGluay5jCmluZGV4IGQ2ZjhiZTY1NGMyZS4uYzE3ZGI1YzE0NGFhIDEwMDY0NAotLS0g
YS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9kY19saW5rLmMKKysrIGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUvZGNfbGluay5jCkBAIC01NTAsNyArNTUw
LDcgQEAgc3RhdGljIHZvaWQgcmVhZF9lZHBfY3VycmVudF9saW5rX3NldHRpbmdzX29uX2RldGVj
dChzdHJ1Y3QgZGNfbGluayAqbGluaykKIAkJCWJyZWFrOwogCQl9CiAKLQkJdWRlbGF5KDgwMDAp
OworCQltc2xlZXAoOCk7CiAJfQogCiAJQVNTRVJUKHN0YXR1cyA9PSBEQ19PSyk7Ci0tIAoyLjIw
LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1n
ZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
