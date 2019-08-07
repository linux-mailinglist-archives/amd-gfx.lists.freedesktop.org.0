Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C4A0F853B8
	for <lists+amd-gfx@lfdr.de>; Wed,  7 Aug 2019 21:41:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57BB66E765;
	Wed,  7 Aug 2019 19:41:18 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50DC76E765
 for <amd-gfx@lists.freedesktop.org>; Wed,  7 Aug 2019 19:41:17 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id x22so16204947qtp.12
 for <amd-gfx@lists.freedesktop.org>; Wed, 07 Aug 2019 12:41:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZZfL6vvtQHeVxSk89C57RPEEHdAg6TmOPZLyhuH6lNM=;
 b=mJVQCn/0BkeBJBz7ZCifPMOGgsoQKKza+fe33iPnQGvz9m8DgMIkoUsEnsTROy7vDZ
 ZPlwuGft8BfKhvq6Q8AvU6+8xBfk+K7Imqkxbt0IAeRsrcM4Egoj8wtHkEX9HILWSqIg
 BmaSznlVgm4phscTzwHfQjQpjFS8oOQKjEye6rK+lAR20pxhGhqTk3lzVPwaczV0o7YV
 bzgY/pllzD2HDf4oFON+bPP4mhKpLmDxugluYdNxqj0Jie8BZNZDLtdbJu6oqlH/mNp1
 zUz2+GR9D5i5wYpYLpQlQaFUWHZt9lbNwluIFH24B1ui6a2dvPqNlyiD4dGakLL14DDf
 CVEw==
X-Gm-Message-State: APjAAAW51Eg2wUqtIRRrEi9S/cmH10ePRzV+g3gZb0fVQnQD5kIf/M/T
 TqdSOmODSGQ/1GyG+a5daNiylRxMeKg=
X-Google-Smtp-Source: APXvYqxYhh/LDvteXf/IVPPqZIOgEARxdUvAPO7cFmykdDPVda9XoUDlETRk56EKpp6aPQC/Zrm4hA==
X-Received: by 2002:ac8:738e:: with SMTP id t14mr9717990qtp.386.1565206876126; 
 Wed, 07 Aug 2019 12:41:16 -0700 (PDT)
Received: from localhost.localdomain ([71.51.170.6])
 by smtp.gmail.com with ESMTPSA id v4sm37249730qtq.15.2019.08.07.12.41.15
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 07 Aug 2019 12:41:15 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH] drm/amdgpu: add navi14 PCI ID
Date: Wed,  7 Aug 2019 14:41:09 -0500
Message-Id: <20190807194109.8821-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZZfL6vvtQHeVxSk89C57RPEEHdAg6TmOPZLyhuH6lNM=;
 b=jbCCq4e4c+0KWmeB5zepZ9MfL7frINbHSsyGURjxU88Igpd5OoVIzDxrYGFybqYPAZ
 Tw0f4UU+UxtX6V8mk3mkoJ9PYwyfO7Nss6mlmVOBWVBv8RV2hdTi+0duZI8qVqHOAwCv
 7z25ml1M6dlu4NxuBCBPWPhnbirHUrUlg+v9RP5gAXXZ8bcjBgQGDzSZDRUjUCw3V5cx
 Mdp9/AjVmKv3adPmmDXJQsb5cr6NfIJo37t7sh4C7bBIs2tCV/QBUc/8y9UHQm3u5bxU
 F/z8NrafSOh5ZvWliw5/O2ftwzhY0TPFTtmgQV6Yk/ktHAuRsshTzXtjP8aRT9pi23r4
 Ad6A==
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

QWRkIHRoZSBuYXZpMTQgUENJIGRldmljZSBpZC4KClNpZ25lZC1vZmYtYnk6IEFsZXggRGV1Y2hl
ciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHVfZHJ2LmMgfCAyICsrCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCsp
CgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rydi5jIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rydi5jCmluZGV4IGNmMzM0YzQ2NTgw
NS4uNzllMjJjMjIxYjc3IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfZHJ2LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rydi5j
CkBAIC0xMDA3LDYgKzEwMDcsOCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHBjaV9kZXZpY2VfaWQg
cGNpaWRsaXN0W10gPSB7CiAJezB4MTAwMiwgMHg3MzFBLCBQQ0lfQU5ZX0lELCBQQ0lfQU5ZX0lE
LCAwLCAwLCBDSElQX05BVkkxMH0sCiAJezB4MTAwMiwgMHg3MzFCLCBQQ0lfQU5ZX0lELCBQQ0lf
QU5ZX0lELCAwLCAwLCBDSElQX05BVkkxMH0sCiAJezB4MTAwMiwgMHg3MzFGLCBQQ0lfQU5ZX0lE
LCBQQ0lfQU5ZX0lELCAwLCAwLCBDSElQX05BVkkxMH0sCisJLyogTmF2aTE0ICovCisJezB4MTAw
MiwgMHg3MzQwLCBQQ0lfQU5ZX0lELCBQQ0lfQU5ZX0lELCAwLCAwLCBDSElQX05BVkkxNH0sCiAK
IAl7MCwgMCwgMH0KIH07Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vYW1kLWdmeA==
