Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0702CD1767
	for <lists+amd-gfx@lfdr.de>; Wed,  9 Oct 2019 20:15:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B8E46EA32;
	Wed,  9 Oct 2019 18:15:15 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC8936EA32
 for <amd-gfx@lists.freedesktop.org>; Wed,  9 Oct 2019 18:15:13 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id l51so4483366qtc.4
 for <amd-gfx@lists.freedesktop.org>; Wed, 09 Oct 2019 11:15:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+lyTSZwX5XY7B2NrAxQvliQeI28fCgCMHjPWEUXwpgA=;
 b=WkNEWesOKMZxTF3zkB7AQw2D3p3s2SB3pYp/qqV7jQNpjXKCpOLxpRkRJN0/iqidpV
 PUkOY50FJJj+NVX4tHlrj/ehPzeP5hiPxcniahF3IkqVsLfZwiO37YjyB1eNBx5cGA9z
 KxWi8ATpRXcKCJeINaCT30TOZ1XbDiZ70PciOEFakOebkAHe4pqkBPCLCnIunzGWPYMw
 XOCseUMyChEx3wui0pZTEfF7GkXtcaWKVSgljW2eN40q9/GHsjKYJBMkLbgiMn5MvQbe
 +hZ9sCJ6/6mG5JCAdAfWYZ95xxlMwzT05tjHCDRF9EbJkq9zB9ELNa6SNrCWlsGB3ZA6
 moLg==
X-Gm-Message-State: APjAAAVuZQlXQL90+ZwPUsg+mjms/6AS9SzI5Xd+mCUfXsOSC14PwGCw
 QkkDz/3d4r02UBi8dfyPNtMn/q5Q
X-Google-Smtp-Source: APXvYqzWvRAfhYx4iNs2faVfsK+kH7tw1F/hz+AT/k2dV4IYDLnOm3NqWylJBtsxKiSA9MGrdKHEBQ==
X-Received: by 2002:ac8:240c:: with SMTP id c12mr5146364qtc.361.1570644912328; 
 Wed, 09 Oct 2019 11:15:12 -0700 (PDT)
Received: from localhost.localdomain ([71.51.171.205])
 by smtp.gmail.com with ESMTPSA id n4sm1325553qkc.61.2019.10.09.11.15.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Oct 2019 11:15:11 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org,
	kmahlkuc@linux.vnet.ibm.com
Subject: [PATCH] Revert "drm/radeon: Fix EEH during kexec"
Date: Wed,  9 Oct 2019 13:15:03 -0500
Message-Id: <20191009181503.20381-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+lyTSZwX5XY7B2NrAxQvliQeI28fCgCMHjPWEUXwpgA=;
 b=hTzT6OVdd6PD3fdZnfkL8h6nk13LQVIR3bOnyceDIM8hVSJFGVdzMWXWUz9mjyi4fc
 eG/uCgkAvKyPLNAQ4jXB5m07DlU578vgsDa18R7CrflLLYQxUc/MwkKckGztUCZcuNnb
 716dHo2hPaVChQbWXE7FrNEmVS6BjSGONIQQGnnKseLiPVgpmP9JyZ0VRm3yxrwnQiTn
 es7+Qfv+9ZgYXM2tb1chLRyaCkTLz0JlH5Op3QzxQ1k0F8MklGvszZwsQEi2fBKxWbqL
 je4h7M1HAIVtx0MffQywcUGWjM8RmENv1wbPJ7ya4jU+ujeuHKtTjIDaCayY2+0qDjmY
 BXuA==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VGhpcyByZXZlcnRzIGNvbW1pdCA2ZjdmZTlhOTNlNmMwOWJmOTg4YzUwNTk0MDNmNWY4OGUxN2Uy
MWU2LgoKVGhpcyBicmVha3Mgc29tZSBib2FyZHMuICBNYXliZSBqdXN0IGVuYWJsZSB0aGlzIG9u
IFBQQyBmb3IKbm93PwoKQnVnOiBodHRwczovL2J1Z3ppbGxhLmtlcm5lbC5vcmcvc2hvd19idWcu
Y2dpP2lkPTIwNTE0NwpTaWduZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVj
aGVyQGFtZC5jb20+CkNjOiBzdGFibGVAdmdlci5rZXJuZWwub3JnCi0tLQogZHJpdmVycy9ncHUv
ZHJtL3JhZGVvbi9yYWRlb25fZHJ2LmMgfCA4IC0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgOCBk
ZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9k
cnYuYyBiL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX2Rydi5jCmluZGV4IDQyNjdjYjU1
YmMzMy4uMmJjNTZmODI5YmY3IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3Jh
ZGVvbl9kcnYuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9kcnYuYwpAQCAt
Mzc4LDE5ICszNzgsMTEgQEAgcmFkZW9uX3BjaV9yZW1vdmUoc3RydWN0IHBjaV9kZXYgKnBkZXYp
CiBzdGF0aWMgdm9pZAogcmFkZW9uX3BjaV9zaHV0ZG93bihzdHJ1Y3QgcGNpX2RldiAqcGRldikK
IHsKLQlzdHJ1Y3QgZHJtX2RldmljZSAqZGRldiA9IHBjaV9nZXRfZHJ2ZGF0YShwZGV2KTsKLQog
CS8qIGlmIHdlIGFyZSBydW5uaW5nIGluIGEgVk0sIG1ha2Ugc3VyZSB0aGUgZGV2aWNlCiAJICog
dG9ybiBkb3duIHByb3Blcmx5IG9uIHJlYm9vdC9zaHV0ZG93bgogCSAqLwogCWlmIChyYWRlb25f
ZGV2aWNlX2lzX3ZpcnR1YWwoKSkKIAkJcmFkZW9uX3BjaV9yZW1vdmUocGRldik7Ci0KLQkvKiBT
b21lIGFkYXB0ZXJzIG5lZWQgdG8gYmUgc3VzcGVuZGVkIGJlZm9yZSBhCi0JKiBzaHV0ZG93biBv
Y2N1cnMgaW4gb3JkZXIgdG8gcHJldmVudCBhbiBlcnJvcgotCSogZHVyaW5nIGtleGVjLgotCSov
Ci0JcmFkZW9uX3N1c3BlbmRfa21zKGRkZXYsIHRydWUsIHRydWUsIGZhbHNlKTsKIH0KIAogc3Rh
dGljIGludCByYWRlb25fcG1vcHNfc3VzcGVuZChzdHJ1Y3QgZGV2aWNlICpkZXYpCi0tIAoyLjIw
LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1n
ZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
