Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D0DF91CBF9B
	for <lists+amd-gfx@lfdr.de>; Sat,  9 May 2020 11:07:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 455C86E311;
	Sat,  9 May 2020 09:07:23 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5AC088C07;
 Sat,  9 May 2020 06:30:54 +0000 (UTC)
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id ACC85C1323C26D88B3D6;
 Sat,  9 May 2020 14:30:49 +0800 (CST)
Received: from huawei.com (10.175.124.28) by DGGEMS414-HUB.china.huawei.com
 (10.3.19.214) with Microsoft SMTP Server id 14.3.487.0; Sat, 9 May 2020
 14:30:39 +0800
From: Jason Yan <yanaijie@huawei.com>
To: <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <David1.Zhou@amd.com>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH] drm/amd/amdgpu: remove defined but not used 'crtc_offsets'
Date: Sat, 9 May 2020 14:29:59 +0800
Message-ID: <20200509062959.42481-1-yanaijie@huawei.com>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
X-Originating-IP: [10.175.124.28]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Sat, 09 May 2020 09:07:22 +0000
X-BeenThere: amd-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion list for AMD gfx <amd-gfx.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/amd-gfx>
List-Post: <mailto:amd-gfx@lists.freedesktop.org>
List-Help: <mailto:amd-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=subscribe>
Cc: Hulk Robot <hulkci@huawei.com>, Jason Yan <yanaijie@huawei.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Rml4IHRoZSBmb2xsb3dpbmcgZ2NjIHdhcm5pbmc6Cgpkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9nbWNfdjZfMC5jOjY1OjE4OiB3YXJuaW5nOiDigJhjcnRjX29mZnNldHPigJkKZGVmaW5lZCBi
dXQgbm90IHVzZWQgWy1XdW51c2VkLWNvbnN0LXZhcmlhYmxlPV0KIHN0YXRpYyBjb25zdCB1MzIg
Y3J0Y19vZmZzZXRzWzZdID0KICAgICAgICAgICAgICAgICAgXn5+fn5+fn5+fn5+CgpSZXBvcnRl
ZC1ieTogSHVsayBSb2JvdCA8aHVsa2NpQGh1YXdlaS5jb20+ClNpZ25lZC1vZmYtYnk6IEphc29u
IFlhbiA8eWFuYWlqaWVAaHVhd2VpLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9nbWNfdjZfMC5jIHwgMTEgLS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxMSBkZWxldGlv
bnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjZfMC5j
IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3Y2XzAuYwppbmRleCBjMWE1MzBkYmUx
NjIuLmE3NWU0NzJiNGE4MSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
Z21jX3Y2XzAuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjZfMC5jCkBA
IC02MSwxNyArNjEsNiBAQCBNT0RVTEVfRklSTVdBUkUoImFtZGdwdS9zaTU4X21jLmJpbiIpOwog
I2RlZmluZSBNQ19TRVFfTUlTQzBfX01UX19IQk0gICAgMHg2MDAwMDAwMAogI2RlZmluZSBNQ19T
RVFfTUlTQzBfX01UX19ERFIzICAgMHhCMDAwMDAwMAogCi0KLXN0YXRpYyBjb25zdCB1MzIgY3J0
Y19vZmZzZXRzWzZdID0KLXsKLQlTSV9DUlRDMF9SRUdJU1RFUl9PRkZTRVQsCi0JU0lfQ1JUQzFf
UkVHSVNURVJfT0ZGU0VULAotCVNJX0NSVEMyX1JFR0lTVEVSX09GRlNFVCwKLQlTSV9DUlRDM19S
RUdJU1RFUl9PRkZTRVQsCi0JU0lfQ1JUQzRfUkVHSVNURVJfT0ZGU0VULAotCVNJX0NSVEM1X1JF
R0lTVEVSX09GRlNFVAotfTsKLQogc3RhdGljIHZvaWQgZ21jX3Y2XzBfbWNfc3RvcChzdHJ1Y3Qg
YW1kZ3B1X2RldmljZSAqYWRldikKIHsKIAl1MzIgYmxhY2tvdXQ7Ci0tIAoyLjIxLjEKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGlu
ZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeAo=
