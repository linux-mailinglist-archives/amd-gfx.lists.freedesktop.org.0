Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E109287E95
	for <lists+amd-gfx@lfdr.de>; Fri,  9 Aug 2019 17:53:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8556B6EE3D;
	Fri,  9 Aug 2019 15:53:21 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92FFF6EE3D
 for <amd-gfx@lists.freedesktop.org>; Fri,  9 Aug 2019 15:53:20 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id 44so65182856qtg.11
 for <amd-gfx@lists.freedesktop.org>; Fri, 09 Aug 2019 08:53:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iVNEOwhJBbf+CaCzAB/honuMELXkW4eDGM5wAblE+sY=;
 b=HBQ4u3qcv7wJh3XtyXMV0pzo9dWLJkh8lUR/PeTfOak14fCNBKnJYOYpBF5OgcFGOY
 j+qm4GJ9bqtbqHGV6QBpbYK3lnsUZlmbnLD3bX9sSNKWj4Fu/nKmDYLBDZI/jv8KSg0B
 Krhm6oOBwZYiKLx+Sx9bTlhbedGA8DhbfJaZIAUo5X/5IBPozEc61WzuPDJm/GQvHxzB
 w52kxgNMYKPE7Ngi7p1MSMixTBsxfIhL13LRsyOCSqim1XQ31pjB6RKFWe5l5o/GUd/l
 XjFQoySI7rkO1G4unv65NRZ4cmOmaOjg/l5/kYQiHff0lgi+i2xjQA1nh/fSVJ1JMFcD
 ogYw==
X-Gm-Message-State: APjAAAUJ7X8Nco4Hu22oixFSGmBTADZAx9G+OcDmwbbi0eEnx/q9UcqS
 pk4EnweQamhzMrQPflvs142YclZH
X-Google-Smtp-Source: APXvYqy0PPzdBRcT1EyUfSsvy8K3xO1JDygUxoJOBCAbzn14iR6RDTX4tPcl3QJecdCZ3BTxoO6nvw==
X-Received: by 2002:aed:34a6:: with SMTP id x35mr18355964qtd.187.1565365999496; 
 Fri, 09 Aug 2019 08:53:19 -0700 (PDT)
Received: from localhost.localdomain ([71.51.170.6])
 by smtp.gmail.com with ESMTPSA id o5sm42672066qkf.10.2019.08.09.08.53.18
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 09 Aug 2019 08:53:18 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 11/27] drm/amdgpu: fix no interrupt issue for renoir emu
Date: Fri,  9 Aug 2019 10:52:46 -0500
Message-Id: <20190809155302.4733-11-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190809155302.4733-1-alexander.deucher@amd.com>
References: <20190809155302.4733-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iVNEOwhJBbf+CaCzAB/honuMELXkW4eDGM5wAblE+sY=;
 b=tP3vQrwJpsAiwDgUyN8E84iuwVqSG/GsAMud/D573RhwHoLaocmrniaX+j+C9PROaR
 iwUr5iZbjFJW7HX5JQ1SnGjwFUN7G9/3jKhOKu4lzLNk9ECG7ks0dOAyQgKqPfC3fdyc
 /jwEy/4xezZiUetXwUPkDDHqZF+/58FNz/UqlT0uQJFhMLsOiHWLwKLD/bv7qwDI6XDF
 zR93mmVUieG8BOLi4SstOoxDvCNY2SnUK9t43UX+EbwyY+16nNRCqvqi5+HdQooFE4Wk
 iNGWLx9nEMGKBZ7MzlV/ejpW0MCtxs7EA3Xj6LB0t1TsE3DKlUFVICn+UrBEBL10AoeM
 WqZw==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Huang Rui <ray.huang@amd.com>,
 Aaron Liu <aaron.liu@amd.com>, Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogQWFyb24gTGl1IDxhYXJvbi5saXVAYW1kLmNvbT4KCkluIHJlbm9pcidzIGloIG1vZGVs
LCB0aGVyZSdzIGEgY2hhbmdlIGluIG1tSUhfQ0hJQ0tFTgpyZWdpc3RlciwgdGhhdCBsaW1pdHMg
SUggdG8gdXNlIHBoeXNpY2FsIGFkZHJlc3MgZGlyZWN0bHkuClRob3NlIGNoaWNrZW4gYml0cyBu
ZWVkIHRvIGJlIHByb2dyYW1tZWQgZmlyc3QuCgpTaWduZWQtb2ZmLWJ5OiBBYXJvbiBMaXUgPGFh
cm9uLmxpdUBhbWQuY29tPgpSZXZpZXdlZC1ieTogSHVhbmcgUnVpIDxyYXkuaHVhbmdAYW1kLmNv
bT4KUmV2aWV3ZWQtYnk6IEhhd2tpbmcgWmhhbmcgPEhhd2tpbmcuWmhhbmdAYW1kLmNvbT4KQWNr
ZWQtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KU2lnbmVkLW9m
Zi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgotLS0KIGRyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3ZlZ2ExMF9paC5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQs
IDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvdmVnYTEwX2loLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS92
ZWdhMTBfaWguYwppbmRleCBhNTU1MjVhYmI3M2MuLmYxOTI2OGFlYTM4ZCAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdmVnYTEwX2loLmMKKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvdmVnYTEwX2loLmMKQEAgLTI0NSw3ICsyNDUsNyBAQCBzdGF0aWMgaW50
IHZlZ2ExMF9paF9pcnFfaW5pdChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKIAkJV1JFRzMy
X1NPQzE1KE9TU1NZUywgMCwgbW1JSF9SQl9DTlRMLCBpaF9yYl9jbnRsKTsKIAl9CiAKLQlpZiAo
YWRldi0+YXNpY190eXBlID09IENISVBfQVJDVFVSVVMgJiYKKwlpZiAoKGFkZXYtPmFzaWNfdHlw
ZSA9PSBDSElQX0FSQ1RVUlVTIHx8IGFkZXYtPmFzaWNfdHlwZSA9PSBDSElQX1JFTk9JUikgJiYK
IAkJYWRldi0+ZmlybXdhcmUubG9hZF90eXBlID09IEFNREdQVV9GV19MT0FEX0RJUkVDVCkgewog
CQlpZiAoYWRldi0+aXJxLmloLnVzZV9idXNfYWRkcikgewogCQkJaWhfY2hpY2tlbiA9IFJSRUcz
Ml9TT0MxNShPU1NTWVMsIDAsIG1tSUhfQ0hJQ0tFTik7Ci0tIAoyLjIwLjEKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0
CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
