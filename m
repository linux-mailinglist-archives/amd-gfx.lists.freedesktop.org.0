Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 31A0B2E9A7
	for <lists+amd-gfx@lfdr.de>; Thu, 30 May 2019 02:16:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE07A6E13B;
	Thu, 30 May 2019 00:16:14 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
X-Greylist: delayed 465 seconds by postgrey-1.36 at gabe;
 Thu, 30 May 2019 00:16:13 UTC
Received: from mail.skrimstad.net (mail.skrimstad.net [139.162.145.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 594776E13B;
 Thu, 30 May 2019 00:16:13 +0000 (UTC)
Received: from authenticated-user (PRIMARY_HOSTNAME [PUBLIC_IP])
 by mail.skrimstad.net (Postfix) with ESMTPA id 29812DE701;
 Thu, 30 May 2019 00:08:23 +0000 (UTC)
Date: Thu, 30 May 2019 02:08:21 +0200
From: Yrjan Skrimstad <yrjan@skrimstad.net>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/amd/powerplay/smu7_hwmgr: replace blocking delay with
 non-blocking
Message-ID: <20190530000819.GA25416@obi-wan>
MIME-Version: 1.0
Content-Disposition: inline
X-Spamd-Bar: /
X-Mailman-Original-Authentication-Results: mail.skrimstad.net;
 auth=pass smtp.auth=yrjan@skrimstad.net smtp.mailfrom=yrjan@skrimstad.net
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
Cc: "David \(ChunMing\) Zhou" <David1.Zhou@amd.com>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, Yrjan Skrimstad <yrjan@skrimstad.net>,
 Daniel Vetter <daniel@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>,
 Evan Quan <evan.quan@amd.com>, Rex Zhu <rex.zhu@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VGhpcyBkcml2ZXIgY3VycmVudGx5IGNvbnRhaW5zIGEgcmVwZWF0ZWQgNTAwbXMgYmxvY2tpbmcg
ZGVsYXkgY2FsbAp3aGljaCBjYXVzZXMgZnJlcXVlbnQgbWFqb3IgYnVmZmVyIHVuZGVycnVucyBp
biBQdWxzZUF1ZGlvLiBUaGlzIHBhdGNoCmZpeGVzIHRoaXMgaXNzdWUgYnkgcmVwbGFjaW5nIHRo
ZSBibG9ja2luZyBkZWxheSB3aXRoIGEgbm9uLWJsb2NraW5nCnNsZWVwIGNhbGwuCgpTaWduZWQt
b2ZmLWJ5OiBZcmphbiBTa3JpbXN0YWQgPHlyamFuQHNrcmltc3RhZC5uZXQ+Ci0tLQogZHJpdmVy
cy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaHdtZ3Ivc211N19od21nci5jIHwgMiArLQogMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaHdtZ3Ivc211N19od21nci5jIGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9wb3dlcnBsYXkvaHdtZ3Ivc211N19od21nci5jCmluZGV4IDA0ODc1N2U4ZjQ5
NC4uMzQwYWZkYmRkYzcyIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxh
eS9od21nci9zbXU3X2h3bWdyLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkv
aHdtZ3Ivc211N19od21nci5jCkBAIC0zNDk0LDcgKzM0OTQsNyBAQCBzdGF0aWMgaW50IHNtdTdf
Z2V0X2dwdV9wb3dlcihzdHJ1Y3QgcHBfaHdtZ3IgKmh3bWdyLCB1MzIgKnF1ZXJ5KQogCQkJCQkJ
CWl4U01VX1BNX1NUQVRVU185NSwgMCk7CiAKIAlmb3IgKGkgPSAwOyBpIDwgMTA7IGkrKykgewot
CQltZGVsYXkoNTAwKTsKKwkJbXNsZWVwKDUwMCk7CiAJCXNtdW1fc2VuZF9tc2dfdG9fc21jKGh3
bWdyLCBQUFNNQ19NU0dfUG1TdGF0dXNMb2dTYW1wbGUpOwogCQl0bXAgPSBjZ3NfcmVhZF9pbmRf
cmVnaXN0ZXIoaHdtZ3ItPmRldmljZSwKIAkJCQkJCUNHU19JTkRfUkVHX19TTUMsCi0tIAoyLjIw
LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1n
ZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
