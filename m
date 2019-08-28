Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1BE8A060E
	for <lists+amd-gfx@lfdr.de>; Wed, 28 Aug 2019 17:19:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0301C891C5;
	Wed, 28 Aug 2019 15:19:57 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F90A891C5
 for <amd-gfx@lists.freedesktop.org>; Wed, 28 Aug 2019 15:19:55 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id u34so3435976qte.2
 for <amd-gfx@lists.freedesktop.org>; Wed, 28 Aug 2019 08:19:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=C646/jExE8xrgpqIzfG6gF3NOeRjyeQbD+jnTU33/qM=;
 b=jHNEig5faR8NwZR8vZR//9hx8dVC+Uoc7Y/O2uZNaAUMQULsC9Ctf46tBo4vFYdc+b
 j+H6xPc9a4VtgHno6sPGZGqGBG3O5QnmhJNGr31bMJTy6iXFPMKwD2SuI4zkWpxeY9qu
 5nE4UyaVZskL5LsdeUxwsla4Q8xV/SyGgIvuJQT81lvD5t9UhZ6X3Dm8AmdBlymOQF2j
 d3Pw1UBBpMmfpvNFnD4XWZCu0G1CwFaj5m615sLNcwhK8C/DtIo1TGbSwrO0DqWqerWo
 YONLQV75vQ4/onkS+XOfVCQaEmF5zT5SOkRd5FICoYKbPaV6DDh47l2+Wxv2io2PsH5e
 UD7A==
X-Gm-Message-State: APjAAAVs3W8gNIQCP32ZJLpQtSF7wiyd+0F7H8ZlZPjvvM2WkJfZjUcZ
 WjXgCAvcKV8bQwsjnKs/V5d/uUdT
X-Google-Smtp-Source: APXvYqy3Nr8jy9qJSis9opqfrZe+Vk5WiTzM8xNwrOaEUvVAkRcasLi+8xB2kR5+/J6qvBMRsTDOyw==
X-Received: by 2002:ac8:5383:: with SMTP id x3mr3458143qtp.344.1567005594207; 
 Wed, 28 Aug 2019 08:19:54 -0700 (PDT)
Received: from localhost.localdomain ([71.219.73.178])
 by smtp.gmail.com with ESMTPSA id n20sm1259429qtp.69.2019.08.28.08.19.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Aug 2019 08:19:53 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 3/4] drm/amd/powerplay: enable populate DPM clocks table for
 swSMU APU
Date: Wed, 28 Aug 2019 10:19:42 -0500
Message-Id: <20190828151943.3619-3-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190828151943.3619-1-alexander.deucher@amd.com>
References: <20190828151943.3619-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=C646/jExE8xrgpqIzfG6gF3NOeRjyeQbD+jnTU33/qM=;
 b=qtao+wlr2rrvMi76LulGEZYr364jgm0wnU6Jr4Smw0mNAHm1205htj2Fc8XlMybFY/
 2OkU4ldiyJDs+dI9buptsf4Q4XDO+oFg3RzNUStSS1DKHnccvYCu8Qab9zboW/PyDwZF
 Wn7Gbc69BC/zu8McEfMY63j+D0ZvJsUZfUiPlfCyFEZZHymrMLsoehoFZxmy52S0qQBh
 6wJ7P4n/PmGDfpiVM/OzzVTKcWnF7VQbSJK156PT+1fB//RQ1R7j+SshoS8HdadiTu4g
 UtRLk5RdewyPEvaj/9s1IvayYgQ54CkVMStCF4i718jLNFEWmXzzmqK4sCi2wflibe9W
 Qp5Q==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Prike Liang <Prike.Liang@amd.com>,
 Evan Quan <evan.quan@amd.com>, Aaron Liu <aaron.liu@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogUHJpa2UgTGlhbmcgPFByaWtlLkxpYW5nQGFtZC5jb20+CgpTaG91bGQgcG9wdWxhdGUg
RFBNIGNsb2NrcyB0YWJsZXMgZHVyaW5nIGh3IGluaXQsb3RoZXJ3aXNlIHdpbGwKc3VmZmVyIGZy
b20gaW52YWxpZGF0ZSB0YWJsZS4KClNpZ25lZC1vZmYtYnk6IFByaWtlIExpYW5nIDxQcmlrZS5M
aWFuZ0BhbWQuY29tPgpSZXZpZXdlZC1ieTogRXZhbiBRdWFuIDxldmFuLnF1YW5AYW1kLmNvbT4K
UmV2aWV3ZWQtYnk6IEFhcm9uIExpdSA8YWFyb24ubGl1QGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6
IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dw
dS9kcm0vYW1kL3Bvd2VycGxheS9hbWRncHVfc211LmMgfCAzIC0tLQogMSBmaWxlIGNoYW5nZWQs
IDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBs
YXkvYW1kZ3B1X3NtdS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvYW1kZ3B1X3Nt
dS5jCmluZGV4IGI0Zjg5YzNjMmI0My4uOGM2MTc3OGY4Zjc0IDEwMDY0NAotLS0gYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL3Bvd2VycGxheS9hbWRncHVfc211LmMKKysrIGIvZHJpdmVycy9ncHUvZHJt
L2FtZC9wb3dlcnBsYXkvYW1kZ3B1X3NtdS5jCkBAIC0xMDQyLDkgKzEwNDIsNiBAQCBzdGF0aWMg
aW50IHNtdV9zbWNfdGFibGVfaHdfaW5pdChzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSwKIAlzdHJ1
Y3QgYW1kZ3B1X2RldmljZSAqYWRldiA9IHNtdS0+YWRldjsKIAlpbnQgcmV0OwogCi0JaWYgKGFk
ZXYtPmZsYWdzICYgQU1EX0lTX0FQVSkKLQkJcmV0dXJuIDA7Ci0KIAlpZiAoc211X2lzX2RwbV9y
dW5uaW5nKHNtdSkgJiYgYWRldi0+aW5fc3VzcGVuZCkgewogCQlwcl9pbmZvKCJkcG0gaGFzIGJl
ZW4gZW5hYmxlZFxuIik7CiAJCXJldHVybiAwOwotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQt
Z2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
