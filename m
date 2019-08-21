Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A086C98735
	for <lists+amd-gfx@lfdr.de>; Thu, 22 Aug 2019 00:24:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5ACA6EA2D;
	Wed, 21 Aug 2019 22:24:36 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4F016E3A2
 for <amd-gfx@lists.freedesktop.org>; Wed, 21 Aug 2019 22:24:33 +0000 (UTC)
Received: by mail-qk1-x742.google.com with SMTP id d23so3370159qko.3
 for <amd-gfx@lists.freedesktop.org>; Wed, 21 Aug 2019 15:24:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NyLW9P06dqCgf7CrZuuVpELWVLYltop2S1cAr1T5u0w=;
 b=OG3dLxxej8v60A5iG1pDSKOuyIg6inwWgWSrXcjblF323TIcCuAZ8LWvuc5u1alRkT
 UtpNm6mxAhn1+9eeVAShOZyIPILqRK+nPH6l74SNtcIinpBBVqdbXqJofm/Cy4FEZxvb
 cbOhrKaaD1ef0X833nf6jMsIg4YLJTbCQnyHAOsp+CXQG/1XbnTmukNOhaOLjqRLExgl
 5AVqyo5nJie24jdBa+L9Am9dPWP4jMOmNvz2K4NwmoEB8mgrQMaUrB2EN3AK9D0OCLNP
 JYGadzQfVGXJHb3mAVcUQi4WL8uX6RrXFTt7zIdGLhvhFyiuDLpSctBIonbwpJJ+bfXl
 4izQ==
X-Gm-Message-State: APjAAAVumO3JHAHRZ+KjLPBisF2MrDLVO2srgqx0ABb8/pt4kf8zWjzk
 uYBP3szXzQ83bWc1uKZGJeRMSbkZ
X-Google-Smtp-Source: APXvYqxUE7vIqdTHQHcEiav09alr2Cpt8Ulnbho3EUp1UEA0osROtgXogRKVSY7I6vO5D4YMex0pLQ==
X-Received: by 2002:a37:c49:: with SMTP id 70mr23204517qkm.429.1566426272613; 
 Wed, 21 Aug 2019 15:24:32 -0700 (PDT)
Received: from localhost.localdomain ([71.219.73.178])
 by smtp.gmail.com with ESMTPSA id w1sm10853983qte.36.2019.08.21.15.24.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Aug 2019 15:24:32 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 24/37] drm/amdgpu: enable rom clock gating for rn
Date: Wed, 21 Aug 2019 17:23:46 -0500
Message-Id: <20190821222359.13578-25-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190821222359.13578-1-alexander.deucher@amd.com>
References: <20190821222359.13578-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NyLW9P06dqCgf7CrZuuVpELWVLYltop2S1cAr1T5u0w=;
 b=Zyg4335v5pDb7p8zIk0+XPPiDWoGCRa5zFdXgl7Cts0DPtPFPuHytXyMer5i1B0Dux
 ryR2bVfb/Z+3sFpsknFMK2bDfc2mn5vJpmnFlaKPHNj5MywbfLbdqraW0EkqQZKgXQXt
 yRlXq+W9MniXmZzJm60LYGx++FskVvlEOxEc4axvrMt1iIM+0CnB8D5whx8N6lIL8Bil
 BalHfb1ln0t7NXs7hgPb2QpyD7evDqgXIznjuLftQYSIS8+Cgh+1pVV09W5Rv49wTRFt
 IhqwMOKnbJ2Wu7uRcazetOmkzb85nC7eGlEMyIaYkkedPpMWVAnUOUEe0AEIX7p/H8U6
 +B/A==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Prike Liang <Prike.Liang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogUHJpa2UgTGlhbmcgPFByaWtlLkxpYW5nQGFtZC5jb20+CgpFbmFibGUgcm9tIGxpZ2h0
IHNsZWVwIGNsb2NrIGdhdGluZy4KUmV2aWV3ZWQtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVy
LmRldWNoZXJAYW1kLmNvbT4KClNpZ25lZC1vZmYtYnk6IFByaWtlIExpYW5nIDxQcmlrZS5MaWFu
Z0BhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVy
QGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc29jMTUuYyB8IDMgKyst
CiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc29jMTUuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L3NvYzE1LmMKaW5kZXggY2UxMDFiY2JlMDJjLi4yMGQzMTIwYzZiYzIgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NvYzE1LmMKKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvc29jMTUuYwpAQCAtMTE2Niw3ICsxMTY2LDggQEAgc3RhdGlj
IGludCBzb2MxNV9jb21tb25fZWFybHlfaW5pdCh2b2lkICpoYW5kbGUpCiAJCQkJIEFNRF9DR19T
VVBQT1JUX1NETUFfTUdDRyB8CiAJCQkJIEFNRF9DR19TVVBQT1JUX1NETUFfTFMgfAogCQkJCSBB
TURfQ0dfU1VQUE9SVF9CSUZfTFMgfAotCQkJCSBBTURfQ0dfU1VQUE9SVF9IRFBfTFM7CisJCQkJ
IEFNRF9DR19TVVBQT1JUX0hEUF9MUyB8CisJCQkJIEFNRF9DR19TVVBQT1JUX1JPTV9NR0NHOwog
CQlhZGV2LT5wZ19mbGFncyA9IDA7CiAJCWFkZXYtPmV4dGVybmFsX3Jldl9pZCA9IGFkZXYtPnJl
dl9pZCArIDB4OTE7CiAKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9hbWQtZ2Z4
