Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A6A2748F28
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:31:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30BF189B70;
	Mon, 17 Jun 2019 19:31:17 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A607689306
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:31:15 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id s15so12210981qtk.9
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:31:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=T3cbXF78YeIRfFjbYSTEV89m7vVO7ODy6/E1F4eNieU=;
 b=Ha+oHedP6xBLKVjY3LqQBVnu/aNbiSgmGtX49zxKulV3GQhKixGEYVMNx1uTkWaXt5
 Rbxb6adw7vuQf2lMpfZ4xLKRYQxE+ucKiFEMiXYEGJtqkmt5RTD7rXPRDReck1uiSIxu
 wJQZjmFfC8UCSjvCqPSIQYYvVjYh1bppw8zg9FjaicymLsHF9LNbfwwi4nmye/KtU3Sn
 o5BWWTeFvu+HNZIEW/90m1iWMU4Wa1Ro73r4ptRlZMr5ttY6bZ2sUEfRCFOA0+yn/6E0
 8w8ITul+GFRXsh36GLjEWic69JYCVko3uIm1nbQqaswWCdFeWhuI2XrfXoiikd3y1uns
 4u6A==
X-Gm-Message-State: APjAAAXESZu4CG8illWpONmyKLH+aqAGuzzgifFD9Py8y3eXvzRlhLOg
 CixhxMP90D9XJi8Wcmv1X2v8D+v0SbQ=
X-Google-Smtp-Source: APXvYqxVkcfGNLzfgjOLPJFhZOvOFzBhnRW/bf69XMwPTNaHQWOv3zPBzXONrp5XKobWW9F4AanMIg==
X-Received: by 2002:ac8:1010:: with SMTP id z16mr84996181qti.367.1560799874636; 
 Mon, 17 Jun 2019 12:31:14 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id u2sm7474875qtj.97.2019.06.17.12.31.13
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:31:14 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 201/459] drm/amdgpu: fix memory leak in preemption unit test
Date: Mon, 17 Jun 2019 14:29:28 -0500
Message-Id: <20190617193106.18231-2-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617193106.18231-1-alexander.deucher@amd.com>
References: <20190617193106.18231-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=T3cbXF78YeIRfFjbYSTEV89m7vVO7ODy6/E1F4eNieU=;
 b=mppFIPoliv93qMT2a4+m+IItutl8gIQGO3oMLPMujnh0JdzvSMfNBqJ5dJ8oPo5fwk
 OB4FilWAUDN1ogLA6x+DHgfTWmtAEm+qMBzRUDZJeBMNDH9JGAxc3mQWtBNFysOGd+yb
 dCgqLH4l7XPdO9oMum8Td3xC+NY7QMvH8B0emtNuGEQEAJQMy3s4SMMFOKJaA0UUKedR
 OOPpOszI9w37fKBQv/shGGNW+/U5abfNH55Wx6zvvhDrqEE7hBM8bq/hwaHvK3QYUG7G
 yOKbDIaLlw2O6FWxn7p+86Gzpmm4bt+6/LIzCNyip3+Mqso3jEj8egLtcWIp9/PqPZmr
 WFnw==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Jack Xiao <Jack.Xiao@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSmFjayBYaWFvIDxKYWNrLlhpYW9AYW1kLmNvbT4KCkl0IGZvcmdvdCB0byBwdXQgam9i
IGZlbmNlLCBjYXVzZWQgZmVuY2UgbWVtb3J5IGxlYWsuCgpTaWduZWQtb2ZmLWJ5OiBKYWNrIFhp
YW8gPEphY2suWGlhb0BhbWQuY29tPgpSZXZpZXdlZC1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5k
ZXIuZGV1Y2hlckBhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRl
ci5kZXVjaGVyQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
X2RlYnVnZnMuYyB8IDQgKysrLQogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMSBk
ZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV9kZWJ1Z2ZzLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGVidWdmcy5j
CmluZGV4IDI4NjE0ZGQwNWY4OC4uNDk5N2VmYTA5Y2U3IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGVidWdmcy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV9kZWJ1Z2ZzLmMKQEAgLTk2OCwxMCArOTY4LDEyIEBAIHN0YXRpYyB2
b2lkIGFtZGdwdV9pYl9wcmVlbXB0X3NpZ25hbF9mZW5jZXMoc3RydWN0IGRtYV9mZW5jZSAqKmZl
bmNlcywKIHN0YXRpYyB2b2lkIGFtZGdwdV9pYl9wcmVlbXB0X2pvYl9yZWNvdmVyeShzdHJ1Y3Qg
ZHJtX2dwdV9zY2hlZHVsZXIgKnNjaGVkKQogewogCXN0cnVjdCBkcm1fc2NoZWRfam9iICpzX2pv
YjsKKwlzdHJ1Y3QgZG1hX2ZlbmNlICpmZW5jZTsKIAogCXNwaW5fbG9jaygmc2NoZWQtPmpvYl9s
aXN0X2xvY2spOwogCWxpc3RfZm9yX2VhY2hfZW50cnkoc19qb2IsICZzY2hlZC0+cmluZ19taXJy
b3JfbGlzdCwgbm9kZSkgewotCQlzY2hlZC0+b3BzLT5ydW5fam9iKHNfam9iKTsKKwkJZmVuY2Ug
PSBzY2hlZC0+b3BzLT5ydW5fam9iKHNfam9iKTsKKwkJZG1hX2ZlbmNlX3B1dChmZW5jZSk7CiAJ
fQogCXNwaW5fdW5sb2NrKCZzY2hlZC0+am9iX2xpc3RfbG9jayk7CiB9Ci0tIAoyLjIwLjEKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFp
bGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
