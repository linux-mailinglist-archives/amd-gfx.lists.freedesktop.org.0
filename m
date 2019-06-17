Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CEE3948DE6
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:17:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E561B8938C;
	Mon, 17 Jun 2019 19:17:47 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com
 [IPv6:2607:f8b0:4864:20::829])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEA5289388
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:17:45 +0000 (UTC)
Received: by mail-qt1-x829.google.com with SMTP id y57so12212970qtk.4
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:17:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+ClinhKmvNXRnUZLSuYFSin4h8BKtbcHnaWFwIL/MRs=;
 b=rnpyfPToxcBul0ETQ6h8xAdXVftGwDYDiM80tIdNlKjk/kRJqpYgXpM0hYDH+qvNjJ
 q1XeEz9rGyugi3/pnCBm+3j8n8YsI39eRrmMQanOxGQRbt4PEfBxXkP39yFfGRxXHQwe
 mqzytrOKMtRAk9OIee6CGhLdUYLvQjZ42Z2rS3xMRbdR6cv2JEA5z3sT/GWH8SRIL2+n
 19L48GFBuiQGPFfMx8KGOTSljiNkipbne0vdQngsfHqHaCXzcm+XHVo9T2JKNH/WyavD
 Fomt4KqBCULGpJqy66Y11WRg4BcKUh4a5MqKJxzUGKKzZImNNEM0GgYENPPuus+5udBR
 jWNQ==
X-Gm-Message-State: APjAAAXEO8aR9+Pdx4hZh7upjtal606/4j42TrCW3fMwkUIeh79I2EBe
 857pYE0oGN+ixYN1HdFEQWYXPh3AL2Y=
X-Google-Smtp-Source: APXvYqwIskl3F/Vd/6lUeC4LRwV+VUjL2o3flGsvQsjnUt1g67zmdrSxkhQ0b84q0WNrMQVuSBkCaA==
X-Received: by 2002:ac8:2bd4:: with SMTP id n20mr86816498qtn.131.1560799064318; 
 Mon, 17 Jun 2019 12:17:44 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id s35sm7754876qth.79.2019.06.17.12.17.43
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:17:43 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 041/459] drm/amdgpu: Add common gfx func Disable kcq via kiq
Date: Mon, 17 Jun 2019 14:10:02 -0500
Message-Id: <20190617191700.17899-30-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617191700.17899-1-alexander.deucher@amd.com>
References: <20190617191700.17899-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+ClinhKmvNXRnUZLSuYFSin4h8BKtbcHnaWFwIL/MRs=;
 b=Wqbl/CJcWG3N1XU/RuN3z2xWXgY1gslXnh0VM73p/5qQVDA1JRy5dOz+ngOzvc1W3U
 Cbnjf2geESmfGhBAJaD2ynQnv5iO+eUBKcT3EGP05R9Jgnd1ELJ0PGxIUXo109S8rmdn
 aTFWhSFwamCZlX2BE+BT8gIy8vvrbAprYvHmXtnhGtEXlG4lREM6lgdt5kJbyEc/1qKv
 GShpz7Qe70CgcfUxm/sYwjniXYacaQGN2tMZYbt8xZqgHer8pMbH2ei8+IUPvFGmAMrc
 n1mx36ULEr1J2wAzbfwGtYbqfEdXiFKjE91cIg/PxXcGuH5hbO6JURbYr7ZEI8dMuvP2
 LKMQ==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Rex Zhu <Rex.Zhu@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogUmV4IFpodSA8UmV4LlpodUBhbWQuY29tPgoKc28gY2FuIGJlIHNoYXJlZCB3aXRoIGdm
eDggYW5kIGdmeDkKClJldmlld2VkLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVy
QGFtZC5jb20+ClJldmlld2VkLWJ5OiBIYXdraW5nIFpoYW5nIDxIYXdraW5nLlpoYW5nQGFtZC5j
b20+ClNpZ25lZC1vZmYtYnk6IFJleCBaaHUgPFJleC5aaHVAYW1kLmNvbT4KU2lnbmVkLW9mZi1i
eTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgotLS0KIGRyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9nZnguYyB8IDE5ICsrKysrKysrKysrKysrKysrKysK
IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9nZnguaCB8ICAxICsKIDIgZmlsZXMg
Y2hhbmdlZCwgMjAgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV9nZnguYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV9nZnguYwppbmRleCAxNWU5ZjEyMGZmODQuLmFkMTU5ZTA2Y2ZiMiAxMDA2NDQKLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2dmeC5jCisrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2FtZGdwdV9nZnguYwpAQCAtNDMxLDYgKzQzMSwyNSBAQCB2b2lkIGFtZGdw
dV9nZnhfbXFkX3N3X2Zpbmkoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCiAJCQkgICAgICAm
cmluZy0+bXFkX3B0cik7CiB9CiAKK2ludCBhbWRncHVfZ2Z4X2Rpc2FibGVfa2NxKHN0cnVjdCBh
bWRncHVfZGV2aWNlICphZGV2KQoreworCXN0cnVjdCBhbWRncHVfa2lxICpraXEgPSAmYWRldi0+
Z2Z4LmtpcTsKKwlzdHJ1Y3QgYW1kZ3B1X3JpbmcgKmtpcV9yaW5nID0gJmtpcS0+cmluZzsKKwlp
bnQgaTsKKworCWlmICgha2lxLT5wbWYgfHwgIWtpcS0+cG1mLT5raXFfdW5tYXBfcXVldWVzKQor
CQlyZXR1cm4gLUVJTlZBTDsKKworCWlmIChhbWRncHVfcmluZ19hbGxvYyhraXFfcmluZywga2lx
LT5wbWYtPnVubWFwX3F1ZXVlc19zaXplICoKKwkJCQkJYWRldi0+Z2Z4Lm51bV9jb21wdXRlX3Jp
bmdzKSkKKwkJcmV0dXJuIC1FTk9NRU07CisKKwlmb3IgKGkgPSAwOyBpIDwgYWRldi0+Z2Z4Lm51
bV9jb21wdXRlX3JpbmdzOyBpKyspCisJCWtpcS0+cG1mLT5raXFfdW5tYXBfcXVldWVzKGtpcV9y
aW5nLCAmYWRldi0+Z2Z4LmNvbXB1dGVfcmluZ1tpXSwgdHJ1ZSk7CisKKwlyZXR1cm4gYW1kZ3B1
X3JpbmdfdGVzdF9yaW5nKGtpcV9yaW5nKTsKK30KKwogLyogYW1kZ3B1X2dmeF9vZmZfY3RybCAt
IEhhbmRsZSBnZnggb2ZmIGZlYXR1cmUgZW5hYmxlL2Rpc2FibGUKICAqCiAgKiBAYWRldjogYW1k
Z3B1X2RldmljZSBwb2ludGVyCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfZ2Z4LmggYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZ2Z4LmgK
aW5kZXggMTRkNmYwMWRiMjdiLi5iMjI0MjFmMmI2ZmUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9nZnguaAorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHVfZ2Z4LmgKQEAgLTM1Myw2ICszNTMsNyBAQCBpbnQgYW1kZ3B1X2dmeF9raXFf
aW5pdChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwKIGludCBhbWRncHVfZ2Z4X21xZF9zd19p
bml0KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LAogCQkJICAgdW5zaWduZWQgbXFkX3NpemUp
Owogdm9pZCBhbWRncHVfZ2Z4X21xZF9zd19maW5pKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2
KTsKK2ludCBhbWRncHVfZ2Z4X2Rpc2FibGVfa2NxKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2
KTsKIAogdm9pZCBhbWRncHVfZ2Z4X2NvbXB1dGVfcXVldWVfYWNxdWlyZShzdHJ1Y3QgYW1kZ3B1
X2RldmljZSAqYWRldik7CiB2b2lkIGFtZGdwdV9nZnhfZ3JhcGhpY3NfcXVldWVfYWNxdWlyZShz
dHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldik7Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1n
ZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
