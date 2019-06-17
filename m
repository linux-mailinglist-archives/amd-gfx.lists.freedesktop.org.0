Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C252748E98
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:27:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F43F8985A;
	Mon, 17 Jun 2019 19:27:26 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9878C8985A
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:27:24 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id j19so12176168qtr.12
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:27:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YhBCTqswIb5lUStstabeSRg+EZg8BdoLvcIskFD3Mk4=;
 b=uKb0OAJF25+eRA3yOVD8rG4MyJQOkfLBJO+pcet4MTowOt92jHZKmirmNZjA8PVQzE
 d8nZMBRpq/pSs1kQ1rJdLgcsHwaUUDhqnJheU/T4MeDGPgLCLqTbjBSiB0+GoEpOnVPy
 4HXNFu7KUzj5XRozkb1v5PqSIRnanPyAi9PAhq9Okq87VOgP8/hwuKEKt95BCpz/ydcJ
 4PxG1KmYS2mZUbcpwsUu3DCWU8Us+ApEKHexrWtlfzMl2RBmjxu0tbzsbOhWxqBPQWgO
 ROjQiOLCA5fEDqYiHRkaSSj7VS0TqRvgcnqokIKX4XSUzGvJ/SzCuCVuN255/n6czfKS
 N8HQ==
X-Gm-Message-State: APjAAAWaigZuP8CusV7Bkpkcf7u6UuDiN9qBncGlacB+JykSjpNePKwM
 43RZVlvHLeJBBnSW4gWrP5wDZtAoiZc=
X-Google-Smtp-Source: APXvYqzL+wIh5qAkkh5JhDbXkm70knQ6Nfp2X8+VtmHXffjBh8dRfG8bGFtgEpUbUMEsvcpBH8XVKA==
X-Received: by 2002:a05:6214:222:: with SMTP id
 j2mr22603558qvt.121.1560799643082; 
 Mon, 17 Jun 2019 12:27:23 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id p37sm7715622qtc.35.2019.06.17.12.27.22
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:27:22 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 112/459] drm/amdgpu: add Navi10 VCN firmware support
Date: Mon, 17 Jun 2019 14:25:37 -0500
Message-Id: <20190617192704.18038-13-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617192704.18038-1-alexander.deucher@amd.com>
References: <20190617192704.18038-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YhBCTqswIb5lUStstabeSRg+EZg8BdoLvcIskFD3Mk4=;
 b=NysVQvZC0CWA/5UD9phkrAEzZcd6Zv8JMz5Wti5tgoAmRLYdSaimYiNHkI0AFD/1mN
 BzKWJwVPIAXs8+5U0OD9zbC9AIwnnUSnYwba2HrTBBBd0FITWLXuDPOpx5mdKBoV/ZXg
 9yswwWNtvoR9GgoWoZEmTrreVbZ0tqoNuGwjpK8oat5b1hIxOL2/ELrfF+1TnFBYNAcu
 mgRSXhA0whDZ23CZiXK8MBCvDZUFWS2FjoR8S2ihBVGFfcNEPkxTpanPNTn759Z/S1ts
 pXqxGx0Fm0iQbp/DJPL0wb/ItxYpKUfKixDCREGCm07l5WiXTMZXX4t7f+f36iqGAt6C
 Zu9A==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Leo Liu <leo.liu@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogTGVvIExpdSA8bGVvLmxpdUBhbWQuY29tPgoKQWRkIE5hdmkxMCB0byBWQ04gZmFtaWx5
CgpTaWduZWQtb2ZmLWJ5OiBMZW8gTGl1IDxsZW8ubGl1QGFtZC5jb20+ClJldmlld2VkLWJ5OiBB
bGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IEFs
ZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfdmNuLmMgfCA1ICsrKysrCiAxIGZpbGUgY2hhbmdlZCwgNSBp
bnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1X3Zjbi5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Zjbi5jCmluZGV4
IGQ3ODYwOTgzNjRkZC4uOGVjZTQyN2I2MDE5IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfdmNuLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1X3Zjbi5jCkBAIC00NSwxMCArNDUsMTIgQEAKICNkZWZpbmUgRklSTVdBUkVfUkFWRU4J
CSJhbWRncHUvcmF2ZW5fdmNuLmJpbiIKICNkZWZpbmUgRklSTVdBUkVfUElDQVNTTwkiYW1kZ3B1
L3BpY2Fzc29fdmNuLmJpbiIKICNkZWZpbmUgRklSTVdBUkVfUkFWRU4yCQkiYW1kZ3B1L3JhdmVu
Ml92Y24uYmluIgorI2RlZmluZSBGSVJNV0FSRV9OQVZJMTAgCSJhbWRncHUvbmF2aTEwX3Zjbi5i
aW4iCiAKIE1PRFVMRV9GSVJNV0FSRShGSVJNV0FSRV9SQVZFTik7CiBNT0RVTEVfRklSTVdBUkUo
RklSTVdBUkVfUElDQVNTTyk7CiBNT0RVTEVfRklSTVdBUkUoRklSTVdBUkVfUkFWRU4yKTsKK01P
RFVMRV9GSVJNV0FSRShGSVJNV0FSRV9OQVZJMTApOwogCiBzdGF0aWMgdm9pZCBhbWRncHVfdmNu
X2lkbGVfd29ya19oYW5kbGVyKHN0cnVjdCB3b3JrX3N0cnVjdCAqd29yayk7CiAKQEAgLTcxLDYg
KzczLDkgQEAgaW50IGFtZGdwdV92Y25fc3dfaW5pdChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRl
dikKIAkJZWxzZQogCQkJZndfbmFtZSA9IEZJUk1XQVJFX1JBVkVOOwogCQlicmVhazsKKwljYXNl
IENISVBfTkFWSTEwOgorCQlmd19uYW1lID0gRklSTVdBUkVfTkFWSTEwOworCQlicmVhazsKIAlk
ZWZhdWx0OgogCQlyZXR1cm4gLUVJTlZBTDsKIAl9Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFt
ZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
