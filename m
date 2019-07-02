Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 635E95D76E
	for <lists+amd-gfx@lfdr.de>; Tue,  2 Jul 2019 22:29:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99DF06E064;
	Tue,  2 Jul 2019 20:29:24 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 501C16E060
 for <amd-gfx@lists.freedesktop.org>; Tue,  2 Jul 2019 20:29:23 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id d17so20144218qtj.8
 for <amd-gfx@lists.freedesktop.org>; Tue, 02 Jul 2019 13:29:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Q5j3Y5b6B+VN1K58R9ZWBDKy1nOQWq+ysPIDkCqH/2w=;
 b=nfEhhvxbT4LH2UVJOmLvZXGYx0g/p4fA1LuMoh/Y2sUX04QmXCVLcPy03Bt3Xz6p3z
 hobLOgRoYTjMBa1eqlWunAWzNHzv/t8XWjIXFgD1eZD+G8BgmHKA6CzZYOgXgv8MiQL5
 hDY4Ryr/xDDEtwELDRfTO/ovFwLR7saJSN43YtivQewKc7mFm9sdhtgmJzS0djPeHNiB
 H8832y2eDeNvbFuUUiz/UJOtQsKl9L+soUoAOFEIcwNrlhYmexNla+MinPzrLBMwJX1O
 Mk4dlnTlxFXNapOzh6Y61B1hnwp85ZTUUCG7MGCTxszEymLu2wBoSjLUijzu0iK1PKy/
 eeQg==
X-Gm-Message-State: APjAAAVnVSMmHjT3Y43SylDxPcdleiefUUkN1ENPKnjZdKpBVrK1r/NM
 k4orLjox4mvP8yFnrJfI4P4Rg75RmD4=
X-Google-Smtp-Source: APXvYqxMayEAEiHoj2/8ITpJQste3O5oLaOC9Wnt3fcy8LLAsl1ipsX9cyuCiBVG2IFSaOJm1PCtsA==
X-Received: by 2002:a0c:c68d:: with SMTP id d13mr28020736qvj.145.1562099362283; 
 Tue, 02 Jul 2019 13:29:22 -0700 (PDT)
Received: from localhost.localdomain ([71.219.67.210])
 by smtp.gmail.com with ESMTPSA id h40sm20342qth.4.2019.07.02.13.29.21
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 02 Jul 2019 13:29:21 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 30/53] drm/amdgpu/psp: add psp support for navi14
Date: Tue,  2 Jul 2019 15:28:21 -0500
Message-Id: <20190702202844.17001-31-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190702202844.17001-1-alexander.deucher@amd.com>
References: <20190702202844.17001-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Q5j3Y5b6B+VN1K58R9ZWBDKy1nOQWq+ysPIDkCqH/2w=;
 b=YhPZSFJeSGlTTMGP0FyEmOMhbrF3xNVh4gYWW3cfuiZq0ce/1h+3eJrxZb2g/kosLn
 F9FeanzCyMrHdunly/bQAUmFTQuv0cE/f8KJ4re0fjYR7JWV62TF7k1DyKcnf+NWl42m
 FlK/IJTcQQmdbqu/nMXm435lvc1sE33qWUanRiSwsXAb5zz18OSIzeA4DSxvYvqpulm5
 JgWwmsvwd/SNUtkahb+UtunddyEJwJ6ywODpNA6z9WDHUi/9aiuRvsZXB8BsWQxoX2n+
 hlcVMWjFNGndFqQ7U6quG51aiA+Ehc0Jv6l29jipabq/KUqC6g95t7cTZfmw8NP0I8hs
 dUoQ==
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
Cc: Snow Zhang <Snow.Zhang@amd.com>, Xiaojie Yuan <xiaojie.yuan@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogWGlhb2ppZSBZdWFuIDx4aWFvamllLnl1YW5AYW1kLmNvbT4KClNhbWUgYXMgbmF2aTEw
LgoKU2lnbmVkLW9mZi1ieTogWGlhb2ppZSBZdWFuIDx4aWFvamllLnl1YW5AYW1kLmNvbT4KUmV2
aWV3ZWQtYnk6IFNub3cgWmhhbmcgPFNub3cuWmhhbmdAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcHNwLmMgfCAxICsKIGRyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L3BzcF92MTFfMC5jICB8IDggKysrKysrLS0KIDIgZmlsZXMgY2hhbmdlZCwgNyBpbnNl
cnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV9wc3AuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV9wc3AuYwppbmRleCAzYzA4ZTVjNDgzZjIuLjI1MWZhMDRkNjk0MSAxMDA2NDQKLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3BzcC5jCisrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2FtZGdwdV9wc3AuYwpAQCAtNTcsNiArNTcsNyBAQCBzdGF0aWMgaW50IHBz
cF9lYXJseV9pbml0KHZvaWQgKmhhbmRsZSkKIAkJcHNwLT5hdXRvbG9hZF9zdXBwb3J0ZWQgPSBm
YWxzZTsKIAkJYnJlYWs7CiAJY2FzZSBDSElQX05BVkkxMDoKKwljYXNlIENISVBfTkFWSTE0Ogog
CQlwc3BfdjExXzBfc2V0X3BzcF9mdW5jcyhwc3ApOwogCQlwc3AtPmF1dG9sb2FkX3N1cHBvcnRl
ZCA9IHRydWU7CiAJCWJyZWFrOwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvcHNwX3YxMV8wLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9wc3BfdjExXzAuYwpp
bmRleCAwZTcyMzE0Y2MyNDEuLmY3ZmJjODQ0YTg5NCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvcHNwX3YxMV8wLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvcHNwX3YxMV8wLmMKQEAgLTQxLDYgKzQxLDcgQEAgTU9EVUxFX0ZJUk1XQVJFKCJhbWRncHUv
dmVnYTIwX2FzZC5iaW4iKTsKIE1PRFVMRV9GSVJNV0FSRSgiYW1kZ3B1L3ZlZ2EyMF90YS5iaW4i
KTsKIE1PRFVMRV9GSVJNV0FSRSgiYW1kZ3B1L25hdmkxMF9zb3MuYmluIik7CiBNT0RVTEVfRklS
TVdBUkUoImFtZGdwdS9uYXZpMTBfYXNkLmJpbiIpOworTU9EVUxFX0ZJUk1XQVJFKCJhbWRncHUv
bmF2aTE0X3Nvcy5iaW4iKTsKIAogLyogYWRkcmVzcyBibG9jayAqLwogI2RlZmluZSBzbW5NUDFf
RklSTVdBUkVfRkxBR1MJCTB4MzAxMDAyNApAQCAtNzAsNiArNzEsOSBAQCBzdGF0aWMgaW50IHBz
cF92MTFfMF9pbml0X21pY3JvY29kZShzdHJ1Y3QgcHNwX2NvbnRleHQgKnBzcCkKIAljYXNlIENI
SVBfTkFWSTEwOgogCQljaGlwX25hbWUgPSAibmF2aTEwIjsKIAkJYnJlYWs7CisJY2FzZSBDSElQ
X05BVkkxNDoKKwkJY2hpcF9uYW1lID0gIm5hdmkxNCI7CisJCWJyZWFrOwogCWRlZmF1bHQ6CiAJ
CUJVRygpOwogCX0KQEAgLTUzMiw3ICs1MzYsNyBAQCBwc3BfdjExXzBfc3JhbV9tYXAoc3RydWN0
IGFtZGdwdV9kZXZpY2UgKmFkZXYsCiAKIAljYXNlIEFNREdQVV9VQ09ERV9JRF9STENfRzoKIAkJ
KnNyYW1fb2Zmc2V0ID0gMHgyMDAwOwotCQlpZiAoYWRldi0+YXNpY190eXBlICE9IENISVBfTkFW
STEwKSB7CisJCWlmIChhZGV2LT5hc2ljX3R5cGUgIT0gQ0hJUF9OQVZJMTAgfHwgYWRldi0+YXNp
Y190eXBlICE9IENISVBfTkFWSTE0KSB7CiAJCQkqc3JhbV9hZGRyX3JlZ19vZmZzZXQgPSBTT0Mx
NV9SRUdfT0ZGU0VUKEdDLCAwLCBtbVJMQ19HUE1fVUNPREVfQUREUik7CiAJCQkqc3JhbV9kYXRh
X3JlZ19vZmZzZXQgPSBTT0MxNV9SRUdfT0ZGU0VUKEdDLCAwLCBtbVJMQ19HUE1fVUNPREVfREFU
QSk7CiAJCX0KQEAgLTU0NCw3ICs1NDgsNyBAQCBwc3BfdjExXzBfc3JhbV9tYXAoc3RydWN0IGFt
ZGdwdV9kZXZpY2UgKmFkZXYsCiAKIAljYXNlIEFNREdQVV9VQ09ERV9JRF9TRE1BMDoKIAkJKnNy
YW1fb2Zmc2V0ID0gMHgwOwotCQlpZiAoYWRldi0+YXNpY190eXBlICE9IENISVBfTkFWSTEwKSB7
CisJCWlmIChhZGV2LT5hc2ljX3R5cGUgIT0gQ0hJUF9OQVZJMTAgfHwgYWRldi0+YXNpY190eXBl
ICE9IENISVBfTkFWSTE0KSB7CiAJCQkqc3JhbV9hZGRyX3JlZ19vZmZzZXQgPSBTT0MxNV9SRUdf
T0ZGU0VUKFNETUEwLCAwLCBtbVNETUEwX1VDT0RFX0FERFIpOwogCQkJKnNyYW1fZGF0YV9yZWdf
b2Zmc2V0ID0gU09DMTVfUkVHX09GRlNFVChTRE1BMCwgMCwgbW1TRE1BMF9VQ09ERV9EQVRBKTsK
IAkJfQotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
