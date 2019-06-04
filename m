Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CD8773531F
	for <lists+amd-gfx@lfdr.de>; Wed,  5 Jun 2019 01:23:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CD2089C6B;
	Tue,  4 Jun 2019 23:23:12 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 630E389C6B;
 Tue,  4 Jun 2019 23:23:11 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5C4A420859;
 Tue,  4 Jun 2019 23:23:10 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.1 38/60] drm/amdgpu: keep stolen memory on picasso
Date: Tue,  4 Jun 2019 19:21:48 -0400
Message-Id: <20190604232212.6753-38-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190604232212.6753-1-sashal@kernel.org>
References: <20190604232212.6753-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1559690591;
 bh=FohrENoaCq01zdcKab6dNJUVnveTwmm7geo9AeQqun0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=RIjD3D3vqz9OHatI2bSHdKm07oJuBbf4ul8788HCXV+8YI6ROxXAOfWjh4tQDlZfX
 YFxcJKAvUf5MW/el6ivoLfKwUrd4uDaoR5yv/fS4nvm7JVTRc8tLBRplM2bC6lWqo3
 96S+lCS6zrSCe8WjX2nR5/5oPchg18Z+gTCC2RfQ=
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
Cc: Sasha Levin <sashal@kernel.org>, Feifei Xu <Feifei.Xu@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, Flora Cui <flora.cui@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogRmxvcmEgQ3VpIDxmbG9yYS5jdWlAYW1kLmNvbT4KClsgVXBzdHJlYW0gY29tbWl0IDM3
OTEwOTM1MWY0ZjZmMjQwNWNmNTRlN2EyOTYwNTVmNTg5YzNhZDEgXQoKb3RoZXJ3aXNlIHNjcmVl
biBjb3JydXB0cyBkdXJpbmcgbW9kcHJvYmUuCgpTaWduZWQtb2ZmLWJ5OiBGbG9yYSBDdWkgPGZs
b3JhLmN1aUBhbWQuY29tPgpSZXZpZXdlZC1ieTogRmVpZmVpIFh1IDxGZWlmZWkuWHVAYW1kLmNv
bT4KU2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29t
PgpTaWduZWQtb2ZmLWJ5OiBTYXNoYSBMZXZpbiA8c2FzaGFsQGtlcm5lbC5vcmc+Ci0tLQogZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3Y5XzAuYyB8IDEgKwogMSBmaWxlIGNoYW5nZWQs
IDEgaW5zZXJ0aW9uKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
Z21jX3Y5XzAuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192OV8wLmMKaW5kZXgg
MmZlODM5NzI0MWVhLi4xNjExYmVmMTlhMmMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2dtY192OV8wLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21j
X3Y5XzAuYwpAQCAtNzE1LDYgKzcxNSw3IEBAIHN0YXRpYyBib29sIGdtY192OV8wX2tlZXBfc3Rv
bGVuX21lbW9yeShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKIAljYXNlIENISVBfVkVHQTEw
OgogCQlyZXR1cm4gdHJ1ZTsKIAljYXNlIENISVBfUkFWRU46CisJCXJldHVybiAoYWRldi0+cGRl
di0+ZGV2aWNlID09IDB4MTVkOCk7CiAJY2FzZSBDSElQX1ZFR0ExMjoKIAljYXNlIENISVBfVkVH
QTIwOgogCWRlZmF1bHQ6Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vYW1kLWdmeA==
