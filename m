Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 398C32C0C57
	for <lists+amd-gfx@lfdr.de>; Mon, 23 Nov 2020 14:58:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1483189F53;
	Mon, 23 Nov 2020 13:58:02 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC46089E15
 for <amd-gfx@lists.freedesktop.org>; Mon, 23 Nov 2020 11:20:00 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id p8so18212186wrx.5
 for <amd-gfx@lists.freedesktop.org>; Mon, 23 Nov 2020 03:20:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Gwlhc6VWNQpc30FQNQL/2GN/SmFNbQKQvmIwzZcrdLA=;
 b=ii8qj0aheF693rKVv9viDbBG3uIBD3b1E/d48+r0czABOQzGbo+zl+Inp9aHhbiI8D
 quQKTjsklt1ekVGzZYrPVj50Tr1V0Zm5iuosIuVA8jbF13ZPgHjnYK/R5aO8uoEYMbMg
 R8jdbDEsd0nTHR5e/K6gw/CAluupMzSov0+8gEcmQaIKSEB+89kapqJU5OstjXmu+PHE
 6iS8H+q6YomiC4vS3QMI7bSl5kfHtYPCttEAyMyLHKZXC6m/lYCiPCOUjvKevuo2r+WQ
 56F94rTw6+KuYZGBmY+nRjet4KL8v28PXyUz5LlAtFPPkmMs7Ajuw54jRum5iSxfYa7s
 EGwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Gwlhc6VWNQpc30FQNQL/2GN/SmFNbQKQvmIwzZcrdLA=;
 b=V3kr/l94BlWk9r7JkxlRXtGPg71s9QCUHGtDK1LnkYYBS6JYyjDKkIIV/jE1qYUYlv
 Zjy8C9UklwcN4mY5HZQta8bbcqH70Rr1h1VSmG+8CWlVWodo85ibIVmqbqXiXuBXp4h/
 2zfCEIPo89Rk94rD7RNgfNGL/fGOti6yQr5PopLFMpELoymLqwdeBaw3gbMeosc7HSyS
 6GQAWu6TMQVBJXsI8SNv9UCp8vCvGnkDYiiQTB5AahUCPTJ8pz0UNipGk8JPYIRcNZEV
 m1fpiDLVK8ttqijixDGXRyKc9S2SefqgRHreR1S3KRP4feXdlZuoXFxxaxHMJJlSMx0X
 3b0g==
X-Gm-Message-State: AOAM532EOQYR/lvuMRrJn1HA6q2mL/0JEOJfweWKa66+dx2NL4R4PCIa
 JC9eT8jQi5gAFaO8XfEUTWPGew==
X-Google-Smtp-Source: ABdhPJzEtM9u5WB7ddkQaslExzIYNinQZJFC9Neck66WcdNDTl83GY9W0Dc+q8EEm6OkToN8tdejQg==
X-Received: by 2002:a5d:4d92:: with SMTP id b18mr9165183wru.260.1606130399449; 
 Mon, 23 Nov 2020 03:19:59 -0800 (PST)
Received: from dell.default ([91.110.221.218])
 by smtp.gmail.com with ESMTPSA id n9sm16317290wmd.4.2020.11.23.03.19.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Nov 2020 03:19:58 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 28/40] drm/amd/include/sienna_cichlid_ip_offset: Mark
 top-level IP_BASE as __maybe_unused
Date: Mon, 23 Nov 2020 11:19:07 +0000
Message-Id: <20201123111919.233376-29-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201123111919.233376-1-lee.jones@linaro.org>
References: <20201123111919.233376-1-lee.jones@linaro.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 23 Nov 2020 13:58:01 +0000
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>,
 Likun Gao <Likun.Gao@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogSW4gZmls
ZSBpbmNsdWRlZCBmcm9tIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NpZW5uYV9jaWNobGlk
X3JlZ19pbml0LmM6Mjg6CiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS8uLi9pbmNsdWRlL3Np
ZW5uYV9jaWNobGlkX2lwX29mZnNldC5oOjE4NjoyOTogd2FybmluZzog4oCYVVNCMF9CQVNF4oCZ
IGRlZmluZWQgYnV0IG5vdCB1c2VkIFstV3VudXNlZC1jb25zdC12YXJpYWJsZT1dCiAxODYgfCBz
dGF0aWMgY29uc3Qgc3RydWN0IElQX0JBU0UgVVNCMF9CQVNFID0geyB7IHsgeyAweDAyNDJBODAw
LCAweDA1QjAwMDAwLCAwLCAwLCAwIH0gfSwKIHwgXn5+fn5+fn5+CiBkcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS8uLi9pbmNsdWRlL3NpZW5uYV9jaWNobGlkX2lwX29mZnNldC5oOjE3OToyOTog
d2FybmluZzog4oCYVU1DX0JBU0XigJkgZGVmaW5lZCBidXQgbm90IHVzZWQgWy1XdW51c2VkLWNv
bnN0LXZhcmlhYmxlPV0KIDE3OSB8IHN0YXRpYyBjb25zdCBzdHJ1Y3QgSVBfQkFTRSBVTUNfQkFT
RSA9IHsgeyB7IHsgMHgwMDAxNDAwMCwgMHgwMjQyNTgwMCwgMCwgMCwgMCB9IH0sCiB8IF5+fn5+
fn5+CiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS8uLi9pbmNsdWRlL3NpZW5uYV9jaWNobGlk
X2lwX29mZnNldC5oOjE1ODoyOTogd2FybmluZzog4oCYU0RNQTFfQkFTReKAmSBkZWZpbmVkIGJ1
dCBub3QgdXNlZCBbLVd1bnVzZWQtY29uc3QtdmFyaWFibGU9XQogMTU4IHwgc3RhdGljIGNvbnN0
IHN0cnVjdCBJUF9CQVNFIFNETUExX0JBU0UgPSB7IHsgeyB7IDB4MDAwMDEyNjAsIDB4MDAwMEEw
MDAsIDB4MDAwMUMwMDAsIDB4MDI0MDJDMDAsIDAgfSB9LAogfCBefn5+fn5+fn5+CgpOQjogU25p
cHBlZCBsb3RzIG9mIHRoZXNlCgpDYzogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBh
bWQuY29tPgpDYzogIkNocmlzdGlhbiBLw7ZuaWciIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+
CkNjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+CkNjOiBEYW5pZWwgVmV0dGVyIDxk
YW5pZWxAZmZ3bGwuY2g+CkNjOiBIYXdraW5nIFpoYW5nIDxIYXdraW5nLlpoYW5nQGFtZC5jb20+
CkNjOiBMaWt1biBHYW8gPExpa3VuLkdhb0BhbWQuY29tPgpDYzogYW1kLWdmeEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKU2lnbmVkLW9m
Zi1ieTogTGVlIEpvbmVzIDxsZWUuam9uZXNAbGluYXJvLm9yZz4KLS0tCiBkcml2ZXJzL2dwdS9k
cm0vYW1kL2luY2x1ZGUvc2llbm5hX2NpY2hsaWRfaXBfb2Zmc2V0LmggfCAyICstCiAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL2luY2x1ZGUvc2llbm5hX2NpY2hsaWRfaXBfb2Zmc2V0LmggYi9kcml2
ZXJzL2dwdS9kcm0vYW1kL2luY2x1ZGUvc2llbm5hX2NpY2hsaWRfaXBfb2Zmc2V0LmgKaW5kZXgg
MDY4MDBjNmZhMDQ5NS4uYjA3YmMyZGQ4OTVkYyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9pbmNsdWRlL3NpZW5uYV9jaWNobGlkX2lwX29mZnNldC5oCisrKyBiL2RyaXZlcnMvZ3B1
L2RybS9hbWQvaW5jbHVkZS9zaWVubmFfY2ljaGxpZF9pcF9vZmZzZXQuaApAQCAtMzMsNyArMzMs
NyBAQCBzdHJ1Y3QgSVBfQkFTRV9JTlNUQU5DRQogc3RydWN0IElQX0JBU0UKIHsKICAgICBzdHJ1
Y3QgSVBfQkFTRV9JTlNUQU5DRSBpbnN0YW5jZVtNQVhfSU5TVEFOQ0VdOwotfTsKK30gX19tYXli
ZV91bnVzZWQ7CiAKIAogc3RhdGljIGNvbnN0IHN0cnVjdCBJUF9CQVNFIEFUSFVCX0JBU0UgPSB7
IHsgeyB7IDB4MDAwMDBDMDAsIDB4MDI0MDhDMDAsIDAsIDAsIDAgfSB9LAotLSAKMi4yNS4xCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1h
aWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZngK
