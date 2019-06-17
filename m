Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6F9F48E86
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:27:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D17EF897FD;
	Mon, 17 Jun 2019 19:27:16 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0DE0897FD
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:27:15 +0000 (UTC)
Received: by mail-qk1-x742.google.com with SMTP id l128so6960484qke.2
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:27:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=z65fiiV3BqgnoonIa/wf+KRSz26krvmKTfOc4fAZdek=;
 b=spI1Y4CHIv5O5b1i+80XmfS/F83q1mqaSwBTyCyUa4LdMEHRRyTSYuQ0lB3IPG/tre
 PNmoDTZ35GNK/zhFSoSB6v0quWn8oNgPnbwRYGxUCoHN9n0rgT3qGiOUYTRtG9bcxyZ5
 +4eEsaSm2+0t/YsWYIQ1Y3w5+tn+8N1ZCkZJoVcFpxRAiymtohJ8URp3L4lsL8uwYS85
 JbuLVl7WbVHKDrYfXcqMT4CfK39/jjkhmvf1oO0fn+gPBCVPIoR3aEIYicslPBLGK5Xl
 qRCcRver9qVM6f0jnL0ZEdQWubWAg1NmaIy9NsP0Td1Eh5J9kGZ5T6xOSWIWmT7EZdJM
 GJaw==
X-Gm-Message-State: APjAAAWq92G72PCm1ludHG0jSZNUAqQw3L58KqLZsbQAxjogy6TrcSsP
 Iu9XT6gwsGwn2PAVzJ6Mzeaym3RNfsA=
X-Google-Smtp-Source: APXvYqzZ0uIDlvdJmXCYfjndJv0amvMotjstdiESOlXr473S9wnNpJfgMts+mjLC+A0oF+vY6c3/6w==
X-Received: by 2002:a37:f50f:: with SMTP id l15mr72884311qkk.343.1560799634637; 
 Mon, 17 Jun 2019 12:27:14 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id p37sm7715622qtc.35.2019.06.17.12.27.13
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:27:14 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 102/459] drm/amdgpu/discovery: fix hwid for nbio
Date: Mon, 17 Jun 2019 14:25:27 -0500
Message-Id: <20190617192704.18038-3-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617192704.18038-1-alexander.deucher@amd.com>
References: <20190617192704.18038-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=z65fiiV3BqgnoonIa/wf+KRSz26krvmKTfOc4fAZdek=;
 b=gX9BlkqeiyOu26elyfKejlzwVdSM9SOGpNx33K3vVDLMybiliPlIDnV0Nc+ZsHly1A
 NpjpHLTR6n1iVMwgMcNhGufC4oQT/WFDOfVY50PRhEpp98lndMyZfxzM0P1vyHkEZgH8
 /Bm3afxHqVARs016HPDmUCtBDNlMDW1rysPan8YDJ5qJraEyv5JBd42Cgp6laRKrMtKk
 bF+HwLpqd4WUIAwpgxvhtu9VG1zLD/pX4rteaGmkUcBKPkpehqpMWiN5M7hgvFMalGgO
 1Os2aSzIVaHL5pGfl09jD5EoTplmx8KksC8YZNAfsrDXdfAXQj2BjLL2lKUmB9OLQVGD
 J5Dw==
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
 Hawking Zhang <Hawking.Zhang@amd.com>, Xiaojie Yuan <xiaojie.yuan@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogWGlhb2ppZSBZdWFuIDx4aWFvamllLnl1YW5AYW1kLmNvbT4KClNpZ25lZC1vZmYtYnk6
IFhpYW9qaWUgWXVhbiA8eGlhb2ppZS55dWFuQGFtZC5jb20+ClJldmlld2VkLWJ5OiBIYXdraW5n
IFpoYW5nIDxIYXdraW5nLlpoYW5nQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IEFsZXggRGV1Y2hl
ciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHVfZGlzY292ZXJ5LmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRp
b24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHVfZGlzY292ZXJ5LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfZGlzY292ZXJ5LmMKaW5kZXggYWMwNjVhYjkxYzRiLi5lYzE0ZmQxMzUwZTIgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kaXNjb3ZlcnkuYworKysgYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGlzY292ZXJ5LmMKQEAgLTExNyw3ICsx
MTcsNyBAQCBzdGF0aWMgaW50IGh3X2lkX21hcFtNQVhfSFdJUF0gPSB7CiAJW1NETUExX0hXSVBd
CT0gU0RNQTFfSFdJRCwKIAlbTU1IVUJfSFdJUF0JPSBNTUhVQl9IV0lELAogCVtBVEhVQl9IV0lQ
XQk9IEFUSFVCX0hXSUQsCi0JW05CSU9fSFdJUF0JPSBEQkdVX05CSU9fSFdJRCwKKwlbTkJJT19I
V0lQXQk9IE5CSUZfSFdJRCwKIAlbTVAwX0hXSVBdCT0gTVAwX0hXSUQsCiAJW01QMV9IV0lQXQk9
IE1QMV9IV0lELAogCVtVVkRfSFdJUF0JPSBVVkRfSFdJRCwKLS0gCjIuMjAuMQoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxp
c3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
