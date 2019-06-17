Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA47748F46
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:31:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E65D89BC0;
	Mon, 17 Jun 2019 19:31:36 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C46FE89BC2
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:31:34 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id c11so6945199qkk.8
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:31:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nzpZw3lgqr/lqCWUSG5tcYkyxPqYKhCKogLSBCggGBA=;
 b=GXUdX6bVMzvmwLqDgXXcVPH9bA8N5trlbHdyVdTfXWkfa1j0kIybHBfdxROUBWCSnJ
 DKaYVfzb+ECbaJsxeJr2xy0WZAQCQmlfdwuoumH5L72Ws1YVIU45Va3Q/ucPTeeXIG6I
 wrKVDo3RJJPzkDuIJzAnSgxjlKN4FPD9AUJdg0pLUCJ7xekvtpjx9ZXOZpUnvLVpXWcY
 0jtY14ntUwsaJvhrUq2y1x5BDPMD7z2MDox2Pp8CMGtpkL8k0yPeSXt78SXoGZxcwokY
 14SwFQjYdLNfswPqleOoQPvcynQAYJidB+lV7PK3Bxc3uYsxKy5YzP0jtHUVRYMpXm2z
 OVRg==
X-Gm-Message-State: APjAAAVogjc30krcolAuCXMhLmlrv7AnQEaOa8c82Y/7QsaU2t/drgXZ
 movk/DYsRaNwYeYbdNFy/Bt7TMp/iM0=
X-Google-Smtp-Source: APXvYqydhP3DHqVx/AHlkQN/H46PUDESNDYcz1LdRNxCZ45wXBp5Sosoey7VZ2TtM85yjiY+VFtpxA==
X-Received: by 2002:ae9:ea06:: with SMTP id f6mr16391438qkg.262.1560799893321; 
 Mon, 17 Jun 2019 12:31:33 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id u2sm7474875qtj.97.2019.06.17.12.31.32
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:31:32 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 222/459] drm/amd/powerplay: disable uclk dpm by default
Date: Mon, 17 Jun 2019 14:29:49 -0500
Message-Id: <20190617193106.18231-23-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617193106.18231-1-alexander.deucher@amd.com>
References: <20190617193106.18231-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nzpZw3lgqr/lqCWUSG5tcYkyxPqYKhCKogLSBCggGBA=;
 b=nFK+evK2a+5P1fdOMY9hPtidD+zQeKodXiZvQYuiQhvaLWAsDoXPwKmcfbqngulAGh
 pcp0KXB2wOZHmkjt30ZthByU35+fWyVAaRg3S6MEcqCFWcWV8V3XgEOdJ4jCarYT+TK3
 odaBeFYiNvEqzVmkIZslyrz6a01xH+K6NW1xVDKTerKkjKNkSwfz4Q/YQEChQgRU5W1Z
 /UqwS+ZRrjWohIiMpUfv1THJ7vQBC0F5cTXL4J7LKwNftncq/5IkXimvRszFR+v5mwPC
 jQzFrG15Gkg30k4G+1S/XxYBCqdVVmS3gnnFgTzT1GNC79IrvqvB8tHq6hq++HRC3reJ
 aM4Q==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Jack Xiao <Jack.Xiao@amd.com>,
 tiancyin <tianci.yin@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogdGlhbmN5aW4gPHRpYW5jaS55aW5AYW1kLmNvbT4KClt3aHldClRoZSB1Y2xrIGRwbSBm
ZWF0dXJlIGlzIG5vdCBzdXBwb3J0ZWQgYnkgc29tZSBjZXJ0YWluIG5hdmkxMApib2FyZCBsaWtl
IDE4MjAyLCB3aGlsZSBzdXBwb3J0ZWQgYnkgc29tZSBib2FyZCBsaWtlIDE4MjAxLgpJdCBjYXVz
ZXMgbW9kcHJvYmUgZmFpbHVyZSBvbiAxODIwMiBib2FyZC4KCltob3ddCkRpc2FibGVkIHRoaXMg
ZmVhdHVyZSBieSBkZWZhdWx0LCBpdCBjYW4gYmUgZW5hYmxlZCBieSBtb2R1bGUgcGFyYW1ldGVy
CnVjbGtfZHBtX3N1cHBvcnQ9MS4KClJldmlld2VkLWJ5OiBKYWNrIFhpYW8gPEphY2suWGlhb0Bh
bWQuY29tPgpTaWduZWQtb2ZmLWJ5OiB0aWFuY3lpbiA8dGlhbmNpLnlpbkBhbWQuY29tPgpTaWdu
ZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Ci0tLQog
ZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvbmF2aTEwX3BwdC5jIHwgNiArKysrLS0KIDEg
ZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvbmF2aTEwX3BwdC5jIGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9wb3dlcnBsYXkvbmF2aTEwX3BwdC5jCmluZGV4IDBlZTgzN2RmNmRkMS4uOWZi
ODk0ZmVjM2QzIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9uYXZp
MTBfcHB0LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvbmF2aTEwX3BwdC5j
CkBAIC0yNzMsOCArMjczLDEwIEBAIG5hdmkxMF9nZXRfYWxsb3dlZF9mZWF0dXJlX21hc2soc3Ry
dWN0IHNtdV9jb250ZXh0ICpzbXUsCiAJCQkJfCBGRUFUVVJFX01BU0soRkVBVFVSRV9MRURfRElT
UExBWV9CSVQpCiAJCQkJfCBGRUFUVVJFX01BU0soRkVBVFVSRV9NTUhVQl9QR19CSVQpCiAJCQkJ
fCBGRUFUVVJFX01BU0soRkVBVFVSRV9BVEhVQl9QR19CSVQpCi0JCQkJfCBGRUFUVVJFX01BU0so
RkVBVFVSRV9EUE1fRENFRkNMS19CSVQpCi0JCQkJfCBGRUFUVVJFX01BU0soRkVBVFVSRV9EUE1f
VUNMS19CSVQpCisJCQkJfCBGRUFUVVJFX01BU0soRkVBVFVSRV9EUE1fRENFRkNMS19CSVQpOwor
CisJaWYgKGFkZXYtPnBtLnBwX2ZlYXR1cmUgJiBQUF9NQ0xLX0RQTV9NQVNLKQorCQkqKHVpbnQ2
NF90ICopZmVhdHVyZV9tYXNrIHw9IEZFQVRVUkVfTUFTSyhGRUFUVVJFX0RQTV9VQ0xLX0JJVCkK
IAkJCQl8IEZFQVRVUkVfTUFTSyhGRUFUVVJFX01FTV9WRERDSV9TQ0FMSU5HX0JJVCkKIAkJCQl8
IEZFQVRVUkVfTUFTSyhGRUFUVVJFX01FTV9NVkREX1NDQUxJTkdfQklUKTsKIAotLSAKMi4yMC4x
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4
IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
