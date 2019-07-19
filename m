Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0CE96DA94
	for <lists+amd-gfx@lfdr.de>; Fri, 19 Jul 2019 06:03:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C7146E4FB;
	Fri, 19 Jul 2019 04:03:24 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F7806E4F4;
 Fri, 19 Jul 2019 04:03:23 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 097C520659;
 Fri, 19 Jul 2019 04:03:21 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.1 014/141] drm/amd/display: Fill
 prescale_params->scale for RGB565
Date: Fri, 19 Jul 2019 00:00:39 -0400
Message-Id: <20190719040246.15945-14-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190719040246.15945-1-sashal@kernel.org>
References: <20190719040246.15945-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1563509002;
 bh=gsN6turu9eohHg7Qgi24QpFWTREGQpbEHjZmiX1c1PA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=aiSa8reQMSwobz0cGc73RGyuaPozKCMxRj39eir/genFunYLvY7Ieh0ZaBjJwbzrW
 6aU0ewPa0heImFN/keh+D+/enZ1fMG29YBl7+IkbMU1ZdwCArnoFTpP4kNiKljiM9R
 3qOMdHMxkY+41iMANgVJHIoPEgX5vgl6arHSG8Mo=
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
Cc: Sasha Levin <sashal@kernel.org>, Roman Li <Roman.Li@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogTmljaG9sYXMgS2F6bGF1c2thcyA8bmljaG9sYXMua2F6bGF1c2thc0BhbWQuY29tPgoK
WyBVcHN0cmVhbSBjb21taXQgMTM1MmM3NzljYjc0ZDQyN2Y0MTUwY2JlNzc5YTJmNzg4NmY3MGNh
ZSBdCgpbV2h5XQpBbiBhc3NlcnRpb24gaXMgdGhyb3duIHdoZW4gdXNpbmcgU1VSRkFDRV9QSVhF
TF9GT1JNQVRfR1JQSF9SR0I1NjUKZm9ybWF0cyBvbiBEQ0Ugc2luY2UgdGhlIHByZXNjYWxlX3Bh
cmFtcy0+c2NhbGUgd2Fzbid0IGJlaW5nIGZpbGxlZC4KCkZvdW5kIGJ5IGEgZG1lc2ctZmFpbCB3
aGVuIHJ1bm5pbmcgdGhlCmlndEBrbXNfcGxhbmVAcGl4ZWwtZm9ybWF0LXBpcGUtYS1wbGFuZXMg
dGVzdCBvbiBCYWZmaW4uCgpbSG93XQpGaWxsIGluIHRoZSBzY2FsZSBwYXJhbWV0ZXIuCgpTaWdu
ZWQtb2ZmLWJ5OiBOaWNob2xhcyBLYXpsYXVza2FzIDxuaWNob2xhcy5rYXpsYXVza2FzQGFtZC5j
b20+ClJldmlld2VkLWJ5OiBSb21hbiBMaSA8Um9tYW4uTGlAYW1kLmNvbT4KQWNrZWQtYnk6IEJo
YXdhbnByZWV0IExha2hhIDxCaGF3YW5wcmVldC5MYWtoYUBhbWQuY29tPgpTaWduZWQtb2ZmLWJ5
OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6
IFNhc2hhIExldmluIDxzYXNoYWxAa2VybmVsLm9yZz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1k
L2Rpc3BsYXkvZGMvZGNlMTEwL2RjZTExMF9od19zZXF1ZW5jZXIuYyB8IDMgKysrCiAxIGZpbGUg
Y2hhbmdlZCwgMyBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9kaXNwbGF5L2RjL2RjZTExMC9kY2UxMTBfaHdfc2VxdWVuY2VyLmMgYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL2Rpc3BsYXkvZGMvZGNlMTEwL2RjZTExMF9od19zZXF1ZW5jZXIuYwppbmRleCA1ZTRk
YjM3MTJlZWYuLjg4ZDM3ZTg1MGExMiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9k
aXNwbGF5L2RjL2RjZTExMC9kY2UxMTBfaHdfc2VxdWVuY2VyLmMKKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9kaXNwbGF5L2RjL2RjZTExMC9kY2UxMTBfaHdfc2VxdWVuY2VyLmMKQEAgLTI0Miw2
ICsyNDIsOSBAQCBzdGF0aWMgdm9pZCBidWlsZF9wcmVzY2FsZV9wYXJhbXMoc3RydWN0IGlwcF9w
cmVzY2FsZV9wYXJhbXMgKnByZXNjYWxlX3BhcmFtcywKIAlwcmVzY2FsZV9wYXJhbXMtPm1vZGUg
PSBJUFBfUFJFU0NBTEVfTU9ERV9GSVhFRF9VTlNJR05FRDsKIAogCXN3aXRjaCAocGxhbmVfc3Rh
dGUtPmZvcm1hdCkgeworCWNhc2UgU1VSRkFDRV9QSVhFTF9GT1JNQVRfR1JQSF9SR0I1NjU6CisJ
CXByZXNjYWxlX3BhcmFtcy0+c2NhbGUgPSAweDIwODI7CisJCWJyZWFrOwogCWNhc2UgU1VSRkFD
RV9QSVhFTF9GT1JNQVRfR1JQSF9BUkdCODg4ODoKIAljYXNlIFNVUkZBQ0VfUElYRUxfRk9STUFU
X0dSUEhfQUJHUjg4ODg6CiAJCXByZXNjYWxlX3BhcmFtcy0+c2NhbGUgPSAweDIwMjA7Ci0tIAoy
LjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFt
ZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
