Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA31671ABD
	for <lists+amd-gfx@lfdr.de>; Tue, 23 Jul 2019 16:48:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6215C6E2B8;
	Tue, 23 Jul 2019 14:48:30 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1BF589E05;
 Tue, 23 Jul 2019 14:38:21 +0000 (UTC)
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 64CE6996057D2935D714;
 Tue, 23 Jul 2019 22:38:18 +0800 (CST)
Received: from localhost (10.133.213.239) by DGGEMS401-HUB.china.huawei.com
 (10.3.19.201) with Microsoft SMTP Server id 14.3.439.0; Tue, 23 Jul 2019
 22:38:09 +0800
From: YueHaibing <yuehaibing@huawei.com>
To: <harry.wentland@amd.com>, <sunpeng.li@amd.com>,
 <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <David1.Zhou@amd.com>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <Krunoslav.Kovac@amd.com>, <Aric.Cyr@amd.com>, <Anthony.Koo@amd.com>
Subject: [PATCH -next] drm/amd/display: Make pow_buffer_ptr static
Date: Tue, 23 Jul 2019 22:37:41 +0800
Message-ID: <20190723143741.35064-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
X-Originating-IP: [10.133.213.239]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Tue, 23 Jul 2019 14:48:29 +0000
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
Cc: amd-gfx@lists.freedesktop.org, YueHaibing <yuehaibing@huawei.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Rml4IHNwYXJzZSB3YXJuaW5nOgoKZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vZGlzcGxh
eS9tb2R1bGVzL2NvbG9yL2NvbG9yX2dhbW1hLmM6NjI6NToKIHdhcm5pbmc6IHN5bWJvbCAncG93
X2J1ZmZlcl9wdHInIHdhcyBub3QgZGVjbGFyZWQuIFNob3VsZCBpdCBiZSBzdGF0aWM/CgpSZXBv
cnRlZC1ieTogSHVsayBSb2JvdCA8aHVsa2NpQGh1YXdlaS5jb20+ClNpZ25lZC1vZmYtYnk6IFl1
ZUhhaWJpbmcgPHl1ZWhhaWJpbmdAaHVhd2VpLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1k
L2Rpc3BsYXkvbW9kdWxlcy9jb2xvci9jb2xvcl9nYW1tYS5jIHwgMiArLQogMSBmaWxlIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9kaXNwbGF5L21vZHVsZXMvY29sb3IvY29sb3JfZ2FtbWEuYyBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvZGlzcGxheS9tb2R1bGVzL2NvbG9yL2NvbG9yX2dhbW1hLmMKaW5kZXggZWQ4
OTRjZC4uNTMzMjE2OCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L21v
ZHVsZXMvY29sb3IvY29sb3JfZ2FtbWEuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3Bs
YXkvbW9kdWxlcy9jb2xvci9jb2xvcl9nYW1tYS5jCkBAIC01OSw3ICs1OSw3IEBAIHN0YXRpYyBz
dHJ1Y3QgdHJhbnNsYXRlX2Zyb21fbGluZWFyX3NwYWNlX2FyZ3Mgc2NyYXRjaF9nYW1tYV9hcmdz
OwogICovCiBzdGF0aWMgc3RydWN0IGZpeGVkMzFfMzIgcG93X2J1ZmZlcltOVU1fUFRTX0lOX1JF
R0lPTl07CiBzdGF0aWMgc3RydWN0IGZpeGVkMzFfMzIgZ2FtbWFfb2ZfMjsgLy8gMl5nYW1tYQot
aW50IHBvd19idWZmZXJfcHRyID0gLTE7CitzdGF0aWMgaW50IHBvd19idWZmZXJfcHRyID0gLTE7
CiAKIHN0YXRpYyBjb25zdCBpbnQzMl90IGdhbW1hX251bWVyYXRvcjAxW10gPSB7IDMxMzA4LAkx
ODAwMDAsCTB9Owogc3RhdGljIGNvbnN0IGludDMyX3QgZ2FtbWFfbnVtZXJhdG9yMDJbXSA9IHsg
MTI5MjAsCTQ1MDAsCTB9OwotLSAKMi43LjQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2FtZC1nZng=
