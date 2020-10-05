Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E24C9283838
	for <lists+amd-gfx@lfdr.de>; Mon,  5 Oct 2020 16:45:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DB6289F19;
	Mon,  5 Oct 2020 14:45:31 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD4AB89F19;
 Mon,  5 Oct 2020 14:45:30 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 994EC20FC3;
 Mon,  5 Oct 2020 14:45:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601909130;
 bh=r8DWUr5vtaIWRZFDmh+jkP2C0tU7Kp5rr1T8j+PXNYU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=14wD1rn/ouHXqBO/jGldpwcSINDKDwtPgKoXeRAB1Pdk/ChKDbZjqZPn1dxxOrE11
 2xSM4xiyvteO5mUmYPzVlmllo8gVv1sFGATT6eZq3YMVXjRK4HUkyeAiaZVkyw2DEy
 JMmwDLWc7g1tDwEm//4dyZiT8YRnXcJMxrX0VEYU=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.14 2/2] drm/amdgpu: prevent double kfree ttm->sg
Date: Mon,  5 Oct 2020 10:45:27 -0400
Message-Id: <20201005144527.2527777-2-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201005144527.2527777-1-sashal@kernel.org>
References: <20201005144527.2527777-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, Philip Yang <Philip.Yang@amd.com>,
 Felix Kuehling <Felix.Kuehling@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogUGhpbGlwIFlhbmcgPFBoaWxpcC5ZYW5nQGFtZC5jb20+CgpbIFVwc3RyZWFtIGNvbW1p
dCAxZDBlMTZhYzFhOWU4MDA1OThkY2ZhNWI2YmM1M2I3MDRhMTAzMzkwIF0KClNldCB0dG0tPnNn
IHRvIE5VTEwgYWZ0ZXIga2ZyZWUsIHRvIGF2b2lkIG1lbW9yeSBjb3JydXB0aW9uIGJhY2t0cmFj
ZToKClsgIDQyMC45MzI4MTJdIGtlcm5lbCBCVUcgYXQKL2J1aWxkL2xpbnV4LWRvOWVMRi9saW51
eC00LjE1LjAvbW0vc2x1Yi5jOjI5NSEKWyAgNDIwLjkzNDE4Ml0gaW52YWxpZCBvcGNvZGU6IDAw
MDAgWyMxXSBTTVAgTk9QVEkKWyAgNDIwLjkzNTQ0NV0gTW9kdWxlcyBsaW5rZWQgaW46IHh0X2Nv
bm50cmFjayBpcHRfTUFTUVVFUkFERQpbICA0MjAuOTUxMzMyXSBIYXJkd2FyZSBuYW1lOiBEZWxs
IEluYy4gUG93ZXJFZGdlIFI3NTI1LzBQWVZUMSwgQklPUwoxLjUuNCAwNy8wOS8yMDIwClsgIDQy
MC45NTI4ODddIFJJUDogMDAxMDpfX3NsYWJfZnJlZSsweDE4MC8weDJkMApbICA0MjAuOTU0NDE5
XSBSU1A6IDAwMTg6ZmZmZmJlNDI2MjkxZmE2MCBFRkxBR1M6IDAwMDEwMjQ2ClsgIDQyMC45NTU5
NjNdIFJBWDogZmZmZjllMjkyNjNlOWMzMCBSQlg6IGZmZmY5ZTI5MjYzZTljMzAgUkNYOgowMDAw
MDAwMTgxMDAwMDRiClsgIDQyMC45NTc1MTJdIFJEWDogZmZmZjllMjkyNjNlOWMzMCBSU0k6IGZm
ZmZmM2QzM2U5OGZhNDAgUkRJOgpmZmZmOWUyOTdlNDA3YTgwClsgIDQyMC45NTkwNTVdIFJCUDog
ZmZmZmJlNDI2MjkxZmIwMCBSMDg6IDAwMDAwMDAwMDAwMDAwMDEgUjA5OgpmZmZmZmZmZmMwZDM5
YWRlClsgIDQyMC45NjA1ODddIFIxMDogZmZmZmJlNDI2MjkxZmIyMCBSMTE6IGZmZmY5ZTQ5ZmZk
ZDQwMDAgUjEyOgpmZmZmOWUyOTdlNDA3YTgwClsgIDQyMC45NjIxMDVdIFIxMzogZmZmZmYzZDMz
ZTk4ZmE0MCBSMTQ6IGZmZmY5ZTI5MjYzZTljMzAgUjE1OgpmZmZmOWUyOTU0NDY0ZmQ4ClsgIDQy
MC45NjM2MTFdIEZTOiAgMDAwMDdmYTJlYTA5Nzc4MCgwMDAwKSBHUzpmZmZmOWUyOTdlODQwMDAw
KDAwMDApCmtubEdTOjAwMDAwMDAwMDAwMDAwMDAKWyAgNDIwLjk2NTE0NF0gQ1M6ICAwMDEwIERT
OiAwMDAwIEVTOiAwMDAwIENSMDogMDAwMDAwMDA4MDA1MDAzMwpbICA0MjAuOTY2NjYzXSBDUjI6
IDAwMDA3ZjE2YmZmZmVmYjggQ1IzOiAwMDAwMDAxZmYwYzYyMDAwIENSNDoKMDAwMDAwMDAwMDM0
MGVlMApbICA0MjAuOTY4MTkzXSBDYWxsIFRyYWNlOgpbICA0MjAuOTY5NzAzXSAgPyBfX3BhZ2Vf
Y2FjaGVfcmVsZWFzZSsweDNjLzB4MjIwClsgIDQyMC45NzEyOTRdICA/IGFtZGdwdV90dG1fdHRf
dW5wb3B1bGF0ZSsweDVlLzB4ODAgW2FtZGdwdV0KWyAgNDIwLjk3Mjc4OV0gIGtmcmVlKzB4MTY4
LzB4MTgwClsgIDQyMC45NzQzNTNdICA/IGFtZGdwdV90dG1fdHRfc2V0X3VzZXJfcGFnZXMrMHg2
NC8weGMwIFthbWRncHVdClsgIDQyMC45NzU4NTBdICA/IGtmcmVlKzB4MTY4LzB4MTgwClsgIDQy
MC45Nzc0MDNdICBhbWRncHVfdHRtX3R0X3VucG9wdWxhdGUrMHg1ZS8weDgwIFthbWRncHVdClsg
IDQyMC45Nzg4ODhdICB0dG1fdHRfdW5wb3B1bGF0ZS5wYXJ0LjEwKzB4NTMvMHg2MCBbYW1kdHRt
XQpbICA0MjAuOTgwMzU3XSAgdHRtX3R0X2Rlc3Ryb3kucGFydC4xMSsweDRmLzB4NjAgW2FtZHR0
bV0KWyAgNDIwLjk4MTgxNF0gIHR0bV90dF9kZXN0cm95KzB4MTMvMHgyMCBbYW1kdHRtXQpbICA0
MjAuOTgzMjczXSAgdHRtX2JvX2NsZWFudXBfbWVtdHlwZV91c2UrMHgzNi8weDgwIFthbWR0dG1d
ClsgIDQyMC45ODQ3MjVdICB0dG1fYm9fcmVsZWFzZSsweDFjOS8weDM2MCBbYW1kdHRtXQpbICA0
MjAuOTg2MTY3XSAgYW1kdHRtX2JvX3B1dCsweDI0LzB4MzAgW2FtZHR0bV0KWyAgNDIwLjk4NzY2
M10gIGFtZGdwdV9ib191bnJlZisweDFlLzB4MzAgW2FtZGdwdV0KWyAgNDIwLjk4OTE2NV0gIGFt
ZGdwdV9hbWRrZmRfZ3B1dm1fYWxsb2NfbWVtb3J5X29mX2dwdSsweDljYS8weGIxMApbYW1kZ3B1
XQpbICA0MjAuOTkwNjY2XSAga2ZkX2lvY3RsX2FsbG9jX21lbW9yeV9vZl9ncHUrMHhlZi8weDJj
MCBbYW1kZ3B1XQoKU2lnbmVkLW9mZi1ieTogUGhpbGlwIFlhbmcgPFBoaWxpcC5ZYW5nQGFtZC5j
b20+ClJldmlld2VkLWJ5OiBGZWxpeCBLdWVobGluZyA8RmVsaXguS3VlaGxpbmdAYW1kLmNvbT4K
UmV2aWV3ZWQtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4K
U2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgpT
aWduZWQtb2ZmLWJ5OiBTYXNoYSBMZXZpbiA8c2FzaGFsQGtlcm5lbC5vcmc+Ci0tLQogZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3R0bS5jIHwgMSArCiAxIGZpbGUgY2hhbmdlZCwg
MSBpbnNlcnRpb24oKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfdHRtLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdHRtLmMKaW5k
ZXggYmM3NDYxMzE5ODdmZi4uYWU3MDBlNDQ1ZmJjOCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3R0bS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdV90dG0uYwpAQCAtNzI3LDYgKzcyNyw3IEBAIHN0YXRpYyBpbnQgYW1kZ3B1X3R0
bV90dF9waW5fdXNlcnB0cihzdHJ1Y3QgdHRtX3R0ICp0dG0pCiAKIHJlbGVhc2Vfc2c6CiAJa2Zy
ZWUodHRtLT5zZyk7CisJdHRtLT5zZyA9IE5VTEw7CiAJcmV0dXJuIHI7CiB9CiAKLS0gCjIuMjUu
MQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdm
eCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4Cg==
