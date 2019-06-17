Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 62EC048ECF
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:28:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D41C4899B0;
	Mon, 17 Jun 2019 19:28:05 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94709899C7
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:28:03 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id h21so12169511qtn.13
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:28:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=peViHJKEnEOtVfUEDsc+Vx1g76QSW7/st2bE5BYu0a0=;
 b=U0AztKWDMAxqI/acE1f+0oxElsMUsFinL+DEcuVEV1PgyKFuyed6ZP3P/+ze/N1oGZ
 IPRakIrNfOY8nvoCQV5xlq+YEF7T5fq0tI3e6xR0Mvu7aT+MnLjoSgG+xNBFBIBvBJWE
 bEJYL6ISVMXB0ymqdzVOo5xGXfCPvi7ZDk54NYr/w1lLxT1bVqW6+UdSNb2HmYqcWs48
 FwV992Yig2ihlrwSKU/NtxdgsSWkpPCYmxyHwmKPEQPKkZUWf9eiKoVHPhxTVbQ0+F4+
 BmSTAWkVPpDgnm/37F0s3aDKE34YpPE9EQyVOhtJxgxuwB24lVuctQgjIKW9ph38rHpj
 qi4g==
X-Gm-Message-State: APjAAAWkEUVTtD7Z1MscmM31mFvvb45phK0gofsXZgJ0RWXqwxn0TJRO
 0Htuswq6QdVg8aG6vLTO9TcQtCuhAFc=
X-Google-Smtp-Source: APXvYqzkLp6Id+YWy6/MYZx0coywTfToHpkg4QVgqgUHK85b3FalaAIqtYydpeKOu8CTDqtohhdgjg==
X-Received: by 2002:a0c:88fc:: with SMTP id 57mr23097872qvo.178.1560799681688; 
 Mon, 17 Jun 2019 12:28:01 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id p37sm7715622qtc.35.2019.06.17.12.28.00
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:28:01 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 152/459] drm/amd/powerplay: smu needs to be initialized after
 rlc in direct mode
Date: Mon, 17 Jun 2019 14:26:17 -0500
Message-Id: <20190617192704.18038-53-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617192704.18038-1-alexander.deucher@amd.com>
References: <20190617192704.18038-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=peViHJKEnEOtVfUEDsc+Vx1g76QSW7/st2bE5BYu0a0=;
 b=kz46T6XAvVV61MJxgf4iwlxnOK2sCuJI43+GPzGYHFiSloNNz0+jDIUiPN2mNzDMnQ
 DW25C/VekHiRMOlDEWEil5+io/dIvP4YiDFtMGtZeAPcIgMcA/FwgDjXpx60agKLdgNS
 e0qLInAdVvmKkfsVZjxDqnZiyFcV5FumAPspBCe+MSnavOyth8LjDEiR5HJdOiDYJG17
 GRd7rBF3MmZXdO3/MHQKhWn/+mfKakdWVXPSnTkuIij+kn+z1sQNoDNBLZxSA6oyn/1j
 EEBDDEjEGW3vMhQ+N/FQphzxNO2f8lQVP6SxJ34yvay3gnaH8DUm+OzM/YTX1mka9PMP
 cvEQ==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Huang Rui <ray.huang@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSHVhbmcgUnVpIDxyYXkuaHVhbmdAYW1kLmNvbT4KCkZvciBnZnggMTAsIHJsYyBmaXJt
d2FyZSBsb2FkaW5nIHJlbGllcyBvbiBzbXUgZmlybXdhcmUgaXMgbG9hZGVkIGZpcnN0bHksIHNv
IGluCmRpcmVjdCB0eXBlLCBpdCBoYXMgdG8gbG9hZCBzbWMgdWNvZGUgaGVyZSBiZWZvcmUgcmxj
LiBBbmQgbWVhbndoaWxlLCB0aGUgc211CmluaXRpYWxpemF0aW9uIGhhcyB0byBtb3ZlIGFmdGVy
IHJsYywgb3RoZXJ3aXNlLCBzbXUgbWVzc2FnZSB3aWxsIGdldCBmYWlsdXJlCmR1cmluZyB0aGUg
aGFuZHNoYWtlIHdpdGggcmxjIGFuZCBzbXUuCgpTaWduZWQtb2ZmLWJ5OiBIdWFuZyBSdWkgPHJh
eS5odWFuZ0BhbWQuY29tPgpSZXZpZXdlZC1ieTogSGF3a2luZyBaaGFuZyA8SGF3a2luZy5aaGFu
Z0BhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVy
QGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvYW1kZ3B1X3NtdS5j
IHwgMTQgKysrKystLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDkg
ZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkv
YW1kZ3B1X3NtdS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvYW1kZ3B1X3NtdS5j
CmluZGV4IDg4ZmQ3OWQ1YWNhNi4uYjliNTZlYzFhYWNmIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL3Bvd2VycGxheS9hbWRncHVfc211LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9wb3dlcnBsYXkvYW1kZ3B1X3NtdS5jCkBAIC04MjAsMTYgKzgyMCwxMiBAQCBzdGF0aWMgaW50
IHNtdV9od19pbml0KHZvaWQgKmhhbmRsZSkKIAlzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiA9
IChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqKWhhbmRsZTsKIAlzdHJ1Y3Qgc211X2NvbnRleHQgKnNt
dSA9ICZhZGV2LT5zbXU7CiAKLQlpZiAoYWRldi0+ZmlybXdhcmUubG9hZF90eXBlICE9IEFNREdQ
VV9GV19MT0FEX1BTUCkgewotCQlyZXQgPSBzbXVfbG9hZF9taWNyb2NvZGUoc211KTsKLQkJaWYg
KHJldCkKKwlpZiAoYWRldi0+ZmlybXdhcmUubG9hZF90eXBlID09IEFNREdQVV9GV19MT0FEX1BT
UCkgeworCQlyZXQgPSBzbXVfY2hlY2tfZndfc3RhdHVzKHNtdSk7CisJCWlmIChyZXQpIHsKKwkJ
CXByX2VycigiU01DIGZpcm13YXJlIHN0YXR1cyBpcyBub3QgY29ycmVjdFxuIik7CiAJCQlyZXR1
cm4gcmV0OwotCX0KLQotCXJldCA9IHNtdV9jaGVja19md19zdGF0dXMoc211KTsKLQlpZiAocmV0
KSB7Ci0JCXByX2VycigiU01DIGZpcm13YXJlIHN0YXR1cyBpcyBub3QgY29ycmVjdFxuIik7Ci0J
CXJldHVybiByZXQ7CisJCX0KIAl9CiAKIAltdXRleF9sb2NrKCZzbXUtPm11dGV4KTsKLS0gCjIu
MjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1k
LWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
