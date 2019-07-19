Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E89F6D9C5
	for <lists+amd-gfx@lfdr.de>; Fri, 19 Jul 2019 05:58:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D52B86E4C4;
	Fri, 19 Jul 2019 03:58:16 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C380F6E4C1;
 Fri, 19 Jul 2019 03:58:13 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B9FD32184E;
 Fri, 19 Jul 2019 03:58:12 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.2 036/171] drm/amd/display: CS_TFM_1D only applied
 post EOTF
Date: Thu, 18 Jul 2019 23:54:27 -0400
Message-Id: <20190719035643.14300-36-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190719035643.14300-1-sashal@kernel.org>
References: <20190719035643.14300-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1563508693;
 bh=z+8JcC18Jtyh8uyT6UA2/SC24y/hq7VVcY9YA+weTuk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=G1lNXnI+nXdooUfTkRfB1jDqaUZXgNl2kvRsTiJDHEXXe0M+JcNvL9PoxjTclzl27
 QgJwJkQsFwNPXl/oS7LwA03zjFnEmXl1zwsxOGmY8ENxvNEbJiAvX2HnaDYe4iYAal
 TDVCPP+mpJwWrLZgc8/e/KJVc8dVX1vGfowN/uWo=
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
Cc: Sasha Levin <sashal@kernel.org>, Aric Cyr <Aric.Cyr@amd.com>,
 Krunoslav Kovac <Krunoslav.Kovac@amd.com>, Leo Li <sunpeng.li@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogS3J1bm9zbGF2IEtvdmFjIDxLcnVub3NsYXYuS292YWNAYW1kLmNvbT4KClsgVXBzdHJl
YW0gY29tbWl0IDZhZDM0YWRlYWVjNWI1NmE1YmE5MGU5MDA5OWNhYmYxYzFmZTlkZDIgXQoKW1do
eV0KVGhlcmUncyBzb21lIHVubmVjZXNzYXJ5IG1lbSBhbGxvY2F0aW9uIGZvciBDU19URk1fSUQu
IFdoYXQncyB3b3JzZSwgaXQKZGVwZW5kcyBvbiBMVVQgc2l6ZSBhbmQgc2luY2UgaXQncyA0SyBm
b3IgQ1NfVEZNXzFELCBpdCBpcyAxNnggYmlnZ2VyCnRoYW4gaW4gcmVndWxhciBjYXNlIHdoZW4g
aXQncyBhY3R1YWxseSBuZWVkZWQuIFRoaXMgbGVhZHMgdG8gc29tZQpjcmFzaGVzIGluIHN0cmVz
cyBjb25kaXRpb25zLgoKW0hvd10KU2tpcCByYW1wIGNvbWJpbmluZyBkZXNpZ25lZCBmb3IgUkdC
MjU2IGFuZCBEWEdJIGdhbW1hIHdpdGggQ1NfVEZNXzFELgoKU2lnbmVkLW9mZi1ieTogS3J1bm9z
bGF2IEtvdmFjIDxLcnVub3NsYXYuS292YWNAYW1kLmNvbT4KUmV2aWV3ZWQtYnk6IEFyaWMgQ3ly
IDxBcmljLkN5ckBhbWQuY29tPgpBY2tlZC1ieTogTGVvIExpIDxzdW5wZW5nLmxpQGFtZC5jb20+
ClNpZ25lZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4K
U2lnbmVkLW9mZi1ieTogU2FzaGEgTGV2aW4gPHNhc2hhbEBrZXJuZWwub3JnPgotLS0KIGRyaXZl
cnMvZ3B1L2RybS9hbWQvZGlzcGxheS9tb2R1bGVzL2NvbG9yL2NvbG9yX2dhbW1hLmMgfCAzICsr
LQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9tb2R1bGVzL2NvbG9yL2NvbG9yX2dh
bW1hLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvbW9kdWxlcy9jb2xvci9jb2xvcl9n
YW1tYS5jCmluZGV4IGExMDU1NDEzYmFkZS4uMzFmODY3YmI1YWZlIDEwMDY0NAotLS0gYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvbW9kdWxlcy9jb2xvci9jb2xvcl9nYW1tYS5jCisrKyBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9tb2R1bGVzL2NvbG9yL2NvbG9yX2dhbW1hLmMK
QEAgLTE1NjQsNyArMTU2NCw4IEBAIGJvb2wgbW9kX2NvbG9yX2NhbGN1bGF0ZV9yZWdhbW1hX3Bh
cmFtcyhzdHJ1Y3QgZGNfdHJhbnNmZXJfZnVuYyAqb3V0cHV0X3RmLAogCiAJb3V0cHV0X3RmLT50
eXBlID0gVEZfVFlQRV9ESVNUUklCVVRFRF9QT0lOVFM7CiAKLQlpZiAocmFtcCAmJiAobWFwVXNl
clJhbXAgfHwgcmFtcC0+dHlwZSAhPSBHQU1NQV9SR0JfMjU2KSkgeworCWlmIChyYW1wICYmIHJh
bXAtPnR5cGUgIT0gR0FNTUFfQ1NfVEZNXzFEICYmCisJCQkobWFwVXNlclJhbXAgfHwgcmFtcC0+
dHlwZSAhPSBHQU1NQV9SR0JfMjU2KSkgewogCQlyZ2JfdXNlciA9IGt2Y2FsbG9jKHJhbXAtPm51
bV9lbnRyaWVzICsgX0VYVFJBX1BPSU5UUywKIAkJCSAgICBzaXplb2YoKnJnYl91c2VyKSwKIAkJ
CSAgICBHRlBfS0VSTkVMKTsKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9hbWQtZ2Z4
