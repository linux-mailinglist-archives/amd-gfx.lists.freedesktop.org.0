Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E481E48F99
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:33:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4366789C52;
	Mon, 17 Jun 2019 19:33:03 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A95A89CF6
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:32:41 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id x18so6933809qkn.13
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:32:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RakSxwE/qG9/nqSWigYKPH/4OkqDAcdYsieYeacwAQg=;
 b=YPwPbDuWahyBX5sy9E/4NWuwp9js3zZfJxdIisfd569TeTW4YZlsvwaMOvMI/kAFh0
 8gxd1wLBlMy5nJPueWK1YTyK4JrxIlO4u4tjO+/Gu5naH2n0zlGfbo3QH4AGDUCKfmHJ
 wZm6iylJGzsFs278Sq8miaWQCU/yEOX1FImKBZ5HfwErUfVYvsbLNsOZ/8jFN/Lq64n6
 GsV9PfEb45vEYRQOi9O1DopQ4Rye9uys+DNHONNfkXoK53goGSZWJ1f7cQ7fIBqpHcp7
 8jbbNvf32c9N9PndRStOrMlzBJNInZKrxg5Zl4H7V7BKDP/lCeWAeTn7K99aM1LC5qGT
 2csA==
X-Gm-Message-State: APjAAAXkbMFPNt8tYCq8MosCdw5XdvHHOHagZGcUtVqrsubfXurpTI3s
 W5bDKo0/9OathKKTfE0BZzb9wOe9gv8=
X-Google-Smtp-Source: APXvYqyNU+eiWdoLnWlWY7rbWzEpkPD7FZ7EkXrXFh2Ib6tm6vesIG8AAjj9Rmhed9BBheJr/2kwNA==
X-Received: by 2002:ae9:c108:: with SMTP id z8mr30053985qki.57.1560799959245; 
 Mon, 17 Jun 2019 12:32:39 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id u2sm7474875qtj.97.2019.06.17.12.32.38
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:32:38 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 295/459] drm/amdgpu/psp: convert ucode id to psp ucode id
Date: Mon, 17 Jun 2019 14:31:02 -0500
Message-Id: <20190617193106.18231-96-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617193106.18231-1-alexander.deucher@amd.com>
References: <20190617193106.18231-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RakSxwE/qG9/nqSWigYKPH/4OkqDAcdYsieYeacwAQg=;
 b=qwY57doACdtAiCaQ4Z4dS+kuJiq8tCfSKxESevA3yspj7FvjtwS5TBepKFSVUqpdGE
 Od3uXuJD9bBnmqfVa/fhUByKB9SMuhLNQaltgieG4jgbbcxKs1TB3FzYnUMVHnldl58s
 nSzM+onNVLkIUHSWUGJkt1fZF5JzWiVS1uHkjN0y6lFj86etpjxqhsHqgzbnMwKYGPNN
 DAExJi1wudgFjbyYdB7KAeAheXYPZISBikJmhtTTmdr5EBlADv1wzbDeB6l8M092GkPb
 844eG0MRoDmXQbJ5zbDVrHOZgoDwUqXpgvMEcZm3MjKa4LIftXWIcCqF8SYTSZfr2srw
 0I3w==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Jack Xiao <Jack.Xiao@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSmFjayBYaWFvIDxKYWNrLlhpYW9AYW1kLmNvbT4KCkNvbnZlcnQgdWNvZGUgaWQgdG8g
dGhlIGNvcnJlc3BvbmRpbmcgcHNwIHVjb2RlIGlkLgoKU2lnbmVkLW9mZi1ieTogSmFjayBYaWFv
IDxKYWNrLlhpYW9AYW1kLmNvbT4KU2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5k
ZXIuZGV1Y2hlckBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV9wc3AuYyB8IDYgKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspCgpkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3BzcC5jIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3BzcC5jCmluZGV4IGJiYzNiMDQ4ODk4Mi4uZTk3
OTRlM2MzOTM2IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
cHNwLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3BzcC5jCkBAIC04
OTEsNiArODkxLDEyIEBAIHN0YXRpYyBpbnQgcHNwX2dldF9md190eXBlKHN0cnVjdCBhbWRncHVf
ZmlybXdhcmVfaW5mbyAqdWNvZGUsCiAJY2FzZSBBTURHUFVfVUNPREVfSURfRE1DVV9JTlRWOgog
CQkqdHlwZSA9IEdGWF9GV19UWVBFX0RNQ1VfSVNSOwogCQlicmVhazsKKwljYXNlIEFNREdQVV9V
Q09ERV9JRF9WQ04wX1JBTToKKwkJKnR5cGUgPSBHRlhfRldfVFlQRV9WQ04wX1JBTTsKKwkJYnJl
YWs7CisJY2FzZSBBTURHUFVfVUNPREVfSURfVkNOMV9SQU06CisJCSp0eXBlID0gR0ZYX0ZXX1RZ
UEVfVkNOMV9SQU07CisJCWJyZWFrOwogCWNhc2UgQU1ER1BVX1VDT0RFX0lEX01BWElNVU06CiAJ
ZGVmYXVsdDoKIAkJcmV0dXJuIC1FSU5WQUw7Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1n
ZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
