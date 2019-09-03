Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 35138A6E46
	for <lists+amd-gfx@lfdr.de>; Tue,  3 Sep 2019 18:26:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 633B2897EE;
	Tue,  3 Sep 2019 16:26:05 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCA7F897EE;
 Tue,  3 Sep 2019 16:26:04 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D7BD823891;
 Tue,  3 Sep 2019 16:26:03 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 024/167] drm/amd/dm: Understand why attaching
 path/tile properties are needed
Date: Tue,  3 Sep 2019 12:22:56 -0400
Message-Id: <20190903162519.7136-24-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190903162519.7136-1-sashal@kernel.org>
References: <20190903162519.7136-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1567527964;
 bh=h35IVQDj3bs9GCL91wugfmbfgHOaXuPVSjlljFLrPLk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=kkAe1evdR5ICE0GHcEd52MNOjDnOtT3IyI3s6izEKWaSGPMAuXM/w94bTgzYQfNZM
 hI6wCHLVN/FEPq4E9Ts6idU2dGUVJJ8N7m1E/PgkH8DtmTjhJlmRebNqkkTcSvRDnY
 UXV1l+kMGTHOzRITgFAyfT0ns4Qkv6YiaDGlvogg=
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
Cc: Sasha Levin <sashal@kernel.org>, dri-devel@lists.freedesktop.org,
 Jerry Zuo <Jerry.Zuo@amd.com>, amd-gfx@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogTHl1ZGUgUGF1bCA8bHl1ZGVAcmVkaGF0LmNvbT4KClsgVXBzdHJlYW0gY29tbWl0IDA0
YWM0YjBlZDQxMmY2NTIzMGI0NTZmY2Q5YWEwN2UxM2JlZmZmODkgXQoKUGF0aCBwcm9wZXJ0eSBp
cyB1c2VkIGZvciB1c2Vyc3BhY2UgdG8ga25vdyB3aGF0IE1TVCBjb25uZWN0b3IgZ29lcyB0byB3
aGF0IGFjdHVhbCBEUk0gRGlzcGxheVBvcnQgY29ubmVjdG9yLCB0aGUgdGlsaW5nIHByb3BlcnR5
IGlzIGZvciB0aWxpbmcgY29uZmlndXJhdGlvbnMuIE5vdCBzdXJlIHdoYXQgZWxzZSB0aGVyZSBp
cyB0byBmaWd1cmUgb3V0LgoKU2lnbmVkLW9mZi1ieTogTHl1ZGUgUGF1bCA8bHl1ZGVAcmVkaGF0
LmNvbT4KUmV2aWV3ZWQtYnk6IEplcnJ5IChGYW5nemhpKSBadW8gPEplcnJ5Llp1b0BhbWQuY29t
PgpDYzogU3RhYmxlIDxzdGFibGVAdmdlci5rZXJuZWwub3JnPgpTaWduZWQtb2ZmLWJ5OiBBbGV4
IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IFNhc2hh
IExldmluIDxzYXNoYWxAa2VybmVsLm9yZz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3Bs
YXkvYW1kZ3B1X2RtL2FtZGdwdV9kbV9tc3RfdHlwZXMuYyB8IDMgLS0tCiAxIGZpbGUgY2hhbmdl
ZCwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3Bs
YXkvYW1kZ3B1X2RtL2FtZGdwdV9kbV9tc3RfdHlwZXMuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
ZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtX21zdF90eXBlcy5jCmluZGV4IDU5NDQ1YzgzZjAy
MzguLmM4NWJlYTcwZDk2NTIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxh
eS9hbWRncHVfZG0vYW1kZ3B1X2RtX21zdF90eXBlcy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9h
bWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtX21zdF90eXBlcy5jCkBAIC0zNzcsOSArMzc3
LDYgQEAgZG1fZHBfYWRkX21zdF9jb25uZWN0b3Ioc3RydWN0IGRybV9kcF9tc3RfdG9wb2xvZ3lf
bWdyICptZ3IsCiAJZHJtX2Nvbm5lY3Rvcl9hdHRhY2hfZW5jb2RlcigmYWNvbm5lY3Rvci0+YmFz
ZSwKIAkJCQkgICAgICZhY29ubmVjdG9yLT5tc3RfZW5jb2Rlci0+YmFzZSk7CiAKLQkvKgotCSAq
IFRPRE86IHVuZGVyc3RhbmQgd2h5IHRoaXMgb25lIGlzIG5lZWRlZAotCSAqLwogCWRybV9vYmpl
Y3RfYXR0YWNoX3Byb3BlcnR5KAogCQkmY29ubmVjdG9yLT5iYXNlLAogCQlkZXYtPm1vZGVfY29u
ZmlnLnBhdGhfcHJvcGVydHksCi0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vYW1kLWdmeA==
