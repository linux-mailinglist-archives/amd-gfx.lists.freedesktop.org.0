Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A04DD10C551
	for <lists+amd-gfx@lfdr.de>; Thu, 28 Nov 2019 09:40:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E43C06E78A;
	Thu, 28 Nov 2019 08:40:45 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from huawei.com (szxga07-in.huawei.com [45.249.212.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27AE56E5ED;
 Thu, 28 Nov 2019 02:24:29 +0000 (UTC)
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id E032FA722C0D65E12423;
 Thu, 28 Nov 2019 10:24:26 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS401-HUB.china.huawei.com
 (10.3.19.201) with Microsoft SMTP Server id 14.3.439.0; Thu, 28 Nov 2019
 10:24:18 +0800
From: zhengbin <zhengbin13@huawei.com>
To: <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <David1.Zhou@amd.com>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <harry.wentland@amd.com>, <sunpeng.li@amd.com>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 3/4] drm/amd/display: Remove unneeded semicolon in hdcp.c
Date: Thu, 28 Nov 2019 10:31:39 +0800
Message-ID: <1574908300-126787-4-git-send-email-zhengbin13@huawei.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1574908300-126787-1-git-send-email-zhengbin13@huawei.com>
References: <1574908300-126787-1-git-send-email-zhengbin13@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.90.53.225]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Thu, 28 Nov 2019 08:40:40 +0000
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
Cc: zhengbin13@huawei.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Rml4ZXMgY29jY2ljaGVjayB3YXJuaW5nOgoKZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L21v
ZHVsZXMvaGRjcC9oZGNwLmM6NTA2OjItMzogVW5uZWVkZWQgc2VtaWNvbG9uCgpSZXBvcnRlZC1i
eTogSHVsayBSb2JvdCA8aHVsa2NpQGh1YXdlaS5jb20+ClNpZ25lZC1vZmYtYnk6IHpoZW5nYmlu
IDx6aGVuZ2JpbjEzQGh1YXdlaS5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5
L21vZHVsZXMvaGRjcC9oZGNwLmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24o
KyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3Bs
YXkvbW9kdWxlcy9oZGNwL2hkY3AuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9tb2R1
bGVzL2hkY3AvaGRjcC5jCmluZGV4IGNiYjVlOWMuLjhhYTUyOGUgMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvZGlzcGxheS9tb2R1bGVzL2hkY3AvaGRjcC5jCisrKyBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvZGlzcGxheS9tb2R1bGVzL2hkY3AvaGRjcC5jCkBAIC01MDMsNyArNTAzLDcg
QEAgZW51bSBtb2RfaGRjcF9vcGVyYXRpb25fbW9kZSBtb2RfaGRjcF9zaWduYWxfdHlwZV90b19v
cGVyYXRpb25fbW9kZSgKIAkJYnJlYWs7CiAJZGVmYXVsdDoKIAkJYnJlYWs7Ci0JfTsKKwl9Cgog
CXJldHVybiBtb2RlOwogfQotLQoyLjcuNAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9hbWQtZ2Z4
